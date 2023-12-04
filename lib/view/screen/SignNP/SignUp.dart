import 'package:flutter/material.dart';
import 'package:psychepulse/controller/login_controller.dart';
import 'package:psychepulse/view/screen/SignNP/Login.dart';
import 'package:psychepulse/view/screen/home_screen.dart';
import 'package:psychepulse/view/screen/splash_screen.dart';
import 'package:psychepulse/view/widget/compoents/components.dart';

import 'package:psychepulse/view/widget/defaultFormField.dart';

class SignUP extends StatefulWidget {
  const SignUP({super.key});

  @override
  State<SignUP> createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
    bool? isChecked = false;
  bool passToggle = true;
  TextController textController = TextController();
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.only(
                left: widthOrHeight0(context, 1) * 0.02,
                right: widthOrHeight0(context, 1) * 0.02,
                top: widthOrHeight0(context, 1) * 0.1),
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
                          "Login",
                          style: TextStyle(fontSize: 37, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Text(
                          "welcome bake.. Sign in with your email and password or continue with social\n media",
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
                        height: widthOrHeight0(context, 1) * 0.50,
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
                                  height: widthOrHeight0(context, 1) * 0.02,
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
                                  height: widthOrHeight0(context, 1) * 0.01,
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Forget Password?",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    )),
                                    SizedBox(height: widthOrHeight0(context, 0)*0.01,),
                           
                        
                              Container(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  width: widthOrHeight0(context, 1) * 0.3,
                                  child: InkWell(
                                    onTap: () {
                                      if (textController.formField.currentState!
                                          .validate()) {
                                        textController.controllerEmail.clear();
                                        textController.controllerPass.clear();
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) => const HomeScreen()));
                                      }
                                    },
                                                        
                                    
                                    child: Container(
                                      height: widthOrHeight0(context, 0) * .06,
                                     
                                      //////////////////edit the width
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.circular(5)),
                                      child: const Center(
                                        child: Text(
                                          "LOGIN",
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
                  SizedBox(height: widthOrHeight0(context, 1)*0.095,)
               , Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                         
                Text("You don't have an account?",style: TextStyle(fontWeight: FontWeight.w700), ),
                Container(child: TextButton(onPressed: (){
  Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) => const LogIn()));

                },child: Text("Register now",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15,color: Color(0xffFDCCC5)),),),)
                        
                        
                        //this
                        
                        
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
