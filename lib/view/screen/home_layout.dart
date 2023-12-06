import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:psychepulse/view/screen/ChatsScreen.dart';
import 'package:psychepulse/view/screen/call_screen.dart';
import 'package:psychepulse/view/screen/content_screen.dart';
import 'package:psychepulse/view/screen/doctor_screen.dart';
import 'package:psychepulse/view/screen/drawer_screen.dart';
import 'package:psychepulse/view/screen/home_screen.dart';
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
          child:  Text(
            'PsychePulse',
            style: TextStyle(
              fontSize: 25,
              color:Theme.of(context).primaryColor,
              fontWeight: FontWeight.w900
            ),
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
                    backgroundColor: Color(0xFFFDB6A8),
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
        return CallScreen();
      },
    );
  }
}
