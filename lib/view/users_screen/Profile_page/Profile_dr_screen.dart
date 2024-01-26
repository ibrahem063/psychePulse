import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:psychepulse/view/widget/compoents/components.dart';
import 'package:psychepulse/view/widget/profile/gender.dart';
import 'package:file_picker/file_picker.dart';

import '../SignNP/login/login_screen.dart';

class ProfileDRScreen extends StatefulWidget {
  const ProfileDRScreen({super.key});

  @override
  State<ProfileDRScreen> createState() => _ProfileDRScreenState();
}

class  _ProfileDRScreenState extends State<ProfileDRScreen> {
  // SignUpController signUpController6 = SignUpController();
  String? pickedFilePath;

   TextEditingController email = TextEditingController();
   TextEditingController firstName = TextEditingController();
   TextEditingController phone = TextEditingController();
   TextEditingController birth = TextEditingController();
   TextEditingController password = TextEditingController();
   TextEditingController Specialization = TextEditingController();
  TextEditingController bio = TextEditingController();
  TextEditingController taimOpen = TextEditingController();
  TextEditingController taimclose = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController location = TextEditingController();
   GlobalKey<FormState> formKey = GlobalKey<FormState>();


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
                      key: formKey,
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Name",
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                height: widthOrHeight0(context, 1) * 0.005,
                              ),
                              defaultFormField(
                                height: 50,
                                controller: firstName,
                                tybe: TextInputType.text,
                                validator: (value){
                                  return null;
                                },
                                text: 'ibrahim',
                                radius: 10.0,
                              ),
                              SizedBox(
                                height: widthOrHeight0(context, 1) * 0.015,
                              ),
                              const Text(
                                "Phone",
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                height: widthOrHeight0(context, 1) * 0.005,
                              ),
                              defaultFormField(
                                height: 50,
                                controller: phone,
                                tybe: TextInputType.phone,
                                validator: (value){
                                  return null;
                                },
                                text: '067666',
                                radius: 10.0,
                              ),
                              SizedBox(
                                height: widthOrHeight0(context, 1) * 0.015,
                              ),
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
                              defaultFormField(
                                height: 50,
                                controller: email,
                                tybe: TextInputType.emailAddress,
                                validator: (value){
                                  return null;
                                },
                                text: 'Ibrahim@gmail.com',
                                radius: 10.0,
                              ),
                              SizedBox(
                                height: widthOrHeight0(context, 1) * 0.04,
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
                              defaultFormField(
                                height: 50,
                                controller: Specialization,
                                tybe: TextInputType.text,
                                validator: (value){
                                  return null;
                                },
                                text:  'your Specialization',
                                radius: 10.0,
                              ),
                              SizedBox(
                                height: widthOrHeight0(context, 1) * 0.03,
                              ),
                              const Text(
                                "Time Open",
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                height: widthOrHeight0(context, 1) * 0.01,
                              ),
                              defaultFormField(
                                height: 50,
                                onTap: (){
                                  showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  ).then((value) {
                                    taimOpen.text =
                                        value!.format(context).toString();
                                    print(value.format(context));
                                  });
                                },
                                radius: 10,
                                controller: taimOpen,
                                validator: (String?value) {
                                  if (value!.isEmpty) {
                                    return 'title must not be empty';
                                  }

                                  return null;
                                },
                                tybe: TextInputType.text,
                                text: 'Time Open',
                                pref: Icons.access_time_outlined,
                              ),
                              SizedBox(
                                height: widthOrHeight0(context, 1) * 0.03,
                              ),
                              const Text(
                                "Time close",
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                height: widthOrHeight0(context, 1) * 0.01,
                              ),
                              defaultFormField(
                                height: 50,
                                onTap: (){
                                  showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  ).then((value) {
                                    taimclose.text =
                                        value!.format(context).toString();
                                    print(value.format(context));
                                  });
                                },
                                radius: 10,
                                controller: taimclose,
                                validator: (String?value) {
                                  if (value!.isEmpty) {
                                    return 'title must not be empty';
                                  }

                                  return null;
                                },
                                tybe: TextInputType.text,
                                text: 'Time close',
                                pref: Icons.access_time_outlined,
                              ),
                              SizedBox(
                                height: widthOrHeight0(context, 1) * 0.03,
                              ),
                              const Text(
                                "price",
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                height: widthOrHeight0(context, 1) * 0.005,
                              ),
                              defaultFormField(
                                height: 50,
                                controller: price,
                                tybe: TextInputType.text,
                                validator: (value){
                                  return null;
                                },
                                text: '15\$',
                                radius: 10.0,
                              ),
                              SizedBox(
                                height: widthOrHeight0(context, 1) * 0.015,
                              ),
                              const Text(
                                "location",
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                height: widthOrHeight0(context, 1) * 0.005,
                              ),
                              defaultFormField(
                                height: 50,
                                controller: location,
                                tybe: TextInputType.text,
                                validator: (value){
                                  return null;
                                },
                                text: 'amman',
                                radius: 10.0,
                              ),
                              SizedBox(
                                height: widthOrHeight0(context, 1) * 0.015,
                              ),
                              const Text(
                                "Bio",
                                style: TextStyle(color: Colors.black),
                              ),
                              TextField(
                                minLines: 4,
                                controller:bio,
                                maxLines: null,
                                decoration: const InputDecoration(
                                  labelText: '',
                                  hintText: 'Add text',
                                  border: OutlineInputBorder(),
                                ),
                              ),
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
                                                   LoginScreen()));
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
