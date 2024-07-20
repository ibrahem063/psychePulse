import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:psychepulse/view/users_screen/cubit/cubit.dart';
import 'package:psychepulse/view/users_screen/home_screen/share_posts/share_posts.dart';
import 'package:psychepulse/view/widget/compoents/components.dart';
import 'package:psychepulse/view/widget/post_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/states.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
TextEditingController controllerShare=TextEditingController();
   @override
   Widget build(BuildContext context) {
     return BlocProvider(
       create: (context) => psychepulseCubit()..getUserData()..getPosts(),
       child: BlocConsumer<psychepulseCubit,psychepulStates>(
         builder: (context, state) {
           return ConditionalBuilder(
             condition:  psychepulseCubit.get(context).posts.length> 0 && psychepulseCubit.get(context).userModel != null,
             builder: (context) =>
                 Container(
                   color: Colors.grey[200],
                   child: SingleChildScrollView(
                     physics: const BouncingScrollPhysics(),
                     child: Column(
                       children:
                       [
                         Container(
                           color: Colors.white,
                           height: widthOrHeight0(context, 1) * 0.095,
                           child: Padding(
                             padding: EdgeInsets.only(
                               left: widthOrHeight0(context, 1) * 0.012,),
                             child: Row(
                               children: [
                                 CircleAvatar(
                                   radius: 25,
                                   backgroundImage:  NetworkImage(
                                       '${psychepulseCubit.get(context).userModel?.image}'),
                                 ),
                                 SizedBox(
                                   width: widthOrHeight0(context, 1) * 0.008,
                                 ),
                                 Expanded(
                                   child: Padding(
                                     padding: const EdgeInsets.only(right: 8.0),
                                     child: defaultFormField(
                                         onTap: () {
                                           Navigator.push(
                                               context,
                                               MaterialPageRoute(
                                                 builder: (context) =>  SharePosts(),
                                               ));
                                         },
                                         controller: controllerShare,
                                         tybe: TextInputType.none,
                                         validator: (p0) {},
                                         radius: 15,
                                         height: widthOrHeight0(context, 1) * 0.055,
                                         text: 'Share your story'
                                     ),
                                   ),
                                 ),
                               ],
                             ),
                           ),
                         ),
                         const SizedBox(
                           height: 10,
                         ),
                         ListView.separated(
                           shrinkWrap: true,
                           physics: const NeverScrollableScrollPhysics(),
                           itemBuilder: (context, index) =>
                               PostWidget(
                                 model: psychepulseCubit.get(context).posts[index],
                                 index:index,
                                 context: context,
                               ),
                           separatorBuilder: (context, index) =>
                           const SizedBox(
                             height: 8.0,
                           ),
                           itemCount: psychepulseCubit.get(context).posts.length,
                         ),
                         const SizedBox(
                           height: 8.0,
                         ),
                       ],
                     ),
                   ),
                 ),
             fallback: (context) => const Center(child: CircularProgressIndicator()),
           );
         },
         listener: (context, state) {

         },
       ),
     );
   }
}
