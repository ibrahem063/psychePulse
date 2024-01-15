import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:psychepulse/view/screen/SignNP/login/login_screen.dart';
import 'package:psychepulse/view/widget/compoents/components.dart';
import 'package:psychepulse/view/widget/profile/gender.dart';
import 'package:file_picker/file_picker.dart';

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
   TextEditingController country = TextEditingController();
   TextEditingController birth = TextEditingController();
   TextEditingController password = TextEditingController();
   TextEditingController doctor = TextEditingController();
  TextEditingController bio = TextEditingController();
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
                                "First Name",
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
                              defaultFormField(
                                height: 50,
                                controller: birth,
                                tybe: TextInputType.datetime,
                                validator: (value){
                                  return null;
                                },
                                text: '06/02/2001',
                                radius: 10.0,
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
                              const Text(
                                "ID ",
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                height: widthOrHeight0(context, 1) * 0.005,
                              ),
                              defaultFormField(
                                height: 50,
                                controller: country,
                                tybe: TextInputType.text,
                                validator: (value){
                                  return null;
                                },
                                text: 'your id',
                                radius: 10.0,
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
                              defaultFormField(
                                height: 50,
                                controller: doctor,
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
