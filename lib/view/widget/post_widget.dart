import 'package:flutter/material.dart';

import '../screen/profile_screen.dart';
import 'compoents/components.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({
    super.key,
    required this.path,
    required this.name,
    required this.postText,
    required this.postImage,
    required this.like,
    required this.comment,
    required this.callback,
  });

  final String path;
  final String name;
  final String postText;
  final String postImage;
  final int like;
  final int comment;
  final Function() callback;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widthOrHeight0(context, 0) * 0.4,
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding:  EdgeInsets.only(left:widthOrHeight0(context, 1)*0.05),
                child: Row(
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
                        GestureDetector(
                          onTap: callback,
                          child: Text(
                            name,
                            style: TextStyle(
                                fontSize: widthOrHeight0(context, 0) * 0.04,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      flex: 1,
                      child: buildContainer(
                          context,
                          '',
                          Icons.more_vert,
                          widthOrHeight0(context, 1) * 0.02,
                          widthOrHeight0(context, 0) * 0.05,
                          Theme.of(context).scaffoldBackgroundColor,
                          Colors.black),
                    )
                  ],
                ),
              ),
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
      ],
    );
  }
}