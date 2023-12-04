import 'package:flutter/material.dart';
import 'package:psychepulse/view/screen/onboarding_screen.dart';
import 'package:psychepulse/view/screen/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xfffdccc5)
      ),
      home: const ProfileScreen(),
    );
  }
}

