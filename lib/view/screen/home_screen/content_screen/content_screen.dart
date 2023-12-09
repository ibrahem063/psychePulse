import 'package:flutter/material.dart';
import 'package:psychepulse/view/screen/home_screen/content_screen/Psychological_disorders_screen.dart';
import 'package:psychepulse/view/screen/home_screen/content_screen/psychotherapy_screen.dart';
import 'package:psychepulse/view/widget/compoents/components.dart';

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
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  defaultButton(
                      text: 'Psychotherapy',
                      width: widthOrHeight0(context, 1)*0.197,
                      borderRadius: 10,
                      function: (){
                        setState(() {
                          isSelected=true;
                          currentIndex=0;
                        });
                      },
                    background:isSelected? const Color(0xFFFDCCC5) :Colors.white,
                    TextColor:isSelected? Colors.white:const Color(0xFFFDCCC5),
                  ),
                  defaultButton(
                    text: 'Psychological disorders',
                    width: widthOrHeight0(context, 1)*0.19,
                    borderRadius: 10,
                    function: (){
                      setState(() {
                        isSelected=false;
                        currentIndex=1;
                      });
                    },
                    background:isSelected? Colors.white:const Color(0xFFFDCCC5),
                    TextColor:isSelected? const Color(0xFFFDCCC5) :Colors.white,
                  ),
                ],
              ),
              SizedBox(
                height: widthOrHeight0(context, 1)*0.04,
              ),
              Expanded(
                flex: 1,
                child:currentIndex==0? const PsychotherapyScreen():const PsychologicalDisordersScreen(),
              ),
            ],
          ),
        ));
  }
}