
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:psychepulse/conf/app_locale.dart';
import 'package:psychepulse/view/screen/SignNP/login_screen.dart';
import 'package:psychepulse/view/widget/compoents/components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_svg/svg.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var email=TextEditingController();
  var password=TextEditingController();
  var ConfirmPassword=TextEditingController();
  var name=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor:Colors.white,
        shadowColor: Colors.white,
      ),
      body: Form(
        key: _formKey,
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text('Register Account',style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 40.0,
                ),),
                const Text('Complete your details or\n continue with social media',
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
                        colors: [Color(0xFFFDCCC5),Colors.pink.shade200, Colors.deepPurple.shade200], // Colors to blend
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
                            height: widthOrHeight0(context, 0)*0.065,
                            width: double.infinity,
                            controller: name,
                            tybe: TextInputType.name,
                            validator: (value){
                              if(value!.isEmpty)
                              {
                                return'name must not be empty ';
                              }
                              return null;
                            },
                            text: 'Enter your Name',
                            suffixIcon: Icons.email_outlined,
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
                            height: widthOrHeight0(context, 0)*0.065,
                            width: double.infinity,
                            controller: email,
                            tybe: TextInputType.emailAddress,
                            validator: (value){
                              if(value!.isEmpty)
                              {
                                return'email must not be empty ';
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
                            height: widthOrHeight0(context, 0)*0.065,
                            width: double.infinity,
                            controller: password,
                            isPassword: true,
                            tybe: TextInputType.visiblePassword,
                            validator: (value){
                              if(value!.isEmpty)
                              {
                                return'password must not be empty ';
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
                              AppLocale.confirmPassword.getString(context),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15
                              ),
                            ),
                          ),
                          defaultFormField(
                            height: widthOrHeight0(context, 0)*0.065,
                            width: double.infinity,
                            controller: ConfirmPassword,
                            isPassword: true,
                            tybe: TextInputType.visiblePassword,
                            validator: (value){
                              if(value!.isEmpty)
                              {
                                return'password must not be empty ';
                              }
                              return null;
                            },
                            text: 'Re-enter your password',
                            suffixIcon: Icons.lock_open_outlined,
                            radius: 20.0,
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Center(
                            child: defaultButton(
                              background: Colors.black,
                              text: 'Continue',
                              borderRadius:20.0,
                              width:  double.infinity,
                              function: () async {
                                if (_formKey.currentState!.validate()) {
                                  try {
                                    final credential = await FirebaseAuth
                                        .instance.createUserWithEmailAndPassword(
                                      email: email.text,
                                       password:password.text,
                                    );
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (
                                            context) => const LoginScreen(),
                                      ),
                                    );
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'weak-password') {
                                      AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.error,
                                        headerAnimationLoop: true,
                                        animType: AnimType.bottomSlide,
                                        title: 'Eroor',
                                        reverseBtnOrder: true,
                                        btnOkOnPress: () {},
                                        btnCancelOnPress: () {},
                                        desc:
                                        'The password provided is too weak',
                                      ).show();
                                      print(
                                          'The password provided is too weak.');
                                    } else
                                    if (e.code == 'email-already-in-use') {
                                      AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.error,
                                        headerAnimationLoop: true,
                                        animType: AnimType.bottomSlide,
                                        title: 'Eroor',
                                        reverseBtnOrder: true,
                                        btnOkOnPress: () {},
                                        btnCancelOnPress: () {},
                                        desc:
                                        'The account already exists for that email.',
                                      ).show();
                                      print(
                                          'The account already exists for that email.');
                                    }
                                  } catch (e) {
                                    print(e);
                                  }
                                }
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
                          colors: [Color(0xFFFDCCC5),Colors.pink.shade200, Colors.deepPurple.shade200], // Colors to blend
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius:20.0 ,
                        child: IconButton(onPressed: (){}, icon:  SvgPicture.asset(
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
                          colors: [Color(0xFFFDCCC5),Colors.pink.shade200, Colors.deepPurple.shade200], // Colors to blend
                        ),
                      ),
                      child: CircleAvatar(
                        radius:20.0 ,
                        backgroundColor: Colors.transparent,
                        child: IconButton(onPressed: (){}, icon:  SvgPicture.asset(
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
                          colors: [Color(0xFFFDCCC5),Colors.pink.shade200, Colors.deepPurple.shade200], // Colors to blend
                        ),
                      ),
                      child: CircleAvatar(
                        radius:20.0 ,
                        backgroundColor: Colors.transparent,
                        child: IconButton(onPressed: (){}, icon:  SvgPicture.asset(
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
    );
  }
}
