import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:psychepulse/view/widget/compoents/components.dart';
import 'package:flutter_svg/svg.dart';

class SubcriptionScreen extends StatefulWidget {
  const SubcriptionScreen({super.key});

  @override
  State<SubcriptionScreen> createState() => _SubcriptionScreenState();
}

class _SubcriptionScreenState extends State<SubcriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 0.3,
                  blurRadius: 5,
                  offset: const Offset(0,1),
                ),
              ]
          ),
        ),
        systemOverlayStyle:SystemUiOverlayStyle(statusBarColor: Colors.grey.shade400),
        title: Padding(
          padding:  EdgeInsets.only(left: widthOrHeight0(context, 1)*0.2),
          child:  ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                colors: [Color(0xFFFDCCC5),Colors.pink.shade200, Colors.deepPurple.shade200],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds);
            },
            child: Text(
              'PsychePulse',
              style: TextStyle(
                  fontSize: 25,
                  color:Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w900
              ),
            ),
          ),
        ),
      ),
      body: Column(

        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(

            padding: EdgeInsets.all(widthOrHeight0(context, 1) * 0.02),
            child: Column(
              children: [
                SizedBox(
                  height: widthOrHeight0(context, 1) * 0.026,
                ),
                defaultPay(titale: 'Visa', price: '10.00jd / month', icon: 'assets/icons/icons8-visa.svg', function: (){}),
                SizedBox(
                  height: widthOrHeight0(context, 1) * 0.02,
                ),
                defaultPay(titale: 'Google pay', price: '10.00jd / month', icon: 'assets/icons/icons8-google-play.svg', function: (){}),
                SizedBox(
                  height: widthOrHeight0(context, 1) * 0.02,
                ),
                defaultPay(titale: 'Visa', price: '3.50jd / week', icon: 'assets/icons/icons8-visa.svg', function: (){}),
                SizedBox(
                  height: widthOrHeight0(context, 1) * 0.02,
                ),
                defaultPay(titale: 'Google pay', price: '3.50jd / week', icon: 'assets/icons/icons8-google-play.svg', function: (){}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
