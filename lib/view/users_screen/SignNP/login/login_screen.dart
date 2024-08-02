import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:psychepulse/conf/app_locale.dart';
import 'package:psychepulse/model/network/local/cache_helper.dart';
import 'package:psychepulse/view/users_screen/SignNP/register/register_screen.dart';
import 'package:psychepulse/view/users_screen/cubit/cubit.dart';
import 'package:psychepulse/view/widget/compoents/components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import '../../cubit/states.dart';
import '../../home_screen/home_layout/home_layout.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    bool isChecked = false;
    var email = TextEditingController();
    var password = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    return BlocConsumer<psychepulseCubit, psychepulStates>(
      listener: (BuildContext context, psychepulStates state) {
        if (state is LoginErrorState) {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            headerAnimationLoop: true,
            animType: AnimType.bottomSlide,
            title: 'Error',
            reverseBtnOrder: true,
            desc: 'The email or password is incorrect',
          ).show();
        }
        if (state is LoginSuccessState) {
          CacheHelper.setData(
            key: 'uId',
            value: state.uId,
          ).then((value) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeLayout(),
              ),
            );
          });
        }
      },
      builder: (BuildContext context, psychepulStates state) {
        return Scaffold(
          body: ModalProgressHUD(
            inAsyncCall: psychepulseCubit.get(context).showSpin,
            child: Form(
              key: _formKey,
              child: Container(
                color: Colors.white,
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: widthOrHeight0(context, 1) * .035,
                        ),
                        Text(
                          AppLocale.login.getString(context),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 40.0,
                          ),
                        ),
                        SizedBox(
                          width: 300,
                          child: Text(
                            AppLocale.subTitle.getString(context),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              overflow: TextOverflow.visible,
                              color: Colors.grey,
                              fontSize: 17.0,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: const EdgeInsets.all(18),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  const Color(0xFFFDCCC5),
                                  Colors.pink.shade200,
                                  Colors.deepPurple.shade200
                                ], // Colors to blend
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: widthOrHeight0(context, 1) * .015,
                                ),
                                Text(
                                  AppLocale.emailLogin.getString(context),
                                  style:
                                      const TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: widthOrHeight0(context, 1) * .015,
                                ),
                                defaultFormField(
                                  width: widthOrHeight0(context, 1) * 0.45,
                                  controller: email,
                                  tybe: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'email must not be empty ';
                                    }
                                    return null;
                                  },
                                  text: 'Enter your email',
                                  suffixIcon: Icons.email_outlined,
                                  radius: 20.0,
                                ),
                                SizedBox(
                                  height: widthOrHeight0(context, 1) * .03,
                                ),
                                Text(
                                  AppLocale.passwordLogin.getString(context),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: widthOrHeight0(context, 1) * .015,
                                ),
                                defaultFormField(
                                  width: widthOrHeight0(context, 1) * 0.45,
                                  controller: password,
                                  isPassword: true,
                                  tybe: TextInputType.visiblePassword,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'password must not be empty ';
                                    }
                                    return null;
                                  },
                                  text: 'Enter your password',
                                  suffixIcon: Icons.lock_open_outlined,
                                  radius: 20.0,
                                ),
                                TextButton(
                                  onPressed: () async {
                                    await FirebaseAuth.instance
                                        .sendPasswordResetEmail(
                                            email: email.text);
                                  },
                                  child: Text(
                                    AppLocale.forgotPass.getString(context),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      decoration: TextDecoration.underline,
                                      overflow: TextOverflow.visible,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      textBaseline: TextBaseline.alphabetic,
                                      fontSize: 16.0,
                                      decorationThickness: 2.0,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: widthOrHeight0(context, 1) * .025,
                                ),
                                defaultButton(
                                  text: AppLocale.bottomLogin
                                      .getString(context),
                                  background: Colors.black,
                                  borderRadius: 20.0,
                                  width: 350.0,
                                  function: () async {
                                    if (_formKey.currentState!.validate()) {
                                      psychepulseCubit.get(context).userLogin(
                                          email: email.text,
                                          password: password.text);
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: widthOrHeight0(context, 1) * .015,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: widthOrHeight0(context, 1) * .025,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    const Color(0xFFFDCCC5),
                                    Colors.pink.shade200,
                                    Colors.deepPurple.shade200
                                  ], // Colors to blend
                                ),
                              ),
                              child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 20.0,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                    'assets/icons/icons8-google.svg',
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20.0),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    const Color(0xFFFDCCC5),
                                    Colors.pink.shade200,
                                    Colors.deepPurple.shade200
                                  ], // Colors to blend
                                ),
                              ),
                              child: CircleAvatar(
                                radius: 20.0,
                                backgroundColor: Colors.transparent,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                    'assets/icons/icons8-facebook.svg',
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20.0),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    const Color(0xFFFDCCC5),
                                    Colors.pink.shade200,
                                    Colors.deepPurple.shade200
                                  ], // Colors to blend
                                ),
                              ),
                              child: CircleAvatar(
                                radius: 20.0,
                                backgroundColor: Colors.transparent,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                    'assets/icons/icons8-twitter.svg',
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: widthOrHeight0(context, 1) * .025,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            width: 180,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  const Color(0xFFFDCCC5),
                                  Colors.pink.shade200,
                                  Colors.deepPurple.shade200
                                ], // Colors to blend
                              ),
                            ),
                            child: Center(
                              child: DropdownButton<String>(
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                                iconSize: 30,
                                value: psychepulseCubit.get(context).selectedValue,
                                onChanged: (String? newValue) {
                                  psychepulseCubit().Selectlanguage(newValue);
                                },
                                items: <String>[
                                  'Languages',
                                  'English',
                                  'العربية'
                                ].map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppLocale.doNotHaveAccount.getString(context),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                overflow: TextOverflow.visible,
                                color: Colors.grey,
                                fontSize: 18.0,
                              ),
                            ),
                            ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return LinearGradient(
                                  colors: [
                                    const Color(0xFFFDCCC5),
                                    Colors.pink.shade200,
                                    Colors.deepPurple.shade200
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ).createShader(bounds);
                              },
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RegisterScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  AppLocale.registerNow.getString(context),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      decorationThickness: 2.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
