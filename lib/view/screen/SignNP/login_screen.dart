import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:psychepulse/conf/app_locale.dart';
import 'package:psychepulse/controller/login_controller.dart';
import 'package:psychepulse/main.dart';
import 'package:psychepulse/view/screen/SignNP/register_screen.dart';
import 'package:psychepulse/view/screen/home_screen/home_layout.dart';
import 'package:psychepulse/view/widget/compoents/components.dart';

import 'package:psychepulse/view/widget/defaultFormField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  void initState() {
    if(appLang.contains('ar')) {
      FlutterLocalization.instance.translate('ar');
    }
    super.initState();
  }

    bool? isChecked = false;
  bool passToggle = true;
  TextController textController = TextController();
    final FlutterLocalization localization = FlutterLocalization.instance;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: widthOrHeight0(context, 1) * 0.02,
              right: widthOrHeight0(context, 1) * 0.02,
              top: widthOrHeight0(context, 1) * 0.1),
          child: Form(
              key: textController.formField,
            child: Column(

              children: [
                Column(

                  children: [
                    Text(
                      AppLocale.login.getString(context),
                      style: const TextStyle(fontSize: 37, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                        height: widthOrHeight0(context, 1)*0.068,
                      width: widthOrHeight0(context, 0)*0.5,
                      child: Text(
                        AppLocale.subTitle.getString(context),
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

                  children: [
                    Container(
                      height: widthOrHeight0(context, 1) * 0.50,
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
                                  Text(
                                    AppLocale.emailLogin.getString(context),
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: widthOrHeight0(context, 1) * .015,
                                  ),
                                  TextFormFieldWidget(
                                    iconSufData: Icons.add,
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
                                    AppLocale.passwordLogin.getString(context),
                                    style: const TextStyle(fontWeight: FontWeight.bold),
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
                                    AppLocale.forgotPass.getString(context),
                                    style: const TextStyle(
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
                                              builder: (_) => const HomeLayout()));
                                    }
                                  },


                                  child: Container(
                                    height: widthOrHeight0(context, 0) * .06,

                                    //////////////////edit the width
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Center(
                                      child: Text(
                                        AppLocale.bottomLogin.getString(context),
                                        style: const TextStyle(
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
                Text(AppLocale.doNotHaveAccount.getString(context),style: const TextStyle(fontWeight: FontWeight.w700), ),
              TextButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const RegisterScreen()),
                  );
                },
                child:
                Text(
                  AppLocale.registerNow.getString(context),
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      color: Color(0xffFDCCC5,),
                  ),
                ),
              ),
             ],),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
