import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:psychepulse/conf/app_locale.dart';
import 'package:psychepulse/main.dart';
import 'package:psychepulse/view/screen/SignNP/register_screen.dart';
import 'package:psychepulse/view/screen/home_screen/home_layout.dart';
import 'package:psychepulse/view/widget/compoents/components.dart';



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
  final FlutterLocalization localization = FlutterLocalization.instance;
  String selectedValue = 'Languages';
  bool isChecked=false;
  var email=TextEditingController();
  var password=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Form(
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
                   Text(AppLocale.login.getString(context),
                     style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 40.0,
                  ),),
                  SizedBox(
                    width: 300,
                    child:  Text(AppLocale.subTitle.getString(context),
                      textAlign: TextAlign.center,
                      style:const TextStyle(
                        overflow: TextOverflow.visible,
                        color: Colors.grey,
                        fontSize: 17.0,

                      ),),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(18),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFDCCC5),
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
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: widthOrHeight0(context, 1) * .015,
                          ),
                          defaultFormField(
                            width: widthOrHeight0(context, 1)*0.45,
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
                          SizedBox(
                            height: widthOrHeight0(context, 1) * .03,
                          ),
                          Text(
                            AppLocale.passwordLogin.getString(context),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: widthOrHeight0(context, 1) * .015,
                          ),
                          defaultFormField(
                            width: widthOrHeight0(context, 1)*0.45,
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
                          TextButton(
                            onPressed: (){
                            },
                            child:  Text(AppLocale.forgotPass.getString(context),
                              textAlign: TextAlign.center,
                              style:const TextStyle(
                                decoration: TextDecoration.underline,
                                overflow: TextOverflow.visible,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                textBaseline:TextBaseline.alphabetic ,
                                fontSize: 16.0,
                                decorationThickness: 2.0,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: widthOrHeight0(context, 1) * .025,
                          ),
                          defaultButton(
                            text: AppLocale.bottomLogin.getString(context),
                            background: Colors.black,
                            borderRadius:20.0,
                            width: 350.0,
                            function: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder:(context)=>const HomeLayout(),
                                  ),
                                );
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
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      width:180,
                      decoration: BoxDecoration(
                          color:const Color(0xffFDCCC5,),
                          borderRadius: BorderRadius.circular(10)
                      ),

                      child: Center(
                        child: DropdownButton<String>(
                          style:const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                          iconSize: 30,
                          value: selectedValue,
                          onChanged: (String? newValue) {
                            setState(() {
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
                            });
                          },
                          items: <String>['Languages', 'English', 'العربية']
                              .map<DropdownMenuItem<String>>((String value) {
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
                       Text( AppLocale.doNotHaveAccount.getString(context),
                        textAlign: TextAlign.center,
                        style:const TextStyle(
                          overflow: TextOverflow.visible,
                          color: Colors.grey,
                          fontSize: 18.0,

                        ),),
                      TextButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:(context)=>const RegisterScreen(),
                            ),
                          );
                        },
                        child: Text( AppLocale.registerNow.getString(context),
                          textAlign: TextAlign.center,
                          style:const TextStyle(
                            color: Color(0xffFDCCC5,),
                            fontSize: 18.0,
                            decorationThickness: 2.0,
                            fontWeight: FontWeight.bold
                          ),
                        ),),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
