import 'package:flutter/material.dart';
import 'package:psychepulse/model/network/local/cache_helper.dart';
import 'package:psychepulse/view/widget/compoents/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psychepulse/view/widget/styles/icon_broken.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import '../DrawerItems/Subcription.dart';
import '../DrawerItems/consultations_screen.dart';
import '../DrawerItems/drug_screen.dart';
import '../DrawerItems/my_post_screen.dart';
import '../DrawerItems/settings.dart';
import '../Profile_page/profile_user_Screen.dart';
import '../SignNP/login/login_screen.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';
class DrawerScreen extends StatelessWidget {
  DrawerScreen({super.key});
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => psychepulseCubit()..getUserData(),
      child: BlocConsumer<psychepulseCubit,psychepulStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          var model = psychepulseCubit.get(context).userModel;
          var cubit = psychepulseCubit.get(context);
          return ConditionalBuilder(
            builder: (context) {
              return Drawer(
                surfaceTintColor: Colors.purple,
                backgroundColor: Colors.white.withAlpha(970),
                elevation: 10,
                width: widthOrHeight0(context, 1) * 0.36,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: widthOrHeight0(context, 1) * 0.1,
                    left: widthOrHeight0(context, 1) * 0.02,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage:NetworkImage("${model?.image}"),
                          ),
                          SizedBox(
                            width: widthOrHeight0(context, 1) * 0.02,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${model?.name}',
                                style:
                                const TextStyle(
                                    fontFamily: 'jannah',
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              SizedBox(
                                height: widthOrHeight0(context, 1) * 0.002,
                              ),
                              Text(
                                '${model?.email}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    fontFamily: 'jannah',
                                    color: Colors.black54),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: widthOrHeight0(context, 1) * 0.002,
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,

                            MaterialPageRoute(builder: (context) =>  ProfileUserScreen()),
                          );
                        },
                        child: Container(
                          width: widthOrHeight0(context, 1) * 0.182,
                          height: widthOrHeight0(context, 1) * 0.05,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Color(0xFFFDCCC5),Colors.pink.shade200, Colors.deepPurple.shade200], // Colors to blend
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(IconBroken.Edit,size: 18,color: Colors.white),
                              Text(
                                'Edit Profile',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: widthOrHeight0(context, 1) * 0.03,
                      ),
                      drawerButton(
                          icon: IconBroken.Send, text: 'My post', function: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const MyPostScreen(),));
                      }),
                      drawerButton(
                          icon: IconBroken.Message,
                          text: 'consultations',
                          function: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const ConsultationsScreen(),));
                          }),
                      drawerButton(
                          icon:  IconBroken.Notification,
                          text: 'Drug stimulant',
                          function: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>  DrugScreen(),));
                          }),
                      drawerButton(
                          icon: IconBroken.Star,
                          text: 'Rate application',
                          function: () {}),
                      drawerButton(
                          icon:IconBroken.Setting,
                          text: 'Settings',
                          function: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsScreen(),));
                          }),
                      drawerButton(
                          icon: IconBroken.Wallet,
                          text: 'Subscription information',
                          function: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const SubcriptionScreen(),));
                          }),
                      Padding(
                        padding: EdgeInsets.only(top: widthOrHeight0(context, 1) * 0.1),
                        child: Divider(height: 1, color: Colors.grey.shade300),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: widthOrHeight0(context, 1) * 0.02,
                          left: widthOrHeight0(context, 1) * 0.02,
                        ),
                        child: Row(
                          children: [
                            Container(
                                padding: EdgeInsetsDirectional.all(
                                    widthOrHeight0(context, 1) * 0.001),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    border: Border.all(color: Colors.black)),
                                child: const Icon(
                                  Icons.priority_high,
                                  size: 15,
                                )),
                            SizedBox(
                              width: widthOrHeight0(context, 1) * 0.01,
                            ),
                            const Text(
                              'Colour Scheme',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: widthOrHeight0(context, 1) * 0.02,
                      ),
                      Container(
                        width: widthOrHeight0(context, 1) * 0.3,
                        height: widthOrHeight0(context, 1) * 0.05,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(30)),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: GestureDetector(
                                  onTap: (){
                                    cubit.mood();
                                  },
                                  child: Container(
                                    width: widthOrHeight0(context, 1) * 0.14,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: cubit.isSelected
                                          ? Colors.white
                                          : Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.sunny, color: Colors.black),
                                        SizedBox(
                                          width: widthOrHeight0(context, 1) * 0.01,
                                        ),
                                        const Text(
                                          'Light',
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: GestureDetector(
                                  onTap: (){
                                    cubit.mood();
                                  },
                                  child: Container(
                                    width: widthOrHeight0(context, 1) * 0.14,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: cubit.isSelected
                                          ? Colors.grey.shade300
                                          : Colors.black,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.nightlight_outlined,
                                          color:cubit.isSelected?  Colors.black:Colors.white,
                                        ),
                                        SizedBox(
                                          width: widthOrHeight0(context, 1) * 0.01,
                                        ),
                                        Text(
                                          'Night',
                                          style: TextStyle(
                                            color:cubit.isSelected?  Colors.black:Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: widthOrHeight0(context, 1) * 0.03,
                      ),
                      Container(
                        width: widthOrHeight0(context, 1) * 0.182,
                        height: widthOrHeight0(context, 1) * 0.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Color(0xFFFDCCC5),Colors.pink.shade200, Colors.deepPurple.shade200], // Colors to blend
                          ),
                        ),
                        child: TextButton(
                          onPressed: () {
                            CacheHelper.removeData(
                              key: 'uId',
                            ).then((value)
                            {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (context) =>  LoginScreen()),
                                      (route) => false
                              );
                            });

                          },
                          child:const Text(
                            'Logout',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
           condition: state is! psychepulGetUserLoadingState,
            fallback: (BuildContext context) => const Center(
              child: CircularProgressIndicator(
                color:  Colors.pink,
                backgroundColor: Colors.white70,

              ),
            ) ,
          );
        },
      ),
    );
  }
}



