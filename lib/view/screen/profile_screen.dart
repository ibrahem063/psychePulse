import 'package:flutter/material.dart';
import 'package:psychepulse/view/widget/compoents/components.dart';

import '../widget/post_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          Text(
            'PsychePulse',
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: widthOrHeight0(context, 1) * 0.03,
                fontWeight: FontWeight.bold),
          ),
        ],
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            size: widthOrHeight0(context, 1) * 0.05,
          ),
        ),
      ),
      body: ListView(
        children: [
          //Profile widget
          Container(
            height: widthOrHeight0(context, 0) * 0.3,
            width: double.infinity,
            decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey))),
            child: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15))),
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        SizedBox(
                          height: widthOrHeight0(context, 0) * 0.11,
                        ),
                        CircleAvatar(
                          foregroundImage:
                              const AssetImage('assets/images.jpg'),

                          backgroundColor: const Color(0xff337180),
                          radius: widthOrHeight0(context, 0) * 0.04,
                        ),
                        Text(
                          'Ola',
                          style: TextStyle(
                              fontSize: widthOrHeight0(context, 0) * 0.04,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildContainer(
                                context,
                                'Add frind',
                                Icons.person_add_alt_1,
                                widthOrHeight0(context, 1) * 0.15,
                                widthOrHeight0(context, 0) * 0.05,
                                Theme.of(context).primaryColor,
                                Theme.of(context).scaffoldBackgroundColor),
                            SizedBox(
                              width: widthOrHeight0(context, 1) * 0.01,
                            ),
                            buildContainer(
                                context,
                                'Message',
                                Icons.send,
                                widthOrHeight0(context, 1) * 0.15,
                                widthOrHeight0(context, 0) * 0.05,
                                Theme.of(context).primaryColor,
                                Theme.of(context).scaffoldBackgroundColor),
                            SizedBox(
                              width: widthOrHeight0(context, 1) * 0.01,
                            ),
                            buildContainer(
                                context,
                                '',
                                Icons.more_vert,
                                widthOrHeight0(context, 1) * 0.03,
                                widthOrHeight0(context, 0) * 0.05,
                                Theme.of(context).primaryColor,
                                Theme.of(context).scaffoldBackgroundColor)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: widthOrHeight0(context, 0) * 0.01,
          ),

          const PostWidget(
            comment: 32,
            like: 16,
            path: 'assets/images.jpg',
            name: 'Ola',
            postText: 'Is this drug useful for anxiety?',
            postImage: 'assets/images/drug.jpg',
          ),
          const PostWidget(
            comment: 32,
            like: 16,
            path: 'assets/images/something.jpg',
            name: 'Ola',
            postText: 'Is this drug useful for anxiety?',
            postImage: 'assets/images/drug.jpg',
          ),
        ],
      ),
    );
  }
}



Container buildContainer(BuildContext context, String text, IconData iconData,
    double width, double height, Color color, Color iconColor) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(10))),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        if (text.contains('')) ...[
          Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).scaffoldBackgroundColor),
          ),
        ],
        Icon(
          iconData,
          color: iconColor,
        )
      ],
    ),
  );
}
