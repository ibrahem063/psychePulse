import 'package:flutter/material.dart';

class MyProfileUser extends StatefulWidget {
  @override
  _MyProfileUserState createState() => _MyProfileUserState();
}

class _MyProfileUserState extends State<MyProfileUser> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
   minLines: 4,
      controller: _textEditingController,
      maxLines: null,
      decoration: InputDecoration(
        labelText: '',
       
        hintText: 'Add text',
        
   
        border: OutlineInputBorder(),
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}