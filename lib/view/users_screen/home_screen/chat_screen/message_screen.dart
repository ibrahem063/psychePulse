import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../model/message_model.dart';
import '../../../../model/user_model.dart';
import '../../../widget/styles/icon_broken.dart';
import 'package:psychepulse/view/users_screen/cubit/cubit.dart';
import '../../cubit/states.dart';

class ChatDetailsScreen extends StatefulWidget {
  final UserModel userModel;

  const ChatDetailsScreen({
    super.key,
    required this.userModel,
  });

  @override
  State<ChatDetailsScreen> createState() => _ChatDetailsScreenState();
}

class _ChatDetailsScreenState extends State<ChatDetailsScreen> {
  var messageController = TextEditingController();
  @override
  void initState(){
    super.initState();
      psychepulseCubit.get(context).getMessages(widget.userModel);
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<psychepulseCubit, psychepulStates>(
          builder: (context, state) {
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
                backgroundColor: Colors.white,
                titleSpacing: 0.0,
                title: Row(
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage(
                        widget.userModel.image,
                      ),
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      widget.userModel.name,
                      style: const TextStyle(
                        fontFamily: 'jannah',
                      ),
                    ),
                  ],
                ),
              ),
              body: ConditionalBuilder(
                condition: psychepulseCubit.get(context).messages.length >= 0,
                builder: (context) => Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index)
                          {
                            if (psychepulseCubit.get(context).messages[index].senderId == psychepulseCubit.get(context).userModel!.uId) {
                              return buildMessage(
                                model: psychepulseCubit.get(context).messages[index],
                              );
                            }
                            return buildMyMessage(
                              model: psychepulseCubit.get(context).messages[index],
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 15.0,
                          ),
                          itemCount: psychepulseCubit.get(context).messages.length,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(
                            15.0,
                          ),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0,
                                ),
                                child: TextFormField(
                                  controller: messageController,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'type your message here ...',
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 50.0,
                              color: Colors.blue,
                              child: MaterialButton(
                                onPressed: () {
                                  psychepulseCubit .get(context).sendMessage(
                                    receiverId: widget.userModel.uId,
                                    dateTime: DateTime.now().toString(),
                                    text: messageController.text,
                                  );
                                  messageController.clear();
                                },
                                minWidth: 1.0,
                                child: const Icon(
                                  IconBroken.Send,
                                  size: 16.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                fallback: (context) => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          },
        );
  }
}

class buildMessage extends StatelessWidget {
  final MessageModel model;

  const buildMessage({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 10.0,
            ),
            decoration:   BoxDecoration(
              borderRadius: const BorderRadiusDirectional.only(
                topStart: Radius.circular(
                  15.0,
                ),
                topEnd: Radius.circular(
                  15.0,
                ),
                bottomStart: Radius.circular(
                  15.0,
                ),
              ),
              color: Colors.blue.shade400,
            ),
            child: Text(
              model.message,
              style:  const TextStyle(
                color: Colors.white,
                fontFamily: 'jannah',
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class buildMyMessage extends StatelessWidget {
  final MessageModel model;

  const buildMyMessage({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 10.0,
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(
                  15.0,
                ),
                topEnd: Radius.circular(
                  15.0,
                ),
                bottomEnd: Radius.circular(
                  15.0,
                ),
              ),
              color: Colors.grey,
            ),
            child: Text(
              model.message,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'jannah',
              ),
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}