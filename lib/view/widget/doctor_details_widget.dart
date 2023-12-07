
import 'package:flutter/material.dart';
import 'package:psychepulse/view/screen/Profile_page/Profile_dr_screen.dart';
import 'package:psychepulse/view/screen/splash_screen.dart';

import '../../model/doctor_details_model.dart';
import 'compoents/components.dart';

class DoctorDetailsWidget extends StatelessWidget {
  const DoctorDetailsWidget({
    super.key,
    required this.doctorDetails,
    required this.path,
    required this.name,
    required this.subTitle,
    required this.rate,
    required this.function,
    required this.functionBotton1,
    required this.functionBotton2,
  });

  final List<DoctorDetailsModel> doctorDetails;
  final String path;
  final String name;
  final String subTitle;
  final double rate;
  final Function() function;
  final Function() functionBotton1;
  final Function() functionBotton2;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: widthOrHeight0(context, 0) * 0.4,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding:  EdgeInsets.all(widthOrHeight0(context, 1)*0.01),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      radius: widthOrHeight0(context, 1) * 0.06,
                      foregroundImage: AssetImage(path),
                    ),
                    SizedBox(
                      height: widthOrHeight0(context, 1) * 0.03,
                    ),
                    defaultButton(
                        function:functionBotton1,
                        text: 'Fast booking',
                        width: widthOrHeight0(context, 1) * 0.13,
                        fontSize: widthOrHeight0(context, 1) * 0.014,
                        height: widthOrHeight0(context, 0) * 0.046,
                        background: const Color(0xff57aff3),
                        borderRadius: 10,
                        borderColor:
                        Theme.of(context).scaffoldBackgroundColor),
                    SizedBox(
                      height: widthOrHeight0(context, 1) * 0.01,
                    ),
                    Text(
                      'OR',
                      style: TextStyle(
                          color: const Color(0xff57aff3),
                          fontSize: widthOrHeight0(context, 1) * 0.02),
                    ),
                    SizedBox(
                      height: widthOrHeight0(context, 1) * 0.01,
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: widthOrHeight0(context, 1) * 0.15,
                          height:widthOrHeight0(context, 0) * 0.046,
                        ),
                        defaultButton(
                          function:functionBotton2,
                          text: 'Call',
                          width: widthOrHeight0(context, 1) * 0.13,
                          fontSize: widthOrHeight0(context, 1) * 0.015,
                          height: widthOrHeight0(context, 0) * 0.046,
                          background:
                          Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: 10,
                          borderColor: const Color(0xff57aff3),
                          TextColor: const Color(0xff57aff3),
                        ),
                        Positioned(
                            left: 0,
                            child: Icon(
                              Icons.call,
                              color: const Color(0xff57aff3),
                              size: widthOrHeight0(context, 0) * 0.07,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: function,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: widthOrHeight0(context, 0)*0.025,),
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: widthOrHeight0(context, 1) * 0.03,
                            height: widthOrHeight0(context, 0) * 0.023,
                            decoration: const BoxDecoration(
                                color: Color(0xfffac710),
                                borderRadius:
                                BorderRadius.all(Radius.circular(5))),
                            child: Text(
                              'AD',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context)
                                      .scaffoldBackgroundColor,
                                  fontSize:
                                  widthOrHeight0(context, 1) * 0.014),
                            ),
                          ),
                          SizedBox(
                            width: widthOrHeight0(context, 1) * 0.01,
                          ),
                          SizedBox(
                            width: widthOrHeight0(context, 1) * 0.23,
                            child: Text(
                              name,
                              style: TextStyle(
                                  color: const Color(0xff57aff3),
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                  widthOrHeight0(context, 1) * 0.029),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: widthOrHeight0(context, 1) * 0.27,
                        child: Text(
                          subTitle,
                          style: TextStyle(
                              color: const Color(0xffdbd8d8),
                              fontSize: widthOrHeight0(context, 1) * 0.02),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            rate.toString(),
                            style: TextStyle(
                                fontSize: widthOrHeight0(context, 1) * 0.02,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: widthOrHeight0(context, 1) * 0.01,
                          ),
                          Row(
                            children: List.generate(
                                5,
                                    (index) => const Icon(
                                  Icons.star,
                                  color: Color(0xfff3ed10),
                                )),
                          )
                        ],
                      ),
                      SizedBox(height: widthOrHeight0(context, 0)*0.03,),
                      Column(
                        children:
                        List.generate(doctorDetails.length, (index) {
                          return Row(
                            children: [
                              Icon(
                                doctorDetails[index].icon,
                                color: const Color(0xff57aff3),
                                size: 15,
                              ),
                              SizedBox(
                                width: widthOrHeight0(context, 1) * 0.01,
                              ),
                              Expanded(
                                child: Text(
                                  doctorDetails[index].data,
                                  style: const TextStyle(
                                      color: Color(0xffdbd8d8)),
                                ),
                              )
                            ],
                          );
                        }),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: widthOrHeight0(context, 1)*0.02,),
          defaultButton(
              text: 'Appointments available ',
              fontSize: widthOrHeight0(context, 1) * 0.016,
              background: const Color(0xff57aff3),
              borderColor: Theme.of(context).scaffoldBackgroundColor,
              fontWeight: FontWeight.bold,
              borderRadius: 5,
              width: widthOrHeight0(context, 1)*0.45,
              height: widthOrHeight0(context, 0)*0.04
          ),
        ],
      ),
    );
  }
}