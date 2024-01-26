import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:psychepulse/model/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../model/message_model.dart';
import '../../cubit/cubit.dart';
import '../../cubit/states.dart';

class MessagesScreen extends StatefulWidget {
  final UserModel userModel;

  const MessagesScreen({
    Key? key,
    required this.userModel,
  }) : super(key: key);

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  void initState() {
    super.initState();
    //psychepulseCubit.get(context).getMessages(widget.userModel);
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => psychepulseCubit()..userModel,
      child: BlocBuilder<psychepulseCubit, psychepulStates>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                widget.userModel.name,
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  if (psychepulseCubit.get(context).messages.isNotEmpty)
                    Expanded(
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          if (psychepulseCubit.get(context).messages[index].senderId == psychepulseCubit.get(context).userModel!.uId) {
                            return MyItem(
                              model: psychepulseCubit.get(context).messages[index],
                            );
                          }

                          return UserItem(
                            model: psychepulseCubit.get(context).messages[index],
                          );
                        },
                        separatorBuilder: (context, index) =>SizedBox(),
                           // space10Vertical(context),
                        itemCount: psychepulseCubit.get(context).messages.length,
                      ),
                    ),
                  if (psychepulseCubit.get(context).messages.isEmpty)
                    const Expanded(
                      child: Center(
                        child: CupertinoActivityIndicator(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  //space20Vertical(context),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller:psychepulseCubit.get(context).messageController,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: 'type message',
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                      MaterialButton(
                        minWidth: 1,
                        onPressed: () {
                          psychepulseCubit.get(context).sendMessage(widget.userModel);
                        },
                        child: const Icon(
                          Icons.send,
                          color: Colors.teal,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class MyItem extends StatelessWidget {
  final MessageModel model;

  const MyItem({
    Key? key,
    required this.model,
  }) : super(key: key);

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
            decoration: const BoxDecoration(
              borderRadius: BorderRadiusDirectional.only(
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
              color: Colors.teal,
            ),
            child: Text(
              model.message,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class UserItem extends StatelessWidget {
  final MessageModel model;

  const UserItem({
    Key? key,
    required this.model,
  }) : super(key: key);

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
            decoration: BoxDecoration(
              borderRadius: const BorderRadiusDirectional.only(
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
              color: Colors.grey[200],
            ),
            child: Text(
              model.message,
              style: const TextStyle(),
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}


