// ignore_for_file: file_names

import 'package:flutter/material.dart';

class TextFormFieldWidget2 extends StatelessWidget {
  final bool passToggle;
  final String labelText;
  final TextEditingController passController;
  final String? Function(String?)? validator;
  final String str;
  final double width;
  final double height;
  final Color color;

  const TextFormFieldWidget2({super.key,
    required this.passToggle,
    required this.passController,
    required this.labelText,
    required this.validator,
    required this.str,
    this.width = 0,
    this.height = 0,
    this.color = Colors.lime,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: (width == 0) ? null : width,
        height: (height == 0) ? null : height,
        child: TextFormField(
         textAlign: TextAlign.left,
          keyboardType: TextInputType.emailAddress,
          obscureText: passToggle,
          controller: passController,
          decoration: InputDecoration(
            filled: true,
            fillColor:Colors.white,
            focusedBorder: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: (color == Colors.lime)
                      ? Colors.grey
                      : color,
                ),
                ),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red.withOpacity(0.8),

                ),
                ),
                focusedErrorBorder:  OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red.withOpacity(0.8),

                ),
                ),
                disabledBorder:  OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red.withOpacity(0.8),
                ),
                ),
            labelText: labelText,
            isDense: true,
            hintText: str,
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
          validator: validator,
        )
        );
  }
}