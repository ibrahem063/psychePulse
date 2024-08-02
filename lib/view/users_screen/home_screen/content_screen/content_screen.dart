import 'package:flutter/material.dart';
import 'package:psychepulse/view/users_screen/web_view.dart';
import 'package:psychepulse/view/widget/compoents/components.dart';
import 'package:url_launcher/url_launcher.dart';

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
        child: Container(
          color: Colors.white,
          child: Padding(
            padding:  EdgeInsets.all(widthOrHeight0(context, 1)*0.03),
            child: Column(
              children: [
                GestureDetector(
                  onTap:(){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AnxietydisorderScreen(),));
                  } ,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width:double.infinity ,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black)
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Anxiety disorder',
                          style:TextStyle(
                            fontFamily: 'jannah',
                            fontSize: 20,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                GestureDetector(
                  onTap:(){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AnxietydisorderScreen(),));
                  } ,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width:double.infinity ,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black)
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Anxiety disorder',
                          style:TextStyle(
                            fontFamily: 'jannah',
                            fontSize: 20,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                GestureDetector(
                  onTap:(){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AnxietydisorderScreen(),));
                  } ,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width:double.infinity ,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black)
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Anxiety disorder',
                          style:TextStyle(
                            fontFamily: 'jannah',
                            fontSize: 20,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
              ],
            )
          ),
        ));
  }
}
