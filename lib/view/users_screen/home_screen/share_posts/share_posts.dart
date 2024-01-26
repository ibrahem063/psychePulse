import 'dart:io';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psychepulse/view/widget/styles/icon_broken.dart';

import '../../cubit/cubit.dart';
import '../../cubit/states.dart';
import '../home_layout/home_layout.dart';


class SharePosts extends StatelessWidget
{
  SharePosts({super.key});
  var textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => psychepulseCubit()..getUserData(),
      child: BlocConsumer<psychepulseCubit,psychepulStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var model=psychepulseCubit.get(context).userModel;
          return ConditionalBuilder(
            condition:state is! psychepulGetUserLoadingState ,
            builder:(context) {
              return Scaffold(
                appBar: AppBar(
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
                  title: Center(
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                          colors: [const Color(0xFFFDCCC5),Colors.pink.shade200, Colors.deepPurple.shade200],
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
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        width: 70,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [const Color(0xFFFDCCC5),Colors.pink.shade200, Colors.deepPurple.shade200], // Colors to blend
                          ),
                        ),
                        child: TextButton(onPressed: (){
                          var now = DateTime.now();
                          if (psychepulseCubit.get(context).postImage == null)
                          {
                            psychepulseCubit.get(context).createPost(
                              dateTime: now.toString(),
                              text: textController.text,
                            );
                          } else
                          {
                            psychepulseCubit.get(context).uploadPostImage(
                              dateTime: now.toString(),
                              text: textController.text,
                            );
                          }
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  HomeLayout(),
                              ));
                        }, child: const Text('POST',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white
                          ),)),
                      ),
                    )
                  ],
                ),
                body: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      if(state is psychepulCreatePostLoadingState)
                        const LinearProgressIndicator(),
                      if(state is psychepulCreatePostLoadingState)
                        const SizedBox(
                          height: 10.0,
                        ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 25.0,
                            backgroundImage:NetworkImage("${model?.image}"),
                          ),
                          const SizedBox(
                            width: 15.0,
                          ),
                          Expanded(
                            child: Text(
                              " ${model?.name}",
                              style: const TextStyle(
                                  height: 1.4,
                                  fontSize: 20,
                                  fontFamily: "jannah"
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: textController,
                          decoration: const InputDecoration(
                            hintText: 'what is on your mind ...',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      if(psychepulseCubit.get(context).postImage != null)
                        Center(
                          child: Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              Container(
                                height: 140.0,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0,),
                                ),
                                child: Image(image: FileImage(psychepulseCubit.get(context).postImage!),
                                  fit: BoxFit.cover,),
                              ),
                              IconButton(
                                icon: const CircleAvatar(
                                  radius: 20.0,
                                  child: Icon(
                                    Icons.close,
                                    size: 16.0,
                                  ),
                                ),
                                onPressed: ()
                                {
                                  psychepulseCubit.get(context).removePostImage();
                                },
                              ),
                            ],
                          ),
                        ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: ()
                              {
                                psychepulseCubit.get(context).getPostImage();
                              },
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    IconBroken.Image,
                                    color: Colors.blue,
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    'add photo',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontFamily: "jannah"
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            fallback:(context) => const Center(
              child: CircularProgressIndicator(
                color:  Colors.pink,
                backgroundColor: Colors.white70,
              ),
            )  ,
          );
        },
      ),
    );
  }
}
