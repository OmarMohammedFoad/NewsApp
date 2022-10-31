import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'states.dart';



class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppIntiailStates());

  static AppCubit get(context) => BlocProvider.of(context);
  int current_Indexx = 0;
  IconData fabicon = Icons.edit;
  Database? database;
  List<Map> tasksnew = [];
  List<Map> Done = [];
  List<Map> Achived = [];

  List<Widget> screen = [
    // NewTaskScreen(),
    // DoneTaskScreen(),
    // ArchivedTaskScreen()
  ];

  bool isbottomshown = false;
  List<String> title = ["Menu", "Done Task", "Archives Tasks"];

  // void ChangeIconData

  void ChangeIndex(int index) {
    current_Indexx = index;
    emit(AppChangeBottomNavBarStates());
  }

  void createDatabase() {
    openDatabase('todo.db', version: 1, onCreate: (database, version) {
      print("the DB created");
      //CREATE TABLE
      database
          .execute(
              'CREATE TABLE Task (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT,status TEXT)')
          .then((value) => {print("the table created")})
          .catchError((onError) {
        print("error when creating table ${onError.toString()}");
      });
    }, onOpen: (database) {
      getdatafromDatabase(database);
      print("the DB opened");
    }).then((value) {
      database = value;
      emit(AppCreateDatabase());
    });
  }

  inserttoDatabase({
    required String title,
    required String time,
    required String date,
  }) async {
    return await database!.transaction((txn) {
      return txn
          .rawInsert(
              'INSERT INTO task(title, date, time,STATUES) VALUES("$title","$date","$time","NEW")')
          .then((value) {
        print("$value data is inserted");
        emit(AppInsertDatabase());
        getdatafromDatabase(database);
      }).catchError((error) {
        print("error when inserting new record ${error.toString()}");
      });
    });
  }

  void getdatafromDatabase(database) async {
    emit(AppGetLoadingDatabase());
    tasksnew = [];
    Done = [];
    Achived = [];
    return database.rawQuery("SELECT * FROM task").then((value) {
      value.forEach((element) {
        if (element["STATUES"] == 'NEW') {
          tasksnew.add(element);
        } else if (element["STATUES"] == 'done') {
          Done.add(element);
        } else {
          Achived.add(element);
        }
      });
      emit(AppGetDatabase());
    });
  }

  void updateData({required String status, required int id}) async {
    database!.rawUpdate('UPDATE task SET STATUES = ? WHERE ID = ?',
        ['$status', id]).then((value) {
      getdatafromDatabase(database);
      emit(AppUpdateDatabase());
    });
  }

  void Delete({required int id})async {
    database?.rawDelete('DELETE FROM task WHERE ID = ?', [id]);
    getdatafromDatabase(database);
    emit(AppDeleteDatabase());
  }

  void ChangeIconLogic(bool flag, IconData icon) {
    isbottomshown = flag;
    fabicon = icon;
    emit(AppChangeBottomaheetBarStates());
  }
  bool isDark=true;
  void changeBrightnessModee()
  {
    isDark = !isDark;

      emit(changeBrightnessMode());


  }
}
