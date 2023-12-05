import 'dart:async';

import 'package:flutter/material.dart';
import 'package:psychepulse/view/screen/SignNP/SignUp.dart';
import 'package:psychepulse/view/widget/compoents/components.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<splash> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 2),
      () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SignUP(),
          )),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthOrHeight0(context, 1),
      height: widthOrHeight0(context, 0),
      child: Image.asset(fit: BoxFit.cover, 'assets/images/splash.png'),
    );
  }
}
//this