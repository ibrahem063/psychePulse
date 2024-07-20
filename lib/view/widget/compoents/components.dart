import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:psychepulse/controller/cubit/cubit.dart';

Widget defaultButton({
  double width = double.infinity,
  double height = 50,
  Color background = const Color(0xFFFDCCC5),
  Color TextColor = Colors.white,
  final Function()? function,
  required String text,
  double fontSize = 18.0,
  double borderRadius = 0.0,
  TextStyle? textStyle,
  FontWeight fontWeight = FontWeight.w400,
  Color borderColor = Colors.white,
}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(borderRadius),
        border: Border.all(color: borderColor),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.black,
            Colors.blue.shade200,
            Colors.deepPurple.shade200
          ], // Colors to blend
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'jannah',
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
  final Function(String)? onChanged,
  required String? Function(String?)? validator,
  final String? text,
  final String? label,
  Function()? onTap,
  double radius = 0.0,
  IconData? suffixIcon,
  IconData? pref,
  bool isPassword = false,
  Function()? suffixonPressed,
  bool isClickable = true,
  final double? width,
  final double? height,
}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
      ),
      alignment: Alignment.center,
      child: TextFormField(
        controller: controller,
        keyboardType: tybe,
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
        validator: validator,
        obscureText: isPassword,
        textAlign: TextAlign.start,
        onTap: onTap,
        enabled: isClickable,
        decoration: InputDecoration(
          prefixIcon: pref != null
              ? Icon(
                  pref,
                )
              : null,
          hintText: text,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontFamily: 'jannah',
          ),
          labelText: label,
          labelStyle: const TextStyle(
            color: Colors.grey,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(radius),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          suffixIcon: IconButton(
            icon: Icon(suffixIcon),
            onPressed: suffixonPressed,
          ),
        ),
      ),
    );

double widthOrHeight0(BuildContext context, int number) {
  if (number == 0) {
    return MediaQuery.of(context).size.height;
  } else {
    return MediaQuery.of(context).size.height;
  }
}

Widget drawerButton({
  required IconData icon,
  required String text,
  required Function()? function,
}) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon),
            const SizedBox(width: 10),
            Text(
              text,
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
          ],
        ),
        IconButton(
            onPressed: function,
            icon: const Icon(
              Icons.arrow_forward_ios,
              size: 17,
            ))
      ],
    );

Widget ChatsButton({
  required String pathImage,
  required String text,
  required String time,
  required String message,
  required Function()? function,
  double width = 0,
}) =>
    GestureDetector(
      onTap: function,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
              pathImage,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              Row(
                children: [
                  Text(
                    message,
                    style: const TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'jannah'),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    time,
                    style: const TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'jannah'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );

Widget defaultPay({
  required String titale,
  required String price,
  double width = double.infinity,
  double height = 65,
  required String icon,
  required Function()? function,
}) =>
    SizedBox(
      height: height,
      width: width,
      child: OutlinedButton(
        onPressed: function,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.black),
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(10), // Adjust the border radius as needed
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              width: 40,
              height: 40,
            ),
            const SizedBox(width: 8.0),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titale,
                    style: const TextStyle(
                        fontFamily: 'jannah',
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    price,
                    style: TextStyle(
                        fontFamily: 'jannah',
                        fontSize: 12,
                        color: Colors.grey[500],
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios_sharp, color: Colors.black),
          ],
        ),
      ),
    );

Widget buildTaskItem(Map model, context) => Dismissible(
      key: Key(model['id'].toString()),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40.0,
              child: Text(
                '${model['title']}',
                style: TextStyle(fontFamily: 'jannah'),
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${model['time']}',
                    style: const TextStyle(
                      fontFamily: 'jannah',
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${model['date']}',
                    style: const TextStyle(
                      fontFamily: 'jannah',
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            IconButton(
                onPressed: () {
                  AppCubit.get(context).deleteData(
                    id: model['id'],
                  );
                },
                icon: Icon(
                  Icons.delete_outline,
                  color: Colors.red,
                ))
          ],
        ),
      ),
    );

Widget tasksBuilder({
  required BuildContext contexts,
  required List<Map> drugs,
}) =>
    ConditionalBuilder(
      condition: drugs.length > 0,
      builder: (contexts) => ListView.separated(
        itemBuilder: (context, index) {
          return buildTaskItem(drugs[index], context);
        },
        separatorBuilder: (context, index) => myDivider(),
        itemCount: drugs.length,
      ),
      fallback: (context) => const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.menu,
              size: 100.0,
              color: Colors.grey,
            ),
            Text(
              'No Drug Yet, Please Add Some Drugs',
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontFamily: 'jannah'),
            ),
          ],
        ),
      ),
    );

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );
