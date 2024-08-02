import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:psychepulse/view/widget/compoents/components.dart';

import '../../../../model/doctor_model.dart';

class DoctorDetailsScreen extends StatelessWidget {
  DrModel? model;
  DoctorDetailsScreen({
  super.key,
    required this.model
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
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
                colors: [const Color(0xFFFDCCC5),Colors.pink.shade200, Colors.deepPurple.shade200],
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
        child: Padding(
          padding: const EdgeInsets.only(right: 12.0,left: 12.0),
          child: Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black
                          )
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(onPressed: (){}, icon: const Icon(Icons.share,size: 15,)),
                                  const Text('Share')
                                ],
                              ),
                              const Padding(
                                padding:  EdgeInsets.only(right: 10.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.remove_red_eye,size: 15,),
                                    SizedBox(width: 10,),
                                    Text('176 watch')
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10,),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Dr.',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500
                                ),

                              ),
                              Text('${model!.name}',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold
                                ),

                              ),
                            ],
                          ),
                          Text('${model!.Jurisdiction}',
                            style: TextStyle(
                                color: Colors.grey
                            ),),
                          const SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '4.5',
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
                              const SizedBox(width: 8,),
                              const Text('20 reservations at the doctor',
                                style: TextStyle(
                                    color: Colors.black54
                                ),)
                            ],
                          ),
                          const SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20.0 ,top: 10),
                            child: defaultButton(
                                text: 'Call',
                                TextColor: Colors.white,
                                width: 120,
                                fontSize: 13,
                                borderRadius: 15,
                                height: 40
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 13.0),
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.blue
                            ),
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child:  CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(model!.image),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black
                    )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 8.0),
                            child: SvgPicture.asset(
                                'assets/icons/icons8-doughnut-chart-64.svg',
                                width: 40,
                                height: 40,
                                color:Colors.blue
                            ),
                          ),
                           Text(
                            'Data',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        height: 1.0,
                        color: Colors.black,
                      ),
                      const SizedBox(height: 10,),
                      const Text('Professional Experience',style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500
                      ),),
                      const SizedBox(height: 10,),
                      Container(
                        child: Text( model!.bio,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w500
                          ),),
                      ),
                      const SizedBox(height: 20,),
                      const Text('Specialties',style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500
                      ),),
                      SizedBox(
                        height: 100,
                        child: ListView.separated(
                            separatorBuilder: (context, index) =>const SizedBox(height: 10,),
                            itemBuilder: (context, index) =>const  Text('mood disorders',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                overflow: TextOverflow.visible,
                                color: Colors.blue,
                                textBaseline:TextBaseline.alphabetic ,
                                fontSize: 13.0,
                                decorationThickness: 2.0,
                              ),),
                            itemCount: 3),
                      ),
                      const SizedBox(height: 20,),
                      const Text('Symptoms and health conditions',style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500
                      ),),
                      SizedBox(
                        height: 100,
                        child: ListView.separated(
                            separatorBuilder: (context, index) =>const SizedBox(height: 10,),
                            itemBuilder: (context, index) =>const  Text('Anxiety Disorders',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                overflow: TextOverflow.visible,
                                color: Colors.blue,
                                textBaseline:TextBaseline.alphabetic ,
                                fontSize: 13.0,
                                decorationThickness: 2.0,
                              ),),
                            itemCount: 3),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black
                    )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 8.0),
                            child: SvgPicture.asset(
                                'assets/icons/icons8-chat-100-_1_.svg',
                                width: 40,
                                height: 40,
                                color:Colors.blue
                            ),
                          ),
                          const Text(
                            'Opinions',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        height: 1.0,
                        color: Colors.black,
                      ),
                      const SizedBox(height: 10,),
                      SizedBox(
                        height:400,
                        child: ListView.separated(
                            separatorBuilder: (context, index) =>const SizedBox(height: 10,),
                            itemBuilder: (context, index) =>Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black
                                  ),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Padding(
                                padding:  const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    const SizedBox(
                                        width: 60,
                                        height: 60,
                                        child: Image(image:AssetImage( 'assets/images/770137_man_512x512.png',))),
                                    const SizedBox(width: 10,),
                                    const Column(
                                      children: [
                                        Text('Name',style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold
                                        ),),
                                        Text('Time',style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.black54
                                        ),),
                                        Text('Comment',style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.black54
                                        ),)
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left:widthOrHeight0(context, 1)*0.2),
                                      child: const Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Icon(Icons.star,color: Colors.yellow,size: 50),
                                          Text('4.5',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold),),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            itemCount: 7),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}

