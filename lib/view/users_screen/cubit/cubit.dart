import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:psychepulse/model/user_model.dart';
import 'package:psychepulse/view/users_screen/cubit/states.dart';
import 'package:psychepulse/view/widget/constanst/constanst.dart';
import 'package:sqflite/sqflite.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../main.dart';
import '../../../model/doctor_model.dart';
import '../../../model/message_model.dart';
import '../../../model/post_model.dart';
import '../../widget/styles/icon_broken.dart';
import '../home_screen/call_screen.dart';
import '../home_screen/chat_screen/ChatsScreen.dart';
import '../home_screen/content_screen/content_screen.dart';
import '../home_screen/doctor_screen/doctor_screen.dart';
import '../home_screen/home_screen.dart';


class psychepulseCubit extends Cubit<psychepulStates> {
  psychepulseCubit():super(psychepulInitialState());

  static psychepulseCubit get(context)=>BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> bottomItem = [
    const  Icon(
      size: 35,
      IconBroken.Home,
    ),
    const Icon(
      size: 35,
      IconBroken.Bookmark,
    ),
    const Padding(
      padding:EdgeInsets.only(left: 10),
    ),
     const Icon(
       size: 35,
       IconBroken.Shield_Done,
     ),
    const Icon(
      size: 35,
      IconBroken.Message,
    ),
  ];
  List<Widget> screen=[
    HomeScreen(),
    const ContentScreen(),
    const CallScreen(),
    const DoctorScreen(),
    const ChatsScreen(),
  ];
  void changeIndex(int index)
  {
    currentIndex=index;
    emit(modileMainButtonNavState());
  }
  UserModel? userModel;
  void getUserData() {
    emit(psychepulGetUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      userModel = UserModel.frmojson(value.data());
      getPosts();
      getDr();
      getUsers();
      getMessages(userModel!);
      emit(psychepulGetUserSuccessState());
    }).catchError((error) {
      emit(psychepulGetUserErrorState(error.toString()));
    });
  }
  DrModel? drModel;
  List<DrModel> doctor = [];
  void getDr() {
    if (doctor.isEmpty) {
      FirebaseFirestore.instance.collection('doctors').get().then((value) {
        for (var element in value.docs) {
          if (element.data() != drModel) {
            doctor.add(DrModel.frmojson(element.data()));
          }
        }
        emit(psychepulseGetAllDrsSuccessState());
      }).catchError((error) {
        emit(psychepulseGetAllDrErrorState(error.toString()));
      });
    }
  }


  void callDr(String scheme,String path){
    launchUrl(Uri(scheme:scheme,path:path));
  }


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
      source: ImageSource.gallery,
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
        emit(psychepulUploadCoverImageSuccessState());
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
    FirebaseFirestore.instance.collection('posts').
    orderBy('dateTime',descending: true).snapshots()
        .listen((value)
    {
      posts.clear();
      likes.clear();
      postsId.clear();
      for (var element in value.docs) {
        element.reference
            .collection('likes')
            .snapshots()
            .listen((value)
        {
          likes.add(value.docs.length);
          postsId.add(element.id);
          posts.add(PostModel.fromJson(element.data()));
          emit(psychepulseGetPostsSuccessState());
        });
      }

      emit(psychepulseGetPostsSuccessState());
    });
  }

  void likePost(String postId) {
    if (userModel?.uId == null) {
      emit(psychepulLikePostErrorState('User ID is null'));
      return;
    }

    FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('likes')
        .doc(userModel!.uId)
        .set({'like': true})
        .then((_) {
      emit(psychepulseLikePostSuccessState());
    })
        .catchError((error) {
      emit(psychepulLikePostErrorState(error.toString()));
    });
  }


  List<UserModel> users = [];

  void getUsers() {
     if (users.isEmpty) {
       FirebaseFirestore.instance.collection('users').get().then((value) {
        for (var element in value.docs) {
          if (element.data()['uId'] != userModel!.uId) {
            users.add(UserModel.frmojson(element.data()));
          }
        }

        emit(psychepulseGetAllUsersSuccessState());
      }).catchError((error) {
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
  void getMessages(UserModel model)  {
    messages.clear();
      FirebaseFirestore.instance
        .collection('users')
        .doc(userModel?.uId)
        .collection('chats')
        .doc(model.uId)
        .collection('messages')
          .orderBy('time')
        .snapshots()
        .listen((value) {
      messages.clear();
      for (var element in value.docs) {
        messages.add(MessageModel.fromJson(element.data()));
        emit(psychepulseGetMessageSuccessState());
      }

      debugPrint(messages.length.toString());


    });
  }
  late Database database;
  List<Map<dynamic, dynamic>> drugs = [];

  void createDatabase() {
    openDatabase(
      'drugs.db',
      version: 1,
      onCreate: (database, version) {
        database
            .execute(
            'CREATE TABLE drugs(id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT)')
            .then((value) {
          emit(psychepulGetDatabaseState());
        }).catchError((error) {
        });
      },
      onOpen: (database)
      {
        getDataFromDatabase(database);
        emit(psychepulGetDatabaseState());
      },
    ).then((value) {
      database = value;
      emit(psychepulCreateDatabaseState());
    });
  }

  insertToDatabase({
    required String title,
    required String time,
    required String date,
  }) async {
    database.insert(
      'drugs',
      {
        'title': title,
        'date': date,
        'time': time,
      },
    ).then((value) {
      emit(psychepulInsertDatabaseState());
      getDataFromDatabase(database);
    }).catchError((error) {
    });
  }

  void getDataFromDatabase(database)
  {
    emit(psychepulGetDatabaseLoadingState());
    drugs=[];
    database.rawQuery('SELECT * FROM drugs ').then((value) {
      value.forEach((element)
      {
        drugs.add(element);
        emit(psychepulGetDatabaseState());
      });

      emit(psychepulGetDatabaseState());
    });
  }

  void deleteData({
    required int id,
  }) async
  {
    database.rawDelete('DELETE FROM drugs WHERE id = ?', [id])
        .then((value)
    {
      getDataFromDatabase(database);
      emit(psychepulDeleteDatabaseState());
    });
  }

  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;

  void changeBottomSheetState({
    required bool isShow,
    required IconData icon,
  }) {
    isBottomSheetShown = isShow;
    fabIcon = icon;


    emit(psychepulChangeBottomSheetState());
  }

  bool showSpin=false;
  void userLogin({
    required String email,
    required String password,
  }) {

    emit(LoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    ).then((value) {
      showSpinMethod();
      emit(LoginSuccessState(value.user!.uid));
    })
        .catchError((error)
    {
      showSpinMethod();
      emit(LoginErrorState(error.toString()));
    });
    showSpinMethod();
  }

  void showSpinMethod()
  {
    showSpin=!showSpin;
    emit(ShowSpinState());
  }
  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
    isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(SocialChangePasswordVisibilityState());
  }
  void  language(){
    if(appLang.contains('ar')) {
      FlutterLocalization.instance.translate('ar');
    }
  }
  String selectedValue = 'Languages';
  final FlutterLocalization localization = FlutterLocalization.instance;
  void  Selectlanguage(newValue){
    selectedValue = newValue!;
    if(selectedValue=='English')
    {
      localization.translate('en');
      appLang = 'en';
    }
    else if(selectedValue=='العربية'){
      localization.translate('ar');
      appLang = 'ar';
    }
  }

  //register
  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {

    emit(RegisterLoadingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      showSpinMethod();
      userCreate(
        uId: value.user!.uid,
        phone: phone,
        email: email,
        name: name,
      );
    }).catchError((error) {
      showSpinMethod();
      emit(RegisterErrorState(error.toString()));
    });
    showSpinMethod();
  }


  void userCreate({
    required String name,
    required String email,
    required String phone,
    required String uId,
  }) {
    UserModel model = UserModel(
      name: name,
      email: email,
      phone: phone,
      uId: uId,
      cover:
      'https://image.freepik.com/free-photo/photo-attractive-bearded-young-man-with-cherful-expression-makes-okay-gesture-with-both-hands-likes-something-dressed-red-casual-t-shirt-poses-against-white-wall-gestures-indoor_273609-16239.jpg',
      image:
      'https://t3.ftcdn.net/jpg/05/53/79/60/360_F_553796090_XHrE6R9jwmBJUMo9HKl41hyHJ5gqt9oz.jpg',
      isEmailVerified: false,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(CreateUserSuccessState());
    }).catchError((error) {
      emit(CreateUserErrorState(error.toString()));
    });
  }


  void changePasswordVisibility2() {
    isPassword = !isPassword;
    suffix =
    isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(RegisterChangePasswordVisibilityState());
  }
}









