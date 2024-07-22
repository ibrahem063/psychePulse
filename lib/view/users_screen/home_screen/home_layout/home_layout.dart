import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../widget/styles/icon_broken.dart';
import '../../cubit/cubit.dart';
import '../../cubit/states.dart';
import '../drawer_screen.dart';
import '../search_screen.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<psychepulseCubit,psychepulStates>(
      builder:(context, state) {
        var cubit = psychepulseCubit.get(context);
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
              IconButton(onPressed: () {

              }, icon: Icon(IconBroken.Notification)),
              IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreen(),));
              }, icon:Icon(IconBroken.Search,),
              ),
            ],
            systemOverlayStyle:SystemUiOverlayStyle(statusBarColor: Colors.grey.shade400),
            title: Center(
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    colors: [const Color(0xFFFDCCC5),Colors.pink.shade200, Colors.deepPurple.shade200],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds);
                },
                child: Text(
                  'PsychePulse',
                  style: TextStyle(
                      fontFamily: 'jannah',
                      fontSize: 24,
                      color:Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w900
                  ),
                ),
              ),
            ),
          ),
          drawer:  DrawerScreen(),
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
                    cubit.showdialogonbuttonpress(context);
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
                selectedFontSize: 20,
                showSelectedLabels: false,
                elevation: 0,
                currentIndex:cubit.currentIndex,
                onTap: (index) {
                    cubit.changeBottomNav(index);
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(
                      IconBroken.Home,
                      size: 40,
                      color: cubit.currentIndex == 0
                          ? Colors.pink.shade200
                          : Colors.grey.shade300,
                    ),
                    label: 'Home',

                  ),
                  BottomNavigationBarItem(
                    icon:  Icon(
                      size: 40,
                      IconBroken.Bookmark,
                      color: cubit.currentIndex == 1
                          ? Colors.pink.shade200
                          : Colors.grey.shade300,
                    ),
                    label: 'content',
                  ),
                  BottomNavigationBarItem(
                    icon:  SvgPicture.asset(
                      '',
                      color: cubit.currentIndex == 2
                          ?Colors.pink.shade200
                          : Colors.grey.shade300,
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon:  SvgPicture.asset(
                      'assets/icons/icons8-doctor-50.svg',
                      height: 40,
                      color: cubit.currentIndex== 3
                          ? Colors.pink.shade200
                          : Colors.grey.shade300,
                    ),
                    label: 'Doctor',
                  ),
                  BottomNavigationBarItem(
                    icon:  Icon(
                      size: 40,
                      IconBroken.Chat,
                      color: cubit.currentIndex == 4
                          ? Colors.pink.shade200
                          : Colors.grey.shade300,
                    ),
                    label: 'Chats',
                  ),
                ],
              ),
            ),
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
      listener: (context, state) {


      },
    );
  }
}

