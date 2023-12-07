import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:psychepulse/main.dart';
import 'package:psychepulse/view/widget/compoents/components.dart';

class LanguageSelection extends StatefulWidget {
  const LanguageSelection({super.key});

  @override
  _GenderSelectionState createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<LanguageSelection> {
  String selectedGender = '';
  final FlutterLocalization localization = FlutterLocalization.instance;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Radio(
          activeColor: Colors.black,
          value: 'English',
          groupValue: selectedGender,
          onChanged: (value) {
            setState(() {
              selectedGender = value.toString();
              localization.translate('en');
              appLang = 'en';
            });
          },
        ),
        const Text(
          'English',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
        SizedBox(width: widthOrHeight0(context, 0) * 0.07),
        Radio(
          activeColor: Colors.black,
          value: 'Arabic',
          groupValue: selectedGender,
          onChanged: (value) {
            setState(() {
              selectedGender = value.toString();
              localization.translate('ar');
              appLang = 'ar';
            });
          },
        ),
        const Text('Arabic',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),

            
      ],
    );


    
  }
}
