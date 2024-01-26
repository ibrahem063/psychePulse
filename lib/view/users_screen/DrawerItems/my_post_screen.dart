import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:psychepulse/view/users_screen/cubit/cubit.dart';
import 'package:psychepulse/view/widget/compoents/components.dart';
import 'package:psychepulse/view/widget/post_widget.dart';

class MyPostScreen extends StatefulWidget {
  const MyPostScreen({super.key});

  @override
  State<MyPostScreen> createState() => _MyPostScreenState();
}

class _MyPostScreenState extends State<MyPostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
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
      body:  Expanded(
            flex: 1,
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height:widthOrHeight0(context, 1)*0.01 ,),
              itemBuilder: (context, index) => Container(
                color: Colors.white,
                child: Padding(
                  padding:  EdgeInsets.only(top: widthOrHeight0(context, 1)*0.02),
                  child:  PostWidget(
                    index: index,
                    context: context,
                    model: psychepulseCubit.get(context).posts[index],
                  ),
                ),
              ),
              itemCount:psychepulseCubit.get(context).posts.length,
            ),
          ),
    );
  }
}
