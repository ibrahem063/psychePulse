import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psychepulse/view/widget/compoents/components.dart';
import '../../../widget/styles/icon_broken.dart';
import '../../cubit/cubit.dart';
import '../../cubit/states.dart';
import '../drawer_screen.dart';
import '../search_screen.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<psychepulseCubit, psychepulStates>(
      builder: (context, state) {
        var cubit = psychepulseCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
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
                      offset: const Offset(0, 1),
                    ),
                  ]),
            ),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(IconBroken.Notification)),
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SearchScreen(),
                      ));
                },
                icon: const Icon(
                  IconBroken.Search,
                ),
              ),
            ],
            systemOverlayStyle:
                SystemUiOverlayStyle(statusBarColor: Colors.grey.shade400),
            title: Center(
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    colors: [
                      const Color(0xFFFDCCC5),
                      Colors.pink.shade200,
                      Colors.deepPurple.shade200
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds);
                },
                child: Text(
                  'PsychePulse',
                  style: TextStyle(
                      fontFamily: 'jannah',
                      fontSize: 24,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
          ),
          drawer: DrawerScreen(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Container(
              height: widthOrHeight0(context, 1) * 0.07,
              width: widthOrHeight0(context, 0) * 0.07,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: Colors.white,
                  width: 1,
                ),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    const Color(0xFFFDCCC5),
                    Colors.pink.shade200,
                    Colors.deepPurple.shade200
                  ], // Colors to blend
                ),
              ),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.transparent,
                child: TextButton(
                  onPressed: () {
                    cubit.showdialogonbuttonpress(context);
                  },
                  child: const Text(
                    'Ai',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                  ),

                ),
              ),
            ),
          ),
          bottomNavigationBar: Container(
            height: widthOrHeight0(context, 1)*0.078,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 0.3,
                  blurRadius: 9,
                  offset: const Offset(0,3),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)
              ),
              child: BottomAppBar(
                color: Colors.white,
                notchMargin: 9.0,
                shape: const CircularNotchedRectangle(),
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ...List.generate(
                      cubit.bottomItem.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: IconButton(
                          color: cubit.currentIndex==index?Colors.pink.shade200:Colors.grey,
                          icon: cubit.bottomItem[index],
                          onPressed: () {
                            if (index != 2) {
                              cubit.changeIndex(index);
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: cubit.screen[cubit.currentIndex],
        );
      },
      listener: (context, state) {},
    );
  }
}
