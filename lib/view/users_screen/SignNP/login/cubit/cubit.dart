import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:psychepulse/main.dart';
import 'package:psychepulse/view/users_screen/SignNP/login/cubit/states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context) => BlocProvider.of(context);
  bool showSpin=false;
  void userLogin({
    required String email,
    required String password,
  }) {

    emit(LoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    ).then((value) {
      showSpinMethod();
      print(value.user!.email);
      print(value.user!.uid);
      emit(LoginSuccessState(value.user!.uid));
    })
        .catchError((error)
    {
      showSpinMethod();
      emit(LoginErrorState(error.toString()));
    });
    showSpinMethod();
  }

  void showSpinMethod()
  {
    showSpin=!showSpin;
    emit(ShowSpinState());
  }
  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
    isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(SocialChangePasswordVisibilityState());
  }
  void  language(){
    if(appLang.contains('ar')) {
      FlutterLocalization.instance.translate('ar');
    }
  }
  String selectedValue = 'Languages';
  final FlutterLocalization localization = FlutterLocalization.instance;
  void  Selectlanguage(newValue){
    selectedValue = newValue!;
    if(selectedValue=='English')
    {
      localization.translate('en');
      appLang = 'en';
    }
    else if(selectedValue=='العربية'){
      localization.translate('ar');
      appLang = 'ar';
    }
  }

}