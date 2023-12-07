import 'package:flutter/material.dart';
import 'package:psychepulse/controller/signup_controller.dart';
import 'package:psychepulse/view/screen/SignNP/login_screen.dart';
import 'package:psychepulse/view/widget/profile/Multi.dart';
import 'package:psychepulse/view/widget/compoents/components.dart';
import 'package:psychepulse/view/widget/profile/defaultFormField%20copy.dart';
import 'package:psychepulse/view/widget/profile/gender.dart';
import 'package:file_picker/file_picker.dart';

class ProfileDRScreen extends StatefulWidget {
  const ProfileDRScreen({super.key});

  @override
  State<ProfileDRScreen> createState() => _ProfileDRScreenState();
}

class  _ProfileDRScreenState extends State<ProfileDRScreen> {
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
                          foregroundColor: Colors.white, backgroundColor: const Color(0xff2D9BF0),
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
                  child: SizedBox(
                    width: widthOrHeight0(context, 0) * 0.5,
                    child: Form(
                      key: signUpController6.formKey,
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
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
                                validator: (value) {
                                  return null;
                                },
                                str: 'your id',
                              ),
                              SizedBox(
                                height: widthOrHeight0(context, 1) * 0.015
                                ,
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.upload_file),
                                    onPressed: _pickPDF,
                                    tooltip: 'Upload PDF',
                                  ),
                                  const Text(
                                    "Enter your new certificate ",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: widthOrHeight0(context, 1) * 0.04,
                              ),
                              const Text(
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
                                validator: (value) {
                                  return null;
                                },
                                str: 'your Specialization',
                              ),
                              SizedBox(
                                height: widthOrHeight0(context, 1) * 0.03,
                              ),
                              const Text(
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
                                                  const LoginScreen()));
                                    },
                                    child: Container(
                                      height:
                                          widthOrHeight0(context, 0) * .05,
                                      decoration: BoxDecoration(
                                          color: const Color(0xff2D9BF0),
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
    );
  }
}
