import 'package:flutter/material.dart';
import 'package:psychepulse/view/widget/compoents/components.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ElevationOverlay.applyOverlay(
        context, Theme.of(context).scaffoldBackgroundColor, 4);
    return Scaffold(
      appBar: AppBar(
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
            postImage: 'assets/drug.jpg',
          ),
          const PostWidget(
            comment: 32,
            like: 16,
            path: 'assets/images.jpg',
            name: 'Ola',
            postText: 'Is this drug useful for anxiety?',
            postImage: 'assets/drug.jpg',
          ),
        ],
      ),
    );
  }
}

class PostWidget extends StatelessWidget {
  const PostWidget({
    super.key,
    required this.path,
    required this.name,
    required this.postText,
    required this.postImage,
    required this.like,
    required this.comment,
  });

  final String path;
  final String name;
  final String postText;
  final String postImage;
  final int like;
  final int comment;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widthOrHeight0(context, 0) * 0.4,
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: widthOrHeight0(context, 0) * 0.03,
                            foregroundImage: AssetImage(path),
                          ),
                          SizedBox(
                            width: widthOrHeight0(context, 1) * 0.03,
                          ),
                          Text(
                            name,
                            style: TextStyle(
                                fontSize: widthOrHeight0(context, 0) * 0.04,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(),
                      buildContainer(
                          context,
                          '',
                          Icons.more_vert,
                          widthOrHeight0(context, 1) * 0.03,
                          widthOrHeight0(context, 0) * 0.05,
                          Theme.of(context).scaffoldBackgroundColor,
                          Colors.black)
                    ],
                  )),
              Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 3,
                          child: Container(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: widthOrHeight0(context, 1) * 0.05,
                                  ),
                                  Text(postText)
                                ],
                              ))),
                      Expanded(
                          flex: 8,
                          child: Container(
                            alignment: Alignment.center,
                            child: Image.asset(
                              postImage,
                              fit: BoxFit.cover,
                            ),
                          )),
                      Expanded(
                          flex: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: widthOrHeight0(context, 1) * 0.04,
                                    height: widthOrHeight0(context, 0) * 0.03,
                                    decoration: const BoxDecoration(
                                        color: Colors.grey,
                                        shape: BoxShape.circle),
                                    child: Icon(
                                      Icons.favorite,
                                      size: widthOrHeight0(context, 0) * 0.015,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                    ),
                                  ),
                                  Text(
                                    like.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff808080)),
                                  )
                                ],
                              ),
                              SizedBox(),
                              Row(
                                children: [
                                  Text(
                                    comment.toString(),
                                    style: const TextStyle(
                                        color: Color(0xff808080),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: widthOrHeight0(context, 1) * 0.01,
                                  ),
                                  const Text(
                                    'COMMENT',
                                    style: TextStyle(
                                        color: Color(0xff808080),
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ],
                          )),
                    ],
                  )),
              Divider(
                endIndent: widthOrHeight0(context, 1) * 0.05,
                indent: widthOrHeight0(context, 1) * 0.05,
              ),
              const Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.favorite_border,
                            color: Color(0xff808080),
                          ),
                          Text(
                            'Like',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff808080)),
                          )
                        ],
                      ),
                      SizedBox(),
                      Column(
                        children: [
                          Icon(
                            Icons.chat_bubble_outline,
                            color: Color(0xff808080),
                          ),
                          Text(
                            'COMMENT',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff808080)),
                          )
                        ],
                      )
                    ],
                  )),
            ],
          ),
        ),
        Divider(
          thickness: widthOrHeight0(context, 0) * 0.005,
        )
      ],
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