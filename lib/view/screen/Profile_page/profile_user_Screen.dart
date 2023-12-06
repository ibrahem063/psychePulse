import 'package:flutter/material.dart';
import 'package:psychepulse/controller/signup_controller.dart';
import 'package:psychepulse/view/widget/compoents/components.dart';
import 'package:psychepulse/view/widget/profile/defaultFormField%20copy.dart';
import 'package:psychepulse/view/widget/profile/gender.dart';

class ProfileUserScreen extends StatefulWidget {
  const ProfileUserScreen({super.key});

  @override
  State<ProfileUserScreen> createState() => _ProfileUserScreenState();
}

class _ProfileUserScreenState extends State<ProfileUserScreen> {
  SignUpController signUpController6 = SignUpController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          Text(
            'PsychePulse',
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: widthOrHeight0(context, 1) * 0.03,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: widthOrHeight0(context, 1) * 0.15,
                      width: double.infinity,
                      color: const Color(0xffFEF0ED),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: widthOrHeight0(context, 1) * 0.1),
                      child: Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                          'assets/images/profile.png',
                          height: widthOrHeight0(context, 1) * 0.08,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  height: widthOrHeight0(context, 1) * 0.013,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white, backgroundColor:const Color(0xff2D9BF0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.camera_alt_sharp),
                            SizedBox(
                                width: widthOrHeight0(context, 0) * 0.016),
                            const Text(
                              'Add Image',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.restore_from_trash),
                      iconSize: widthOrHeight0(context, 1) * 0.03,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(widthOrHeight0(context, 1) * 0.02),
                  child: Form(
                    key: signUpController6.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "First Name",
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          height: widthOrHeight0(context, 1) * 0.005,
                        ),
                        TextFormFieldWidget2(
                          passToggle: false,
                          passController: signUpController6.firstName,
                          labelText: '',
                          validator: (value) {
                            return null;
                          },
                          str: 'Ibrahim',
                        ),
                        SizedBox(
                          height: widthOrHeight0(context, 1) * 0.02,
                        ),
                        const Text(
                          "Last Name",
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          height: widthOrHeight0(context, 1) * 0.005,
                        ),
                        TextFormFieldWidget2(
                          passToggle: false,
                          passController: signUpController6.secondname,
                          labelText: '',
                          validator: (value) {
                            return null;
                          },
                          str: 'Khald',
                        ),
                        SizedBox(
                          height: widthOrHeight0(context, 1) * 0.02,
                        ),
                        const Text(
                          "Birth day",
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          height: widthOrHeight0(context, 1) * 0.005,
                        ),
                        TextFormFieldWidget2(
                          passToggle: false,
                          passController: signUpController6.birth,
                          labelText: '',
                          validator: (value) {
                            return null;
                          },
                          str: '06/02/2001',
                        ),
                        SizedBox(
                          height: widthOrHeight0(context, 1) * 0.02,
                        ),
                        GenderSelection(),
                        SizedBox(
                          height: widthOrHeight0(context, 1) * 0.02,
                        ),
                        const Text(
                          "Email ",
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          height: widthOrHeight0(context, 1) * 0.005,
                        ),
                        TextFormFieldWidget2(
                          passToggle: false,
                          passController: signUpController6.doctor,
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
                          str: 'Ibrahim@gmail.com',
                        ),
                        SizedBox(
                          height: widthOrHeight0(context, 1) * 0.04,
                        ),
                        const Text(
                          "Phone ",
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          height: widthOrHeight0(context, 1) * 0.005,
                        ),
                        TextFormFieldWidget2(
                          passToggle: false,
                          passController: signUpController6.country,
                          labelText: '',
                          validator: (value) {
                            return null;
                          },
                          str: 'your phone',
                        ),
                        SizedBox(
                          height: widthOrHeight0(context, 1) * 0.03,
                        ),
                        Center(
                          child: defaultButton(
                              text: 'Update',
                            borderRadius: 10,
                            width: widthOrHeight0(context, 1)*0.25,
                            background:const Color(0xff2D9BF0),
                             height:  widthOrHeight0(context, 1)*0.05
                          ),
                        ),
                        SizedBox(
                          height: widthOrHeight0(context, 1) * 0.03,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
