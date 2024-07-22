import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:psychepulse/view/users_screen/cubit/cubit.dart';
import 'package:psychepulse/view/users_screen/cubit/states.dart';
import 'package:psychepulse/view/widget/compoents/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DrugScreen extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<psychepulseCubit, psychepulStates>(
      listener: (BuildContext context, psychepulStates state) {
        if (state is psychepulInsertDatabaseState) {
           Navigator.pop(context);
        }
      },
      builder: (BuildContext context, psychepulStates state) {
        var drugs=psychepulseCubit.get(context).drugs;
        psychepulseCubit cubit = psychepulseCubit.get(context);
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 0.3,
                      blurRadius: 5,
                      offset: const Offset(0, 1),
                    ),
                  ]
              ),
            ),
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.grey.shade400),
            title: Padding(
              padding: EdgeInsets.only(
                  left: widthOrHeight0(context, 1) * 0.2),
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    colors: [
                      const Color(0xFFFDCCC5),
                      Colors.pink.shade200,
                      Colors.deepPurple.shade200
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds);
                },
                child: Text(
                  'PsychePulse',
                  style: TextStyle(
                      fontSize: 25,
                      color: Theme
                          .of(context)
                          .primaryColor,
                      fontWeight: FontWeight.w900
                  ),
                ),
              ),
            ),
          ),
          body: ConditionalBuilder(
            condition: state is! psychepulGetDatabaseLoadingState,
            builder: (context) =>tasksBuilder(drugs:drugs ,contexts:context),
            fallback: (context) =>
            const Center(child: CircularProgressIndicator(
              color: Colors.black,
            )),
          ),
          floatingActionButton: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [const Color(0xFFFDCCC5),Colors.pink.shade200, Colors.deepPurple.shade200], // Colors to blend
              ),
            ),
            child: CircleAvatar(
              radius:28,
              backgroundColor: Colors.transparent,
              child: GestureDetector(
                onTap: () {
                  if (cubit.isBottomSheetShown) {
                    if (formKey.currentState!.validate()) {
                      cubit.insertToDatabase(
                        title: titleController.text,
                        time: timeController.text,
                        date: dateController.text,
                      );
                    }
                  } else {
                    scaffoldKey.currentState!
                        .showBottomSheet(
                          (context) =>
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [const Color(0xFFFDCCC5),Colors.pink.shade200, Colors.deepPurple.shade200], // Colors to blend
                              ),
                            ),
                            padding: const EdgeInsets.all(
                              20.0,
                            ),
                            child: Form(
                              key: formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  defaultFormField(
                                    radius: 20,
                                    controller: titleController,
                                    validator: (String?value) {
                                      if (value!.isEmpty) {
                                        return 'title must not be empty';
                                      }

                                      return null;
                                    },
                                    tybe: TextInputType.text,
                                    text: 'Drug Title',
                                    pref: Icons.title,
                                  ),
                                  const SizedBox(
                                    height: 15.0,
                                  ),
                                  defaultFormField(
                                    onTap: (){
                                      showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                      ).then((value) {
                                        timeController.text =
                                            value!.format(context).toString();
                                        print(value.format(context));
                                      });
                                    },
                                    radius: 20,
                                    controller: timeController,
                                    validator: (String?value) {
                                      if (value!.isEmpty) {
                                        return 'title must not be empty';
                                      }

                                      return null;
                                    },
                                    tybe: TextInputType.text,
                                    text: 'Drug Time',
                                    pref: Icons.access_time_outlined,
                                  ),
                                  const SizedBox(
                                    height: 15.0,
                                  ),
                                  defaultFormField(
                                    onTap: (){
                                      showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime.parse('2050-05-03'),
                                      ).then((value) {
                                        dateController.text =
                                            DateFormat.yMMMd().format(value!);
                                      });
                                    },
                                    radius: 20,
                                    controller: dateController,
                                    validator: (String?value) {
                                      if (value!.isEmpty) {
                                        return 'title must not be empty';
                                      }

                                      return null;
                                    },
                                    tybe: TextInputType.text,
                                    text: 'Drug date',
                                    pref: Icons.calendar_month_outlined,
                                  ),
                                  const SizedBox(
                                    height: 15.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                      elevation: 20.0,
                    ).closed.then((value) {
                      cubit.changeBottomSheetState(
                        isShow: false,
                        icon: Icons.edit,
                      );
                    });
                    cubit.changeBottomSheetState(
                      isShow: true,
                      icon: Icons.add,
                    );
                  }
                },
                child: Icon(
                  cubit.fabIcon,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

