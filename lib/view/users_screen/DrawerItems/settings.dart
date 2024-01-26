import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:psychepulse/view/widget/compoents/components.dart';
import 'package:psychepulse/view/widget/profile/language.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(widthOrHeight0(context, 1) * 0.02),
            child: Column(
              children: [
                Row(
                  //    mainAxisAlignment: MainAxisAlignment.start,

                  children: [
                    const Icon(
                      Icons.language,
                      size: 35,
                    ),
                    SizedBox(
                      width: widthOrHeight0(context, 0) * 0.02,
                    ),
                    const Text(
                      "Language",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: widthOrHeight0(context, 1) * 0.036,
                ),
                LanguageSelection(),
                SizedBox(
                  height: widthOrHeight0(context, 1) * 0.036,
                ),
                SizedBox(
                  height: widthOrHeight0(context, 1) * 0.07,
                  width: widthOrHeight0(context, 0) * 0.45,
                  child: OutlinedButton(
                    onPressed: () {
                      //click logic here
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.black),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10), // Adjust the border radius as needed
                      ),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.support_agent_sharp,
                            color: Colors.black),
                        SizedBox(width: 8.0),
                        Text(
                          'Support',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(), // Use Spacer instead of SizedBox
                        Icon(Icons.arrow_forward_ios_sharp,
                            color: Colors.black),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: widthOrHeight0(context, 1) * 0.02,
                ),
                SizedBox(
                  height: widthOrHeight0(context, 1) * 0.07,
                  width: widthOrHeight0(context, 0) * 0.45,
                  child: OutlinedButton(
                    onPressed: () {
                      //click logic here
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.black),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10), // Adjust the border radius as needed
                      ),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.people_alt_rounded, color: Colors.black),
                        SizedBox(width: 8.0),
                        Text(
                          'Invite Friends',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(), // Use Spacer instead of SizedBox
                        Icon(Icons.arrow_forward_ios_sharp,
                            color: Colors.black),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
