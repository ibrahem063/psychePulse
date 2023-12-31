import 'package:flutter/material.dart';
import 'package:psychepulse/view/screen/DrawerItems/Subcription.dart';
import 'package:psychepulse/view/screen/DrawerItems/consultations_screen.dart';
import 'package:psychepulse/view/screen/DrawerItems/drug_screen.dart';
import 'package:psychepulse/view/screen/DrawerItems/my_post_screen.dart';
import 'package:psychepulse/view/screen/Profile_page/profile_user_Screen.dart';
import 'package:psychepulse/view/screen/SignNP/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:psychepulse/view/widget/compoents/components.dart';

import '../DrawerItems/settings.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
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
                const CircleAvatar(
                  radius: 30,
                  child: Image(
                    image: AssetImage('assets/images/770137_man_512x512.png'),
                  ),
                ),
                SizedBox(
                  width: widthOrHeight0(context, 1) * 0.02,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Name',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      height: widthOrHeight0(context, 1) * 0.002,
                    ),
                    const Text(
                      'Email@gmail.com',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: widthOrHeight0(context, 1) * 0.002,
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
                  Navigator.push(
                    context,

                    MaterialPageRoute(builder: (context) => const ProfileUserScreen()),
                  );
                },
                child:const Text(
                  'Edit Profile',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: widthOrHeight0(context, 1) * 0.03,
            ),
            drawerButton(
                icon: Icons.forum_outlined, text: 'My post', function: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const MyPostScreen(),));
            }),
            drawerButton(
                icon: Icons.quiz_outlined,
                text: 'consultations',
                function: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ConsultationsScreen(),));
                }),
            drawerButton(
                icon: Icons.drag_indicator_sharp,
                text: 'Drug stimulant',
                function: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>  DrugScreen(),));
                }),
            drawerButton(
                icon: Icons.star_border_outlined,
                text: 'Rate application',
                function: () {}),
            drawerButton(
                icon: Icons.settings_outlined,
                text: 'Settings',
                function: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Settings(),));
                }),
            drawerButton(
                icon: Icons.wallet_outlined,
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
                          setState(() {
                            isSelected = true;

                          }
                          );
                        },
                        child: Container(
                          width: widthOrHeight0(context, 1) * 0.14,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: isSelected
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
                          setState(() {
                            isSelected = false;
                          });
                        },
                        child: Container(
                          width: widthOrHeight0(context, 1) * 0.14,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Colors.grey.shade300
                                : Colors.black,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               Icon(
                                Icons.nightlight_outlined,
                                color:isSelected?  Colors.black:Colors.white,
                              ),
                              SizedBox(
                                width: widthOrHeight0(context, 1) * 0.01,
                              ),
                              Text(
                                'Night',
                                style: TextStyle(
                                  color:isSelected?  Colors.black:Colors.white,
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
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                          (route) => false);
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
  }
}
