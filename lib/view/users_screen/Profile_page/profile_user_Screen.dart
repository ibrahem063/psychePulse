import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:psychepulse/view/widget/compoents/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psychepulse/view/widget/styles/icon_broken.dart';

import '../cubit/cubit.dart';
import '../cubit/states.dart';

class ProfileUserScreen extends StatelessWidget {
  ProfileUserScreen({super.key});
  TextEditingController email = TextEditingController();
  TextEditingController Name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>psychepulseCubit()..getUserData(),
      child:BlocConsumer<psychepulseCubit,psychepulStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          var model=psychepulseCubit.get(context).userModel;
          var profileImage = psychepulseCubit.get(context).profileImage;
          var coverImage = psychepulseCubit.get(context).coverImage;
          if(state is psychepulGetUserSuccessState){
            Name.text = model!.name;
            phone.text = model.phone;
            email.text = model.email;
          }
          return ConditionalBuilder(
              fallback:(context)=>  const Center(
                child: CircularProgressIndicator(
                  color:  Colors.pink,
                  backgroundColor: Colors.white70,
                ),
              ) ,
              builder:(context) => Scaffold(
              appBar:  AppBar(
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 0.3,
                          blurRadius: 5,
                          offset: const Offset(0,1),
                        ),
                      ]
                  ),
                ),
                systemOverlayStyle:SystemUiOverlayStyle(statusBarColor: Colors.grey.shade400),
                title: Padding(
                  padding:  EdgeInsets.only(left: widthOrHeight0(context, 1)*0.2),
                  child:  ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                        colors: [Color(0xFFFDCCC5),Colors.pink.shade200, Colors.deepPurple.shade200],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ).createShader(bounds);
                    },
                    child: Text(
                      'PsychePulse',
                      style: TextStyle(
                          fontSize: 25,
                          color:Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w900
                      ),
                    ),
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    if (state is psychepulUserUpdateLoadingState)
                      LinearProgressIndicator(color: Colors.purple.shade300),
                    if (state is psychepulUserUpdateLoadingState)
                      const SizedBox(
                        height: 10.0,
                      ),
                    Stack(
                      children: [
                        Container(
                          height: widthOrHeight0(context, 1) * 0.19,
                          width: double.infinity,
                          child:coverImage==null?Image.network("${model?.cover}",
                          fit: BoxFit.cover):Image.file(coverImage!,
                          fit: BoxFit.cover),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [Color(0xFFFDCCC5),Colors.pink.shade200, Colors.deepPurple.shade200], // Colors to blend
                                  ),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              IconButton(
                                  onPressed: (){
                                    psychepulseCubit.get(context).getCoverImage();
                                  }, icon: Icon(IconBroken.Camera,color: Colors.white,)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: widthOrHeight0(context, 1) * 0.14),
                          child: Container(
                            alignment: Alignment.center,
                            child:  CircleAvatar(
                              radius: 53,
                              backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                              child: CircleAvatar(
                                radius: 50.0,
                                backgroundImage: profileImage==null?
                                NetworkImage('${model?.image}',)
                                    :FileImage(profileImage!)as ImageProvider,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: widthOrHeight0(context, 1) * 0.013,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: GestureDetector(
                            onTap: ()
                            {
                              psychepulseCubit.get(context).getProfileImage();
                            },
                            child: Container(
                              height: 40,
                              width: 180,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [Color(0xFFFDCCC5),Colors.pink.shade200, Colors.deepPurple.shade200], // Colors to blend
                                ),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(IconBroken.Camera,color: Colors.white),
                                    SizedBox(
                                        width: widthOrHeight0(context, 0) * 0.016),
                                    const Text(
                                      'Edit Image',
                                      style: TextStyle(
                                        color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                        fontFamily: 'jannah'
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(IconBroken.Delete,color:Colors.red ),
                          iconSize: widthOrHeight0(context, 1) * 0.03,
                        ),
                      ],
                    ),
                    if (psychepulseCubit.get(context).profileImage != null ||
                        psychepulseCubit.get(context).coverImage != null)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            if (psychepulseCubit.get(context).profileImage != null)
                              Expanded(
                                child: defaultButton(
                                  width: 150,
                                  height: 40,
                                  borderRadius: 10,
                                  function: () {
                                    psychepulseCubit.get(context).uploadProfileImage(
                                      name: Name.text ?? model!.name,
                                      phone: phone.text ?? model!.phone,
                                      email: email.text ?? model!.email,
                                    );
                                  },
                                  text: 'upload profile',
                                ),
                              ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            if (psychepulseCubit.get(context).coverImage != null)
                              Expanded(
                                child: defaultButton(
                                  width: 150,
                                  height: 40,
                                  borderRadius: 10,
                                  function: ()
                                  {
                                    psychepulseCubit.get(context).uploadCoverImage(
                                      name: Name.text ?? model!.name,
                                      phone: phone.text ?? model!.phone,
                                      email: email.text ?? model!.email,
                                    );
                                  },
                                  text: 'upload cover',
                                ),
                              ),
                          ],
                        ),
                      ),
                    Padding(
                      padding: EdgeInsets.all(widthOrHeight0(context, 1) * 0.02),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Name",
                              style: TextStyle(
                                  color: Colors.black,
                                 fontFamily: 'jannah',
                              ),
                            ),
                            SizedBox(
                              height: widthOrHeight0(context, 1) * 0.005,
                            ),
                            defaultFormField(
                              height: 50,
                              controller: Name,
                              tybe: TextInputType.text,
                              validator: (value){
                                return null;
                              },
                              radius: 10.0,
                            ),
                            SizedBox(
                              height: widthOrHeight0(context, 1) * 0.02,
                            ),

                            const Text(
                              "Email ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'jannah'
                              ),
                            ),
                            SizedBox(
                              height: widthOrHeight0(context, 1) * 0.005,
                            ),
                            defaultFormField(
                              height: 50,
                              controller: email ,
                              tybe: TextInputType.emailAddress,
                              validator: (value){
                                return null;
                              },
                              radius: 10.0,
                            ),
                            SizedBox(
                              height: widthOrHeight0(context, 1) * 0.02,
                            ),
                            const Text(
                              "Phone ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'jannah'
                              ),
                            ),
                            SizedBox(
                              height: widthOrHeight0(context, 1) * 0.005,
                            ),
                            defaultFormField(
                              height: 50,
                              controller: phone,
                              tybe: TextInputType.phone,
                              validator: (value){
                                return null;
                              },
                              radius: 10.0,
                            ),
                            SizedBox(
                              height: widthOrHeight0(context, 1) * 0.03,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: [
                                defaultButton(
                                  function: () {
                                    psychepulseCubit.get(context).updateUser(
                                        name: Name.text, phone: phone.text , email: email.text);
                                  },
                                    text: 'Update',
                                    borderRadius: 10,
                                    width: widthOrHeight0(context, 1)*0.2,
                                    height:  widthOrHeight0(context, 1)*0.05
                                ),
                                defaultButton(
                                  function: () {

                                  },
                                    text: 'Delete Account',
                                    borderRadius: 10,
                                    width: widthOrHeight0(context, 1)*0.2,
                                    background:Colors.red,
                                    height:  widthOrHeight0(context, 1)*0.05
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            condition: state is! psychepulGetUserLoadingState,
          );
        },
      ),
    );
  }
}

