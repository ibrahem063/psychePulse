import 'package:flutter/material.dart';
import 'package:psychepulse/view/screen/profile_screen.dart';
import 'package:psychepulse/view/widget/compoents/components.dart';
import 'package:psychepulse/view/widget/post_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controllerShare = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          color: Colors.grey.shade200,
          child: Column(
            children: [
              Container(
                color: Colors.white,
                height:widthOrHeight0(context, 1)*0.095 ,
                child: Padding(
                  padding:  EdgeInsets.only(left:widthOrHeight0(context, 1)*0.012,),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 25,
                        child: Image(
                          image: AssetImage('assets/images/770137_man_512x512.png'),
                        ),
                      ),
                      SizedBox(
                        width: widthOrHeight0(context, 1)*0.008,
                      ),
                      defaultFormField(
                        controller: controllerShare,
                        tybe: TextInputType.text,
                        validator: (p0){},
                        radius: 15,
                        height: widthOrHeight0(context, 1)*0.055,
                        width:widthOrHeight0(context, 1)*0.32,
                        text: 'Share your story'
                      ),
                      SizedBox(
                        width: widthOrHeight0(context, 1)*0.008,
                      ),
                      IconButton(onPressed: (){}, icon: Icon(Icons.add_box_outlined,size:widthOrHeight0(context, 1)*0.04 ,)),
                    ],
                  ),
                ),

              ),
              SizedBox(
                height: widthOrHeight0(context, 1)*0.01,

              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(height:widthOrHeight0(context, 1)*0.01 ,),
                  itemBuilder: (context, index) => Container(
                    color: Colors.white,
                    child: Padding(
                      padding:  EdgeInsets.only(top: widthOrHeight0(context, 1)*0.02),
                      child:  PostWidget(
                        callback: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProfileScreen(),
                              ));
                        },
                        comment: 32,
                        like: 16,
                        path: 'assets/images/something.jpg',
                        name: 'Ola',
                        postText: 'Is this drug useful for anxiety?',
                        postImage: 'assets/images/drug.jpg',
                      ),
                    ),
                  ),
                  itemCount: 7,

                ),
              ),
            ],

          ),
        ));
  }
}