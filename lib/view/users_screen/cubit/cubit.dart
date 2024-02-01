import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:psychepulse/model/user_model.dart';
import 'package:psychepulse/view/users_screen/cubit/states.dart';
import 'package:psychepulse/view/widget/constanst/constanst.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../model/doctor_model.dart';
import '../../../model/message_model.dart';
import '../../../model/post_model.dart';
import '../home_screen/call_screen.dart';
import '../home_screen/chat_screen/ChatsScreen.dart';
import '../home_screen/content_screen/content_screen.dart';
import '../home_screen/doctor_screen/doctor_screen.dart';
import '../home_screen/home_screen.dart';


class psychepulseCubit extends Cubit<psychepulStates> {
  psychepulseCubit():super(psychepulInitialState());

  static psychepulseCubit get(context)=>BlocProvider.of(context);
  UserModel? userModel;
  void getUserData() {
    emit(psychepulGetUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      print(value.data());
      userModel = UserModel.frmojson(value.data());
      getMessages(userModel!);
      emit(psychepulGetUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(psychepulGetUserErrorState(error.toString()));
    });
  }
  DrModel? drModel;
  List<DrModel> doctor = [];
  void getDr() {
    if (doctor.length == 0) {
      FirebaseFirestore.instance.collection('doctors').get().then((value) {
        value.docs.forEach((element) {
          if (element.data() != drModel)
            print('${element.data()}===========================');
            doctor.add(DrModel.frmojson(element.data()));
        });
        emit(psychepulseGetAllDrsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(psychepulseGetAllDrErrorState(error.toString()));
      });
    }
  }
  int currentIndex = 0;

  void callDr(String scheme,String path){
    launchUrl(Uri(scheme:scheme,path:path));
  }
  List<Widget> screens = [
    HomeScreen(),
    const ContentScreen(),
    const CallScreen(),
    DoctorScreen(),
    ChatsScreen(),
  ];

  void changeBottomNav(int index) {
    if (index == 2) {

    } else
    {
      currentIndex = index;
      emit(psychepulChangeBottomNavState());
    }
    }
  void showdialogonbuttonpress(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return const CallScreen();
      },
    );
  }
  bool isSelected = true;
  void mood() {
    isSelected =! isSelected;
      emit(psychepulmoodState());
  }
  File? profileImage;
  final picker = ImagePicker();

  Future<void>getProfileImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(psychepulProfileImagePickedSuccessState());
    } else {
      profileImage=File(userModel!.image);
      emit(psychepulProfileImagePickedErrorState());
    }
  }
  File? coverImage;

   Future<void> getCoverImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource?.gallery,
    );

    if (pickedFile != null) {
      coverImage = File(pickedFile.path);
      emit(psychepulCoverImagePickedSuccessState());
    } else {
      coverImage=File(userModel!.cover);
      emit(psychepulCoverImagePickedErrorState());
    }
  }
  void uploadProfileImage({
    required String name,
    required String phone,
    required String email,
  }) {
    emit(psychepulUserUpdateLoadingState());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri?.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        //emit(psychepulseseUploadProfileImageSuccessState());
        print(value);
        updateUser(
            name: name,
            phone: phone,
            email: email,
            image: value,
        );
      }).catchError((error) {
        emit(psychepulUploadProfileImageErrorState());
      });
    }).catchError((error) {
      emit(psychepulUploadProfileImageErrorState());
    });
  }

  void uploadCoverImage({
    required String name,
    required String phone,
    required String email,
  }) {
    emit(psychepulUserUpdateLoadingState());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri?.file(coverImage!.path).pathSegments.last}')
        .putFile(coverImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        //emit(psychepulUploadCoverImageSuccessState());
        print(value);
        updateUser(
          name: name,
          phone: phone,
          cover: value,
          email:email,
        );
      }).catchError((error) {
        emit(psychepulUploadCoverImageErrorState());
      });
    }).catchError((error) {
      emit(psychepulUploadCoverImageErrorState());
    });
  }
  void updateUser({
    required String name,
    required String phone,
    required String email,
    String? cover,
    String? image,
  }) {
    emit(psychepulUserUpdateLoadingState());
    UserModel model = UserModel(
      name: name,
      phone: phone,
      email: email,
      cover: cover ?? userModel!.cover,
      image: image ?? userModel!.image,
      uId: userModel!.uId,
      isEmailVerified: false,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel!.uId)
        .update(model.toMap())
        .then((value) {
      getUserData();
    }).catchError((error) {
      emit(psychepulUserUpdateErrorState());
    });
  }
  File? postImage;

  Future<void>getPostImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      postImage = File(pickedFile.path);
      emit(psychepulProfileImagePickedSuccessState());
    } else {
      postImage=File(userModel!.image);
      emit(psychepulProfileImagePickedErrorState());
    }
  }

  void removePostImage() {
    postImage = null;
    emit(psychepulRemovePostImageState());
  }

  void uploadPostImage({
    required String dateTime,
    required String text,
  }) {
    emit(psychepulCreatePostLoadingState());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('posts/${Uri.file(postImage!.path).pathSegments.last}')
        .putFile(postImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);
        createPost(
          text: text,
          dateTime: dateTime,
          postImage: value,
        );
      }).catchError((error) {
        emit(psychepulCreatePostErrorState());
      });
    }).catchError((error) {
      emit(psychepulCreatePostErrorState());
    });
  }

  void createPost({
    required String dateTime,
    required String text,
    String? postImage,
  }) {
    emit(psychepulCreatePostLoadingState());

    PostModel model = PostModel(
      name: userModel!.name,
      image: userModel!.image,
      uId: userModel!.uId,
      dateTime: dateTime,
      text: text,
      postImage: postImage ?? '',
    );

    FirebaseFirestore.instance
        .collection('posts')
        .add(model.toMap())
        .then((value) {
      emit(psychepulCreatePostSuccessState());
    }).catchError((error) {
      emit(psychepulCreatePostErrorState());
    });
  }

  List<PostModel> posts = [];
  List<String> postsId = [];
  List<int> likes = [];

  void getPosts()
   {
     FirebaseFirestore.instance.collection('posts').get().then((value)
     {
       value.docs.forEach((element)
       {
         element.reference
            .collection('likes').orderBy('dateTime')
            .get()
            .then((value)
        {
          likes.add(value.docs.length);
          postsId.add(element.id);
          posts.add(PostModel.fromJson(element.data()));
          emit(psychepulseGetPostsSuccessState());
        })
            .catchError((error){});
      });

      emit(psychepulseGetPostsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(psychepulseGetPostsErrorState(error.toString()));
    });
  }

  void likePost(String postId) {
    FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('likes')
        .doc(userModel?.uId)
        .set({
      'like': true,
    }).then((value) {
      emit(psychepulseLikePostSuccessState());
    }).catchError((error) {
      emit(psychepulLikePostErrorState(error.toString()));
    });
  }

  List<UserModel> users = [];

  void getUsers() {
     if (users.length == 0) {
       FirebaseFirestore.instance.collection('users').get().then((value) {
        for (var element in value.docs) {
          if (element.data()['uId'] != userModel!.uId) {
            users.add(UserModel.frmojson(element.data()));
          }
        }

        emit(psychepulseGetAllUsersSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(psychepulseGetAllUsersErrorState(error.toString()));
      });
     }
  }



  void sendMessage({
    required String receiverId,
    required String dateTime,
    required String text,
  }) {
    MessageModel model = MessageModel(
      senderId: userModel!.uId,
      receiverId: receiverId,
      time: dateTime,
      message: text,
    );

    // set my chats

    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel!.uId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .add(model.toJson())
        .then((value) {
      emit(psychepulseSendMessageSuccessState());
    }).catchError((error) {
      emit(psychepulseSendMessageErrorState());
    });

    // set receiver chats

    FirebaseFirestore.instance
        .collection('users')
        .doc(receiverId)
        .collection('chats')
        .doc(userModel!.uId)
        .collection('messages')
        .add(model.toJson())
        .then((value) {
      emit(psychepulseSendMessageSuccessState());
    }).catchError((error) {
      emit(psychepulseSendMessageErrorState());
    });
  }

  List<MessageModel> messages = [];
  void getMessages(UserModel Model)  {
      FirebaseFirestore.instance
        .collection('users')
        .doc(userModel?.uId)
        .collection('chats')
        .doc(Model.uId)
        .collection('messages')
        .snapshots()
        .listen((value) {
      messages = [];
      for (var element in value.docs) {
        print('=========${element.data()}============');
        messages.add(MessageModel.fromJson(element.data()));
        emit(psychepulseGetMessageSuccessState());
      }

      debugPrint(messages.length.toString());


    });
  }
}





