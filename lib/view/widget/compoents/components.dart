import 'package:flutter/material.dart';

Widget defaultButton({
  double width=double.infinity,
  double height=50.0,
  Color background=const Color(0xFFFDCCC5),
  Color TextColor= Colors.white,
  final Function()? function,
  required String text,
  double fontSize=18.0,
  double borderRadius=0.0,
  TextStyle? textStyle,
  FontWeight fontWeight = FontWeight.w400,
  Color borderColor =const Color(0xFFFDCCC5),
})=>Container(
  width: width,
  height: height,
  decoration: BoxDecoration(
      borderRadius: BorderRadiusDirectional.circular(borderRadius),
    border: Border.all(color: borderColor ),
    color: background ,
  ),
  clipBehavior: Clip.antiAlias,
  child: MaterialButton(
    onPressed:function,
    child: Text(
      text,
      style: TextStyle(
        fontWeight: fontWeight,
        color: TextColor,
        fontSize: fontSize,
      ),
    ),
  ),
);

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType tybe,
  final Function(String)? onFieldSubmitted,
  final Function(String)?onChanged,
  required String? Function(String?)?validator,
  final String? text,
  final String? label,
  Function()? onTap,
  double radius=0.0,
  IconData? suffixIcon,
  IconData? pref,
  bool isPassword=false,
  Function()?suffixonPressed,
  bool isClickable=true,
  final double? width ,
  final double? height ,
})=>SizedBox(
  width: width,
  height: height,
  child: TextFormField(
    controller: controller,
    keyboardType: tybe,
    onFieldSubmitted: onFieldSubmitted,
    onChanged:onChanged,
    validator:validator,
    obscureText:isPassword,
    style:const TextStyle(
    ),
    onTap:onTap ,
    enabled:isClickable ,
    decoration: InputDecoration(
      prefixIcon: Icon(pref),
     hintText: text,
      labelText: label,
      labelStyle: const TextStyle(
          color: Colors.grey,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:const BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(radius),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      suffixIcon:IconButton(
        icon:Icon(suffixIcon) ,
        onPressed: suffixonPressed,
      ),
    ),
  ),
);

double widthOrHeight0(BuildContext context,int number){
  if(number == 0){
    return MediaQuery.of(context).size.height;
  }else{
    return MediaQuery.of(context).size.height;
  }
}

Widget drawerButton({
required IconData icon,
required String text,
required Function()? function,
})=>Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
       Row(
      children: [
        Icon(icon),
        const SizedBox(width:10),
        Text(
          text,
          style:const TextStyle(
            fontSize: 15,
          ),
        ),
      ],
    ),
    IconButton(
        onPressed: function,
        icon:const Icon(
          Icons.arrow_forward_ios,
          size: 17,
        ))
  ],
);

Widget ContentButton({
  required String text,
  required Function()? function,
  double width=double.infinity,
  d
})=>GestureDetector(
  onTap:function ,
  child: Container(
    padding: EdgeInsets.all(10),
    width:width ,
    height: 60,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: Colors.black)
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style:const TextStyle(
            fontSize: 20,
          ),
        ),
        const Icon(
          Icons.arrow_forward_ios,
          size: 20,
        ),
      ],
    ),
  ),
);
