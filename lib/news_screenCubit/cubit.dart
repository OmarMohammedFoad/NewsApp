

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../News_App/Modules_Science/sciencescreen.dart';
import '../News_App/modules_Sports/sports_screen.dart';
import '../News_App/modules_business/businessscreen.dart';
import '../remote/dio_helper.dart';
import 'states.dart';

class NewsCubit extends Cubit<NewsStatess> {
  NewsCubit() : super(NewsInitStates());

  static NewsCubit get(context) => BlocProvider.of(context);

  int current_indx = 0;
  List<BottomNavigationBarItem> BottomItem = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: "business"),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: "sports"),
    BottomNavigationBarItem(
        icon: Icon(Icons.science_rounded), label: "Science"),
  ];
  List<Widget> pages = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  List<dynamic> Business = [];

  List<dynamic> Sports = [];

  List<dynamic> Science = [];

  List<dynamic> search = [];


  void getBusinessData() {
    emit(NewsLoadingGetBusinessStates());
    DioHelper.getDate(url: "v2/top-headlines", query: {
      "country": "eg",
      "category": "business",
      "apiKey": "eea4c6721d5849fcb7f12a0e71ef4955"
    }).then((value) {
      Business = value.data['articles'];
      print(Business[0]['title']);
      emit(NewsGetBusinessSuccesStates());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorStates(error.toString()));
    });
  }

  void getScienceData() {
    emit(NewsLoadingGetBusinessStates());
    if (Science.length == 0) {
      DioHelper.getDate(url: "v2/top-headlines", query: {
        "country": "eg",
        "category": "science",
        "apiKey": "eea4c6721d5849fcb7f12a0e71ef4955"
      }).then((value) {
        Science = value.data['articles'];
        // print(Business[0]['title']);title
        emit(NewsGetScienceSuccesStates());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetScieceErrorStates(error.toString()));
      });
    } else
      emit(NewsGetScienceSuccesStates());
  }

  void getSportData() {
    emit(NewsLoadingGetSportStates());
    if (Sports.length == 0) {
      DioHelper.getDate(url: "v2/top-headlines", query: {
        "country": "eg",
        "category": "sports",
        "apiKey": "eea4c6721d5849fcb7f12a0e71ef4955"
      }).then((value) {
        Sports = value.data['articles'];
        // print(Business[0]['title']);
        emit(NewsGetSportSuccesStates());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSportErrorStates(error.toString()));
      });
    } else
      emit(NewsGetSportSuccesStates());
  }


  void getSearchData(String value) {
    emit(NewsLoadingGetSportStates());

    DioHelper.getDate(
          url: "v2/everything", query: {

          "q": "$value",
          "apiKey": "eea4c6721d5849fcb7f12a0e71ef4955"
      }).then((value) {
        search = value.data['articles'];

        emit(NewsGetSearchSuccesStates());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSearchErrorStates(error.toString()));
      });
  }

  void changeBottom(value) {
    current_indx = value;
    if (value == 1) {
      getSportData();
    } else if (value == 2) {
      getScienceData();
    }
    emit(NewsBottomNavBarStates());
  }



}
