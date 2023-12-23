import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:psychepulse/view/screen/home_screen/chat_screen/ChatsScreen.dart';
import 'package:psychepulse/view/screen/home_screen/call_screen.dart';
import 'package:psychepulse/view/screen/home_screen/content_screen/content_screen.dart';
import 'package:psychepulse/view/screen/home_screen/doctor_screen/doctor_screen.dart';
import 'package:psychepulse/view/screen/home_screen/drawer_screen.dart';
import 'package:psychepulse/view/screen/home_screen/home_screen.dart';
import 'package:psychepulse/view/screen/home_screen/search_screen.dart';
import 'package:psychepulse/view/widget/compoents/components.dart';
import 'package:flutter_svg/svg.dart';

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
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreen(),));
          }, icon:const Icon(Icons.search_rounded,
          size: 30,) )
        ],
        systemOverlayStyle:SystemUiOverlayStyle(statusBarColor: Colors.grey.shade400),
        title: Padding(
          padding:  EdgeInsets.only(left: widthOrHeight0(context, 1)*0.153),
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
                fontSize: 24,
                color:Theme.of(context).primaryColor,
                fontWeight: FontWeight.w900
              ),
            ),
          ),
        ),
      ),

      drawer: const DrawerScreen(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton:  Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: Colors.white,width: 1,),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [const Color(0xFFFDCCC5),Colors.pink.shade200, Colors.deepPurple.shade200], // Colors to blend
            ),
          ),
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.transparent,
            child: IconButton(
              onPressed: () {
                showdialogonbuttonpress(context);
              },
              icon:const Icon(
                Icons.perm_phone_msg,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
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
            enableFeedback: true,
            elevation: 0,
            showSelectedLabels: false,
            currentIndex: currentIndex,
            onTap: (index) {
              if (index == 2) {

              } else {

                setState(() {
                  currentIndex = index;
                });
              }
            },
            items: [
              BottomNavigationBarItem(
                icon:  SvgPicture.asset(
                  'assets/icons/icons8-home-page.svg',
                  width: 40,
                  height: 40,
                  color: currentIndex == 0
                      ? const Color(0xFFFDCCC5)
                      : Colors.grey.shade300,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon:  SvgPicture.asset(
                  'assets/icons/icons8-open-book-64_1.svg',
                  width: 40,
                  height: 40,
                  color: currentIndex == 1
                      ? const Color(0xFFFDCCC5)
                      : Colors.grey.shade300,
                ),
                label: 'content',
              ),
              BottomNavigationBarItem(
                icon:  SvgPicture.asset(
                  '',
                  width: 40,
                  height: 40,
                  color: currentIndex == 2
                      ? const Color(0xFFFDCCC5)
                      : Colors.grey.shade300,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon:  SvgPicture.asset(
                  'assets/icons/icons8-doctor-50.svg',
                  width: 40,
                  height: 40,
                  color: currentIndex == 3
                      ? const Color(0xFFFDCCC5)
                      : Colors.grey.shade300,
                ),
                label: 'Doctor',
              ),
              BottomNavigationBarItem(
                icon:  SvgPicture.asset(
                  'assets/icons/icons8-chat-100-_1_.svg',
                  width: 40,
                  height: 40,
                  color: currentIndex == 4
                      ? const Color(0xFFFDCCC5)
                      : Colors.grey.shade400,
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
        return const CallScreen();
      },
    );
  }
}
