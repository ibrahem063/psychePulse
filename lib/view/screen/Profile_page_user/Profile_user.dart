import 'package:flutter/material.dart';
import 'package:psychepulse/controller/signup_controller.dart';
import 'package:psychepulse/view/screen/SignNP/SignUp.dart';
import 'package:psychepulse/view/screen/home_screen.dart';
import 'package:psychepulse/view/widget/profile/CircularProfilePicture.dart';
import 'package:psychepulse/view/widget/profile/Multi.dart';
import 'package:psychepulse/view/widget/compoents/components.dart';
import 'package:psychepulse/view/widget/profile/defaultFormField%20copy.dart';
import 'package:psychepulse/view/widget/defaultFormField.dart';
import 'package:psychepulse/view/widget/profile/gender.dart';
import 'package:flutter/material.dart';
import 'package:psychepulse/controller/signup_controller.dart';
import 'package:psychepulse/view/screen/SignNP/SignUp.dart';
import 'package:psychepulse/view/screen/home_screen.dart';
import 'package:psychepulse/view/widget/profile/CircularProfilePicture.dart';
import 'package:psychepulse/view/widget/profile/Multi.dart';
import 'package:psychepulse/view/widget/compoents/components.dart';
import 'package:psychepulse/view/widget/profile/defaultFormField copy.dart';
import 'package:psychepulse/view/widget/defaultFormField.dart';
import 'package:psychepulse/view/widget/profile/gender.dart';
import 'package:file_picker/file_picker.dart';

class Profile_user extends StatefulWidget {
  const Profile_user({super.key});

  @override
  State<Profile_user> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<Profile_user> {
  SignUpController signUpController6 = SignUpController();
  String? pickedFilePath;

  Future<void> _pickPDF() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        pickedFilePath = result.files.single.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: widthOrHeight0(context, 1) * 0.15,
                        width: double.infinity,
                        color: Color(0xffFEF0ED),
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
                            backgroundColor: Color(0xff2D9BF0),
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.camera_alt_sharp),
                              SizedBox(
                                  width: widthOrHeight0(context, 0) * 0.016),
                              Text(
                                'Add Image',
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.restore_from_trash),
                        iconSize: widthOrHeight0(context, 1) * 0.03,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(widthOrHeight0(context, 1) * 0.02),
                    child: Container(
                      width: widthOrHeight0(context, 0) * 0.5,
                      child: Form(
                        key: signUpController6.formKey,
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
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
                                  validator: (value) {},
                                  str: 'Ibrahim',
                                ),
                                SizedBox(
                                  height: widthOrHeight0(context, 1) * 0.02,
                                ),
                                Text(
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
                                  validator: (value) {},
                                  str: 'Khald',
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
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
                                  validator: (value) {},
                                  str: '06/02/2001',
                                ),
                                SizedBox(
                                  height: widthOrHeight0(context, 1) * 0.02,
                                ),
                                GenderSelection(),
                                SizedBox(
                                  height: widthOrHeight0(context, 1) * 0.02,
                                ),
                                Text(
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
                                Text(
                                  "ID ",
                                  style: TextStyle(color: Colors.black),
                                ),
                                SizedBox(
                                  height: widthOrHeight0(context, 1) * 0.005,
                                ),
                                TextFormFieldWidget2(
                                  passToggle: false,
                                  passController: signUpController6.country,
                                  labelText: '',
                                  validator: (value) {},
                                  str: 'your id',
                                ),
                                SizedBox(
                                  height: widthOrHeight0(context, 1) * 0.015
                                  ,
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.upload_file),
                                      onPressed: _pickPDF,
                                      tooltip: 'Upload PDF',
                                    ),
                                    Text(
                                      "Enter your new certificate ",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: widthOrHeight0(context, 1) * 0.04,
                                ),
                                Text(
                                  "Specialization",
                                  style: TextStyle(color: Colors.black),
                                ),
                                SizedBox(
                                  height: widthOrHeight0(context, 1) * 0.005,
                                ),
                                TextFormFieldWidget2(
                                  passToggle: false,
                                  passController: signUpController6.email,
                                  labelText: '',
                                  validator: (value) {},
                                  str: 'your Specialization',
                                ),
                                SizedBox(
                                  height: widthOrHeight0(context, 1) * 0.03,
                                ),
                                Text(
                                  "Bio",
                                  style: TextStyle(color: Colors.black),
                                ),
                                MyProfileUser(),
                                SizedBox(
                                  height: widthOrHeight0(context, 1) * 0.03,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    width: widthOrHeight0(context, 1) * 0.25,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    const SignUP()));
                                      },
                                      child: Container(
                                        height:
                                            widthOrHeight0(context, 0) * .05,
                                        decoration: BoxDecoration(
                                            color: Color(0xff2D9BF0),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: const Center(
                                          child: Text(
                                            "Update",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontFamily: 'Kadwa',
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: widthOrHeight0(context, 1) * 0.03,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
