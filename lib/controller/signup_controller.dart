// ignore_for_file: unnecessary_getters_setters

import 'package:flutter/material.dart';

class SignUpController{


   TextEditingController _email = TextEditingController();
   TextEditingController _firstName = TextEditingController();
      TextEditingController _secondName = TextEditingController();
   TextEditingController _country = TextEditingController();
      TextEditingController _birth = TextEditingController();
   TextEditingController _password = TextEditingController();
      TextEditingController _doctor = TextEditingController();
   TextEditingController _phone = TextEditingController();
   GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  get formKey => _formKey;

  set formKey(value) {
    _formKey = value;
  }
    TextEditingController get doctor => _doctor;

  set doctor(TextEditingController value) {
    _doctor = value;
  }

  TextEditingController get birth => _birth;

  set birth(TextEditingController value) {
    _birth = value;
  }
  TextEditingController get phone => _phone;

  set phone(TextEditingController value) {
    _phone = value;
  }

  TextEditingController get secondname => _secondName;

  set secondname(TextEditingController value) {
    _secondName = value;
  }

  TextEditingController get password => _password;

  set password(TextEditingController value) {
    _password = value;
  }

  TextEditingController get country => _country;

  set country(TextEditingController value) {
    _country = value;
  }

  TextEditingController get firstName => _firstName;

  set firstName(TextEditingController value) {
    _firstName = value;
  }

  TextEditingController get email => _email;

  set email(TextEditingController value) {
    _email = value;
  }


}