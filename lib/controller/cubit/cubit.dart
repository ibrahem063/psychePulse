import 'package:bloc/bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psychepulse/controller/cubit/states.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit():  super(AppInitialState());

  static AppCubit get(context)=>BlocProvider.of(context);

  late Database database;
  List<Map<dynamic, dynamic>> drugs = [];

  void createDatabase() {
    openDatabase(
      'drugs.db',
      version: 1,
      onCreate: (database, version) {

        print('database created');
        database
            .execute(
            'CREATE TABLE drugs(id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT)')
            .then((value) {
              emit(AppGetDatabaseState());
          print('table created');
        }).catchError((error) {
          print('Error When Creating Table ${error.toString()}');
        });
      },
      onOpen: (database)
      {
        getDataFromDatabase(database);
        emit(AppGetDatabaseState());
        print('database opened');
      },
    ).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }

  insertToDatabase({
    required String title,
    required String time,
    required String date,
  }) async {
     database.insert(
        'drugs',
        {
          'title': title,
          'date': date,
          'time': time,
        },
    ).then((value) {
        print('$value inserted successfully');
        emit(AppInsertDatabaseState());
        getDataFromDatabase(database);
      }).catchError((error) {
        print('Error When Inserting New Record ${error.toString()}');
      });
  }

 void getDataFromDatabase(database)
  {
    emit(AppGetDatabaseLoadingState());
    drugs=[];
    database.rawQuery('SELECT * FROM drugs ').then((value) {
      value.forEach((element)
      {
        drugs.add(element);
        emit(AppGetDatabaseState());
      });

      emit(AppGetDatabaseState());
    });
  }

  void deleteData({
    required int id,
  }) async
  {
    database.rawDelete('DELETE FROM drugs WHERE id = ?', [id])
        .then((value)
    {
      getDataFromDatabase(database);
      emit(AppDeleteDatabaseState());
    });
  }

  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;

  void changeBottomSheetState({
    required bool isShow,
    required IconData icon,
  }) {
    isBottomSheetShown = isShow;
    fabIcon = icon;


    emit(AppChangeBottomSheetState());
  }
}