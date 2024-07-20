import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:psychepulse/view/users_screen/cubit/cubit.dart';
import 'package:psychepulse/view/widget/compoents/components.dart';

import '../widget/post_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: [
          SizedBox(
            height: widthOrHeight0(context, 0) * 0.3,
            width: double.infinity,
            child: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: Container(
                        decoration:const BoxDecoration(
                            color: Color(0xFFFDCCC5),
                            borderRadius:  BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15))),
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        SizedBox(
                          height: widthOrHeight0(context, 0) * 0.11,
                        ),
                        CircleAvatar(
                          foregroundImage:
                              const AssetImage('assets/images/something.jpg'),

                          backgroundColor: const Color(0xff337180),
                          radius: widthOrHeight0(context, 0) * 0.04,
                        ),
                        Text(
                          'Ola',
                          style: TextStyle(
                              fontSize: widthOrHeight0(context, 0) * 0.04,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration:const BoxDecoration(
                                borderRadius:  BorderRadius.all(Radius.circular(10)),
                                color:Color(0xFFFDCCC5),
                              ),
                              child: buildContainer(
                                context,
                                'Add frind',
                                Icons.person_add_alt_1,
                                widthOrHeight0(context, 1) * 0.16,
                                widthOrHeight0(context, 0) * 0.05,
                                Theme.of(context).primaryColor,
                              ),
                            ),
                            SizedBox(
                              width: widthOrHeight0(context, 1) * 0.01,
                            ),
                            Container(
                              decoration:const BoxDecoration(
                                borderRadius:  BorderRadius.all(Radius.circular(10)),
                                color:Color(0xFFFDCCC5),
                              ),
                              child: buildContainer(
                                context,
                                'Message',
                                Icons.send,
                                widthOrHeight0(context, 1) * 0.16,
                                widthOrHeight0(context, 0) * 0.05,
                                Theme.of(context).primaryColor,
                              ),
                            ),
                            SizedBox(
                              width: widthOrHeight0(context, 1) * 0.01,
                            ),
                            Container(
                              width:widthOrHeight0(context, 1) * 0.057 ,
                              child: buildContainer(
                                context,
                                '',
                                Icons.more_vert,
                                widthOrHeight0(context, 1) * 0.03,
                                widthOrHeight0(context, 0) * 0.05,
                                Colors.black
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: widthOrHeight0(context, 0) * 0.005,
          ),

          Expanded(
            flex: 1,
            child: ListView.separated(
              separatorBuilder: (context, index) => Divider(thickness: widthOrHeight0(context, 0) * 0.005,),
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
              itemCount: psychepulseCubit.get(context).posts.length,
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildContainer(BuildContext context, String text, IconData iconData,
    double width, double height, Color iconColor) {
  return Container(
    width: width,
    height: height,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        if (text.contains('')) ...[
          Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).scaffoldBackgroundColor),
          ),
        ],
       IconButton(onPressed: (){}, icon:  Icon(
         iconData,
         color: iconColor,
       )),
      ],
    ),
  );
}
