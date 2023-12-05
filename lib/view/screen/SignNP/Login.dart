import 'package:flutter/material.dart';
import 'package:psychepulse/controller/login_controller.dart';
import 'package:psychepulse/view/screen/SignNP/CompleteProfile.dart';
import 'package:psychepulse/view/screen/splash_screen.dart';
import 'package:psychepulse/view/widget/compoents/components.dart';
import 'package:psychepulse/view/widget/defaultFormField.dart';


class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool? isChecked = false;
  bool passToggle = true;
  String str="";
  TextController textController = TextController();
    TextController textController2 = TextController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.only(
                left: widthOrHeight0(context, 1) * 0.02,
                right: widthOrHeight0(context, 1) * 0.02,
                top: widthOrHeight0(context, 1) * 0.12),
            child: Form(
                key: textController.formField,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          "Register Account",
                          style: TextStyle(fontSize: 37, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: widthOrHeight0(context, 1)*0.009,),
                      Container(
                          height: widthOrHeight0(context, 1)*0.05,
                          width: widthOrHeight0(context, 0)*0.5,
                        child: Text(
                          "Complete your details or \ncontinue with social media",
                          style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: widthOrHeight0(context, 1) * 0.03,
                  ),
                  Stack(
                    //  child: Container(
                    //     height: widthOrHeight0(context, 1)*0.50,
                    //     width: double.infinity,
                    //     decoration: BoxDecoration(
                        
                    //       shape: BoxShape.rectangle,
                    //       color: Color(0xffFDCCC5),
                    //       borderRadius: BorderRadius.circular(90)
                    //     ),
                    //    ),
                        
                    children: [
                      Container(
                        height: widthOrHeight0(context, 1) * 0.57,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Color(0xffFDCCC5),
                            borderRadius: BorderRadius.circular(90)),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: widthOrHeight0(context, 0) * 0.055,
                              right: widthOrHeight0(context, 0) * 0.025,
                              left: widthOrHeight0(context, 0) * 0.025,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "email",
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: widthOrHeight0(context, 1) * .015,
                                    ),
                                    TextFormFieldWidget(
                                      passToggle: false,
                                      passController: textController.controllerEmail,
                                      labelText: '',
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Enter Email";
                                        }
                                        bool emailValid = RegExp(
                                                r"^[a-zA-Z0-9.a-zA-Z0-9.1#$&'*+-/=?^_ {|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                            .hasMatch(value);
                                        if (!emailValid) {
                                          return "Enter valid Email";
                                        }
                                        return null;
                                      },
                                      str: "youremail@gmail.com",
                                    ),
                                  ],
                                ),
                                 SizedBox(
                                  height: widthOrHeight0(context, 1) * 0.017,
                                ),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Password",
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: widthOrHeight0(context, 1) * .015,
                                    ),
                                    TextFormFieldWidget(
                                      passToggle: true,
                                      passController: textController.controllerPass,
                                      labelText: '',
                                      validator: (value) {
                                        str=value.toString();
                                        if (value!.isEmpty) {
                                          return "Enter Password";
                                        } else if (value.length < 7) {
                                          return "Password length should be more than 7 characters";
                                        } else {
                                          return null;
                                        }
                                      },
                                      str: "your Password",
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: widthOrHeight0(context, 1) * 0.017,
                                ),
                                 Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Confirm Password",
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: widthOrHeight0(context, 1) * .015,
                                    ),
                                    TextFormFieldWidget(
                                      passToggle: true,
                                      passController: textController2.controllerPass,
                                      labelText: '',
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Enter Password";
                                        } else if (value.toString() != str) {
                                          return "Password dosn't match";
                                        } else {
                                          return null;
                                        }
                                      },
                                      str: "your Password",
                                    ),
                                  ],
                                ),
                             
                                 
                          SizedBox(
                                  height: widthOrHeight0(context, 1) * 0.018,
                                ),
                                
                              Container(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  width: widthOrHeight0(context, 1) * 0.34,
                                  child: InkWell(
                                    onTap: () {
                                      if (textController.formField.currentState!
                                          .validate()) {
                                        textController.controllerEmail.clear();
                                        textController.controllerPass.clear();
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) => const Complete()));
                                      }
                                    },
                                                        
                                    
                                    child: Container(
                                      height: widthOrHeight0(context, 0) * .06,
                                    
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.circular(5)),
                                      child: const Center(
                                        child: Text(
                                          "SIGNUP",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontFamily: 'Kadwa',
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),                     ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: widthOrHeight0(context, 1)*0.048,)
               , Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                         //this
                Text("By continuing your confirm that you agree",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.grey[500]), ),
             
                        
                        
                        
               ],)
                
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
