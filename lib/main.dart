import 'package:flutter/material.dart';
import 'package:psychepulse/view/screen/home_layout.dart';

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
       home: HomeLayout(),
    );
  }
}

