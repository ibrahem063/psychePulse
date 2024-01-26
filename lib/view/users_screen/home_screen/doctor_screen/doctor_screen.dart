import 'package:flutter/material.dart';
import 'package:psychepulse/view/widget/compoents/components.dart';
import '../../../widget/doctor_details_widget.dart';
import '../../Profile_page/Profile_dr_screen.dart';
import 'doctor_details_screen.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({super.key});

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  final TextEditingController _controller = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widthOrHeight0(context, 0) * 0.02,
        ),
        Expanded(
          flex: 1,
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(thickness: widthOrHeight0(context, 0)*0.01,),
            itemBuilder: (context, index) => DoctorDetailsWidget(
              functionBotton: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileDRScreen()),
                );
              },
              function: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DoctorDetailsScreen()),
                );
              },
            path: 'assets/images/doctor.jpg',
            name: 'DR. Omar Jalal',
            subTitle: 'Psychiatrist and mental health counselor',
            rate: 4.7,
          ),
              itemCount: 2,
          ),
        )
      ],
    );
  }
}

