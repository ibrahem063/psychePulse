import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:psychepulse/view/users_screen/cubit/cubit.dart';
import 'package:psychepulse/view/widget/compoents/components.dart';
import '../../../widget/doctor_details_widget.dart';
import '../../cubit/states.dart';
import 'doctor_details_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorScreen extends StatelessWidget {
  DoctorScreen({super.key});

  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => psychepulseCubit()..getDr(),
      child: BlocConsumer<psychepulseCubit,psychepulStates>(
        listener:(context, state){

        },
        builder: (context, state) => ConditionalBuilder(
          builder: (context) =>Column(
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
                      psychepulseCubit.get(context).callDr('tel', '${psychepulseCubit.get(context).doctor[index].phone}');
                    },
                    function: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  DoctorDetailsScreen(model:psychepulseCubit.get(context).doctor[index] ,)),
                      );
                    },
                    model:psychepulseCubit.get(context).doctor[index] ,
                  ),
                  itemCount: psychepulseCubit.get(context).doctor.length,
                ),
              )
            ],
          ) ,
          fallback: (context) => const Center(child: CircularProgressIndicator()),
          condition:psychepulseCubit.get(context).doctor.length>= 0,
        ),
      ),
    );
  }
}


