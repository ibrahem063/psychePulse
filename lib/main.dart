import 'package:flutter/material.dart';
import 'package:psychepulse/view/screen/Profile_page_user/Profile_user.dart';
import 'package:psychepulse/view/screen/home_layout.dart';
import 'package:psychepulse/view/screen/profile_screen.dart';
import 'package:psychepulse/view/screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xfffdccc5),
      ),
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
       home: Profile_user(),
    );
  }
}

