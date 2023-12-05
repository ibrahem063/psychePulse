import 'package:flutter/material.dart';
import 'package:psychepulse/view/widget/compoents/components.dart';

class GenderSelection extends StatefulWidget {
  @override
  _GenderSelectionState createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  String selectedGender = '';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Radio(
          value: 'male',
          groupValue: selectedGender,
          onChanged: (value) {
            setState(() {
              selectedGender = value.toString();
            });
          },
        ),
        Text('Male'),
        SizedBox(width: widthOrHeight0(context, 0)*0.06),
        Radio(
          value: 'female',
          groupValue: selectedGender,
          onChanged: (value) {
            setState(() {
              selectedGender = value.toString();
            });
          },
        ),
        Text('Female'),
      ],
    );
  }
}