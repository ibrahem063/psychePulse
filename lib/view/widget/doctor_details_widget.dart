import 'package:flutter/material.dart';
import 'package:psychepulse/model/doctor_model.dart';
import 'compoents/components.dart';

class DoctorDetailsWidget extends StatelessWidget {
  const DoctorDetailsWidget({
    super.key,
    required this.model,
    required this.function,
    required this.functionBotton,
  });

  final DrModel model;
  final Function() function;
  final Function() functionBotton;

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
                      foregroundImage: NetworkImage(model.image),
                    ),
                    SizedBox(
                      height: widthOrHeight0(context, 1) * 0.03,
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: widthOrHeight0(context, 1) * 0.15,
                          height:widthOrHeight0(context, 0) * 0.046,
                        ),
                        defaultButton(
                          function:functionBotton,
                          text: 'Call',
                          width: widthOrHeight0(context, 1) * 0.13,
                          fontSize: widthOrHeight0(context, 1) * 0.015,
                          height: widthOrHeight0(context, 0) * 0.046,
                          background:
                          Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: 10,
                          TextColor: Colors.white,
                        ),
                        Positioned(
                            left: 0,
                            child: Icon(
                              Icons.call,
                              color: Colors.purple.shade300,
                              size: widthOrHeight0(context, 0) * 0.05,
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
                              'Dr.${model.name.toUpperCase()}',
                              style: TextStyle(
                                fontFamily: 'jannah',
                                  color: Colors.black,
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
                          model.Jurisdiction,
                          style: TextStyle(
                              color: const Color(0xffdbd8d8),
                              fontSize: widthOrHeight0(context, 1) * 0.02),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            model.rate,
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
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.headphones,
                                color:  Colors.purple.shade300,
                                size: 15,
                              ),
                              SizedBox(
                                width: widthOrHeight0(context, 1) * 0.01,
                              ),
                              Expanded(
                                child: Text(
                                  '${model.Jurisdiction}',
                                  style: const TextStyle(
                                      color: Color(0xffdbd8d8)),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color:  Colors.purple.shade300,
                                size: 15,
                              ),
                              SizedBox(
                                width: widthOrHeight0(context, 1) * 0.01,
                              ),
                              Expanded(
                                child: Text(
                                  '${model.location}',
                                  style: const TextStyle(
                                      color: Color(0xffdbd8d8)),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.access_time_filled,
                                color:  Colors.purple.shade300,
                                size: 15,
                              ),
                              SizedBox(
                                width: widthOrHeight0(context, 1) * 0.01,
                              ),
                              Expanded(
                                child: Text(
                                  'Waiting time: ${model.timeOpen}-${model.timeClose} minutes',
                                  style: const TextStyle(
                                      color: Color(0xffdbd8d8)),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.remove_red_eye ,
                                color:  Colors.purple.shade300,
                                size: 15,
                              ),
                              SizedBox(
                                width: widthOrHeight0(context, 1) * 0.01,
                              ),
                              Expanded(
                                child: Text(
                                  '1576 watch',
                                  style: const TextStyle(
                                      color: Color(0xffdbd8d8)),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.attach_money_outlined,
                                color:  Colors.purple.shade300,
                                size: 15,
                              ),
                              SizedBox(
                                width: widthOrHeight0(context, 1) * 0.01,
                              ),
                              Expanded(
                                child: Text(
                                  'Scout: ${model.price} US dollars',
                                  style: const TextStyle(
                                      color: Color(0xffdbd8d8)),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: widthOrHeight0(context, 1)*0.02,),
          defaultButton(
            function:function ,
              text: 'Appointments available ',
              fontSize: widthOrHeight0(context, 1) * 0.016,
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