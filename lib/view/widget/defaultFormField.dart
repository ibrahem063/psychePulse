// ignore_for_file: file_names

import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final bool passToggle;
  final String labelText;
  final TextEditingController passController;
  final String? Function(String?)? validator;
  final String str;
  final double width;
  final double height;
  final Color color;
  final IconData? iconSufData;

  const TextFormFieldWidget(
      {super.key,
      required this.passToggle,
      required this.passController,
      required this.labelText,
      required this.validator,
      required this.str,
      this.width = 0,
      this.height = 0,
      this.color = Colors.lime,
      this.iconSufData ,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2, right: 2),
      child: SizedBox(
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
              
              prefixIcon: Icon((iconSufData == Icons.add) ? null : iconSufData),
           
              focusedBorder: OutlineInputBorder(
                 
                
                  ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: (color == Colors.lime)
                        ? const Color(0xffFDCCC5).withOpacity(0.8)
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
          
          ),
    );
  }
}
class TextFormWidget extends StatelessWidget {
  final bool passToggle;
  final TextEditingController passController;
  final String str;
  final double width;
  final double height;
  final Color color;
  final IconData iconSufData;

  const TextFormWidget(
      {super.key,
        required this.passToggle,
        required this.passController,
        required this.str,
        this.width = 0,
        this.height = 0,
        this.color = Colors.lime,
        this.iconSufData = Icons.add});

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
            prefixIcon: Icon((iconSufData == Icons.add) ? null : iconSufData),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: (color == Colors.lime)
                      ? const Color(0xff6482c4).withOpacity(0.8)
                      : color,
                ),

                ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: (color == Colors.lime)
                      ? const Color(0xff6482c4).withOpacity(0.8)
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


            isDense: true,
            hintText: str,

            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
        ));
  }
}