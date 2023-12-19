import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:psychepulse/view/widget/compoents/components.dart';

class DoctorDetailsScreen extends StatefulWidget {
  const DoctorDetailsScreen({super.key});

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Stack(
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
                                IconButton(onPressed: (){}, icon: Icon(Icons.share,size: 15,)),
                                Text('Share')
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
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Dr.',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500
                              ),

                            ),
                            Text('Omar Jalal',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold
                              ),

                            ),
                          ],
                        ),
                        const Text('Psychiatrist and mental health counselor',
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              defaultButton(
                                  text: 'Fast booking',
                                background: Colors.blue,
                                width: 120,
                                fontSize: 13,
                                borderRadius: 15,
                                height: 40,
                                function: (){
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.parse('2050-05-03'),
                                  ).then((value) {
                                  });
                                }
                              ),
                              const SizedBox(width: 10,),
                              Text('OR'),
                              const SizedBox(width: 10,),
                              defaultButton(
                                  text: 'Call',
                                  borderColor:Colors.blue ,
                                  TextColor: Colors.blue,
                                  background: Colors.white,
                                  width: 120,
                                  fontSize: 13,
                                  borderRadius: 15,
                                  height: 40
                              ),
                            ],
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
                      child: const CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/images/doctor.jpg'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
