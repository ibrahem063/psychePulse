import 'package:flutter/material.dart';
import 'package:psychepulse/controller/signup_controller.dart';
import 'package:psychepulse/view/widget/compoents/components.dart';
import 'package:psychepulse/view/widget/defaultFormField.dart';


class Complete extends StatefulWidget {
  const Complete({super.key});

  @override
  State<Complete> createState() => _CompleteState();
}

class _CompleteState extends State<Complete> {
  SignUpController signUpController = SignUpController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: widthOrHeight0(context, 1) * 0.02,
              right: widthOrHeight0(context, 1) * 0.02,
              top: widthOrHeight0(context, 1) * 0.12),
          child: Form(
            key: signUpController.formKey,
            child: Column(
              children: [
                Column(
                  //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Complete Profile",
                      style: TextStyle(
                          fontSize: 37, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: widthOrHeight0(context, 1) * 0.009,
                    ),
                    SizedBox(
                      height: widthOrHeight0(context, 1)*0.05,
                      width: widthOrHeight0(context, 0)*0.5,
                      child: Text(
                        "Complete your details or \ncontinue with social media",
                        style:
                            TextStyle(fontSize: 16, color: Colors.grey[600]),
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
                          color: const Color(0xffFDCCC5),
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
                                  const Text(
                                    "Name",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: widthOrHeight0(context, 1) * .015,
                                  ),
                                  TextFormFieldWidget(
                                      passToggle: false,
                                      passController:
                                          signUpController.firstName,
                                      labelText: '',
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Name must not be empty ';
                                        }
                                        return null;
                                      },
                                      str: 'enter your name'),
                                ],
                              ),
                              SizedBox(
                                height: widthOrHeight0(context, 1) * 0.01,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "phone",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: widthOrHeight0(context, 1) * .015,
                                  ),
                                  TextFormFieldWidget(
                                      passToggle: false,
                                      passController: signUpController.phone,
                                      labelText: '',
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Phone must not be empty ';
                                        }
                                        return null;
                                      },
                                      str: 'your Phone'),
                                ],
                              ),
                            SizedBox(
                                height: widthOrHeight0(context, 1) * 0.01,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Country",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: widthOrHeight0(context, 1) * .015,
                                  ),
                                  TextFormFieldWidget(
                                      passToggle: false,
                                      passController: signUpController.country,
                                      labelText: '',
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'country must not be empty ';
                                        }
                                        return null;
                                      },
                                      str: 'your country'),
                                ],
                              ),
                              SizedBox(
                                height: widthOrHeight0(context, 0) * 0.018,
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  width: widthOrHeight0(context, 1) * 0.34,
                                  child: InkWell(
                                    onTap: () {
                                      if (signUpController
                                          .formKey.currentState!
                                          .validate()) {
                                        signUpController.firstName.clear();
                                        signUpController.phone.clear();
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    const Complete()));
                                      }
                                    },
                                    child: Container(
                                      height:
                                          widthOrHeight0(context, 0) * .06,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(5)),
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
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: widthOrHeight0(context, 1) * 0.048,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "By continuing, you confirm that you agree\nwith our Terms and Conditions",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.grey[500],

                      ),
                       textAlign: TextAlign.center,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
