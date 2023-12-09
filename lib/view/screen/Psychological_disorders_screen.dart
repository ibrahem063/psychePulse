import 'package:flutter/material.dart';
import 'package:psychepulse/view/screen/profile_screen.dart';
import 'package:psychepulse/view/widget/compoents/components.dart';

class PsychologicalDisordersScreen extends StatefulWidget {
  const PsychologicalDisordersScreen({super.key});

  @override
  State<PsychologicalDisordersScreen> createState() => _PsychologicalDisordersScreenState();
}

class _PsychologicalDisordersScreenState extends State<PsychologicalDisordersScreen> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child:ListView.separated(
            itemBuilder: (context, index) => ContentButton(text: 'Thinking errors', function: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ));
            }),
            separatorBuilder: (context, index) =>SizedBox(
              height: widthOrHeight0(context, 1)*0.04,
            ),
            itemCount: 5),
    );
  }
}
