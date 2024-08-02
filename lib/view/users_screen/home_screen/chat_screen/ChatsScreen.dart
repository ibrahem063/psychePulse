import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psychepulse/model/user_model.dart';
import 'package:psychepulse/view/users_screen/cubit/cubit.dart';
import 'package:psychepulse/view/users_screen/cubit/states.dart';
import 'package:psychepulse/view/users_screen/home_screen/chat_screen/message_screen.dart';
import 'package:psychepulse/view/widget/compoents/components.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => psychepulseCubit()..getUserData(),
      child: BlocConsumer<psychepulseCubit, psychepulStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
            condition: psychepulseCubit.get(context).users.length >= 0,
            builder: (context) => Container(
              color: Colors.white,
              child: Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      buildChatItem(psychepulseCubit.get(context).users[index], context),
                  separatorBuilder: (context, index) => myDivider(),
                  itemCount: psychepulseCubit.get(context).users.length,
                ),
              ),
            ),
            fallback: (context) => const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }

  Widget buildChatItem(UserModel model, context) => InkWell(
    onTap: () {
      Navigator.push(
        context,
       MaterialPageRoute(builder: (context) => ChatDetailsScreen(
         userModel: model,),
       ),
      );
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25.0,
            backgroundImage: NetworkImage(
              model.image,
            ),
          ),
          const SizedBox(
            width: 15.0,
          ),
          Text(
            model.name,
            style: const TextStyle(
              height: 1.4,
            ),
          ),
        ],
      ),
    ),
  );
}

