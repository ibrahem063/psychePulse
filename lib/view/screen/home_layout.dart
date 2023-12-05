import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:psychepulse/view/screen/ChatsScreen.dart';
import 'package:psychepulse/view/screen/call_screen.dart';
import 'package:psychepulse/view/screen/content_screen.dart';
import 'package:psychepulse/view/screen/doctor_screen.dart';
import 'package:psychepulse/view/screen/drawer_screen.dart';
import 'package:psychepulse/view/screen/home_screen.dart';
import 'package:psychepulse/view/screen/profile_screen.dart';
import 'package:psychepulse/view/widget/compoents/AlertBox.dart';
import 'package:psychepulse/view/widget/compoents/components.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;
  List<Widget> Screens = [
    const HomeScreen(),
    const ContentScreen(),
    const CallScreen(),
    const DoctorScreen(),
    const ChatsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: widthOrHeight0(context, 1) * 0.2),
          child: const Text(
            'PsychePulse',
            style: TextStyle(
                fontSize: 25,
                color: Color(0xFFFDCCC5),
                fontWeight: FontWeight.w900),
          ),
        ),
      ),
      drawer: const DrawerScreen(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              spreadRadius: 0.5,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          child: BottomNavigationBar(
            elevation: 0,
            showSelectedLabels: false,
            currentIndex: currentIndex,
            onTap: (index) {
              if (index == 2) {
                showdialogonbuttonpress(context);
              } else {
             
                setState(() {
                  currentIndex = index;
                });
              }
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  size: 35,
                  color: currentIndex == 0
                      ? const Color(0xFFFDCCC5)
                      : Colors.grey.shade300,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.menu_book_outlined,
                  size: 35,
                  color: currentIndex == 1
                      ? const Color(0xFFFDCCC5)
                      : Colors.grey.shade300,
                ),
                label: 'content',
              ),
              const BottomNavigationBarItem(
                  icon: CircleAvatar(
                    radius: 22,
                    backgroundColor: Color(0xFFFDCCC5),
                    child: Icon(
                      Icons.perm_phone_msg,
                      color: Colors.white,
                    ),
                  ),
                  label: ''),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.medical_services_outlined,
                  size: 35,
                  color: currentIndex == 3
                      ? const Color(0xFFFDCCC5)
                      : Colors.grey.shade300,
                ),
                label: 'Doctor',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.chat_bubble_outline_sharp,
                  size: 35,
                  color: currentIndex == 4
                      ? const Color(0xFFFDCCC5)
                      : Colors.grey.shade300,
                ),
                label: 'Chats',
              ),
            ],
          ),
        ),
      ),
      body: ConditionalBuilder(
        fallback: (context) => const Center(
            child: CircularProgressIndicator(
          color: Color(0xFFFDCCC5),
        )),
        builder: (context) => Screens[currentIndex],
        condition: currentIndex >= 0,
      ),
    );
  }

  Future<void> showdialogonbuttonpress(BuildContext context) async {
    return showDialog(
      
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
         alignment: Alignment.bottomCenter,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          backgroundColor: Color(0xff79BFF5),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Container(
              height: 180,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Color(0xffC2EAFF),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.phone_in_talk),
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            "Text Conversation",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                            ),
                          ),
                          Text(
                            "Talk to a life coach chat",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 16.0),
                      Container(
                        height: 60.0,
                        width: 1.0,
                        color: Colors.white,
                      ),
                      SizedBox(width: 16.0),
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Color(0xffC2EAFF),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.message),
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            "Text Conversation",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                            ),
                          ),
                          Text(
                            "Talk to a life coach chat",
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
                  SizedBox(height: 16.0),
                  SizedBox(height: widthOrHeight0(context, 1) * 0.003),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xffC2EAFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(0),
                      child: Text(
                        'Talk to your doctor wherever you are',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
