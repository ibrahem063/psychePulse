import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:psychepulse/conf/app_locale.dart';
import 'package:psychepulse/view/widget/compoents/components.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../home_screen/home_layout/home_layout.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  var email = TextEditingController();
  var password = TextEditingController();
  var phone = TextEditingController();
  var name = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit,RegisterStates>(
        listener:(context, state) {
          if (state is RegisterErrorState){
            AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              headerAnimationLoop: true,
              animType: AnimType.bottomSlide,
              title: 'Error',
              reverseBtnOrder: true,
              desc:
              '',
            ).show();
          }
          if (state is CreateUserSuccessState) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (
                    context) =>  HomeLayout(),
              ),
            );
          }
        },
        builder:(context, state) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
              shadowColor: Colors.white,
            ),
            body: ModalProgressHUD(
              inAsyncCall: RegisterCubit.get(context).showSpin,
              child: Form(
                key: _formKey,
                child: Container(
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Text('Register Account', style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 40.0,
                        ),),
                        const Text(
                          'Complete your details or\n continue with social media',
                          textAlign: TextAlign.center,

                          style: TextStyle(
                            overflow: TextOverflow.visible,
                            color: Colors.grey,
                            fontSize: 20.0,

                          ),),
                        const SizedBox(
                          height: 30.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color(0xFFFDCCC5),
                                  Colors.pink.shade200,
                                  Colors.deepPurple.shade200
                                ], // Colors to blend
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(

                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      AppLocale.name.getString(context),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15
                                      ),
                                    ),
                                  ),
                                  defaultFormField(
                                    height: widthOrHeight0(context, 0) * 0.065,
                                    width: double.infinity,
                                    controller: name,
                                    tybe: TextInputType.name,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'name must not be empty ';
                                      }
                                      return null;
                                    },
                                    text: 'Enter your Name',
                                    suffixIcon: Icons.person,
                                    radius: 20.0,
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      AppLocale.emailLogin.getString(context),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15
                                      ),
                                    ),
                                  ),
                                  defaultFormField(
                                    height: widthOrHeight0(context, 0) * 0.065,
                                    width: double.infinity,
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
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      AppLocale.passwordLogin.getString(context),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15
                                      ),
                                    ),
                                  ),
                                  defaultFormField(
                                    height: widthOrHeight0(context, 0) * 0.065,
                                    width: double.infinity,
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
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      AppLocale.Phone.getString(context),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15
                                      ),
                                    ),
                                  ),
                                  defaultFormField(
                                    height: widthOrHeight0(context, 0) * 0.065,
                                    width: double.infinity,
                                    controller: phone,
                                    tybe: TextInputType.phone,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'phone must not be empty ';
                                      }
                                      return null;
                                    },
                                    text: 'Enter your phone',
                                    suffixIcon: Icons.phone,
                                    radius: 20.0,
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  Center(
                                    child: defaultButton(
                                      background: Colors.black,
                                      text: 'Continue',
                                      borderRadius: 20.0,
                                      width: double.infinity,
                                      function: () async {
                                        RegisterCubit.get(context).userRegister(
                                            name: name.text,
                                            email: email.text,
                                            password: password.text,
                                            phone: phone.text
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                ],
                              ),
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
                                    Color(0xFFFDCCC5),
                                    Colors.pink.shade200,
                                    Colors.deepPurple.shade200
                                  ], // Colors to blend
                                ),
                              ),
                              child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 20.0,
                                child: IconButton(onPressed: () {},
                                  icon: SvgPicture.asset(
                                    'assets/icons/icons8-google.svg',
                                    width: 50,
                                    height: 50,
                                  ),),
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
                                    Color(0xFFFDCCC5),
                                    Colors.pink.shade200,
                                    Colors.deepPurple.shade200
                                  ], // Colors to blend
                                ),
                              ),
                              child: CircleAvatar(
                                radius: 20.0,
                                backgroundColor: Colors.transparent,
                                child: IconButton(onPressed: () {},
                                  icon: SvgPicture.asset(
                                    'assets/icons/icons8-facebook.svg',
                                    width: 50,
                                    height: 50,
                                  ),),
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
                                    Color(0xFFFDCCC5),
                                    Colors.pink.shade200,
                                    Colors.deepPurple.shade200
                                  ], // Colors to blend
                                ),
                              ),
                              child: CircleAvatar(
                                radius: 20.0,
                                backgroundColor: Colors.transparent,
                                child: IconButton(onPressed: () {},
                                  icon: SvgPicture.asset(
                                    'assets/icons/icons8-twitter.svg',
                                    width: 50,
                                    height: 50,
                                  ),),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const Text('By continuing your confirm that you agree',
                          textAlign: TextAlign.center,

                          style: TextStyle(
                            overflow: TextOverflow.visible,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.0,
                            fontFamily: 'Muli',

                          ),),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        } ,
      ),
    ) ;
  }
}




