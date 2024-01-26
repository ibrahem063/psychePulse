import 'package:flutter/material.dart';
import 'package:psychepulse/view/widget/compoents/components.dart';

import '../../profile_screen.dart';

class ContentScreen extends StatefulWidget {
  const ContentScreen({super.key});

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  bool isSelected= true;
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(widthOrHeight0(context, 1)*0.03),
          child: ListView.separated(
              itemBuilder: (context, index) => ContentButton(text: 'Thinking errors', function: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileScreen(),
                    ));
              }),
              separatorBuilder: (context, index) =>SizedBox(
                height: widthOrHeight0(context, 1)*0.04,
              ),
              itemCount: 3),
        ));
  }
}