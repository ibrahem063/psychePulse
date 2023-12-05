import 'package:flutter/material.dart';
import 'package:psychepulse/view/widget/compoents/components.dart';

import '../../model/doctor_details_model.dart';
import '../widget/doctor_details_widget.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({super.key});

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  final TextEditingController _controller = TextEditingController();

  List<DoctorDetailsModel> doctorDetails = [
    DoctorDetailsModel(
        icon: Icons.headphones,
        data: 'Psychiatrist and mental health counselor'),
    DoctorDetailsModel(icon: Icons.location_on, data: 'Jordan - Amman'),
    DoctorDetailsModel(
        icon: Icons.access_time_filled, data: 'Waiting time: 15-30 minutes'),
    DoctorDetailsModel(icon: Icons.remove_red_eye, data: '1576 watch'),
    DoctorDetailsModel(
        icon: Icons.attach_money_outlined, data: 'Scout: 50 US dollars'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          width: double.infinity,
        ),
        defaultFormField(
            controller: _controller,
            tybe: TextInputType.none,
            validator:(p0) {
              return null;
            },
            radius: 15,
            pref: Icons.search,
            label: 'Search',
            width: widthOrHeight0(context, 1) * 0.4,
            height: widthOrHeight0(context, 0) * 0.05),
        SizedBox(
          height: widthOrHeight0(context, 0) * 0.02,
        ),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(thickness: widthOrHeight0(context, 0)*0.01,),
            itemBuilder: (context, index) => DoctorDetailsWidget(
            doctorDetails: doctorDetails,
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

