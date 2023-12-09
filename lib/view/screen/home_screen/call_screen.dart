import 'package:flutter/material.dart';
import 'package:psychepulse/view/widget/compoents/components.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({super.key});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.bottomCenter,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      backgroundColor: const Color(0xff79BFF5),
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0,right:16.0 ,top: 16.0 ),
        child: SizedBox(
          height: 170,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor:const Color(0xffC2EAFF),
                        child: IconButton(
                          onPressed: () {},
                          icon:const  Icon(Icons.phone_in_talk),
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      const Text(
                        "Text Conversation",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0,
                        ),
                      ),
                      const Text(
                        "Talk to a life coach chat",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16.0),
                  Container(
                    height: 60.0,
                    width: 1.0,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 16.0),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: const Color(0xffC2EAFF),
                        child: IconButton(
                          onPressed: () {},
                          icon:const Icon(Icons.message),
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      const Text(
                        "voice call",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0,
                        ),
                      ),
                      const Text(
                        "Talk to a life coach phone",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              defaultButton(text:'Talk to your doctor wherever you are',
                function: () {
                Navigator.of(context).pop();
                },
                background: const Color(0xffC2EAFF),
                borderRadius: 10,
                height:  widthOrHeight0(context, 1) * 0.04,
                fontWeight: FontWeight.w500,
                fontSize: 15
              ),
            ],
          ),
        ),
      ),
    );
  }
}