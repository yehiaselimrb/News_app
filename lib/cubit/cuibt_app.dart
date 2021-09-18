import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Network/dio/dio_helper.dart';
import 'package:news_app/cubit/cubit_states.dart';
import 'package:news_app/wedgits/bottom_navigator/business.dart';
import 'package:news_app/wedgits/bottom_navigator/scinecs.dart';
import 'package:news_app/wedgits/bottom_navigator/setting.dart';
import 'package:news_app/wedgits/bottom_navigator/sports.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
 List<BottomNavigationBarItem> bottomItems = [
   BottomNavigationBarItem(
       icon: Icon(Icons.business),
       label: ('Business')
   ),
   BottomNavigationBarItem(
       icon: Icon(Icons.science),
       label: ('Science')
   ),
   BottomNavigationBarItem(
       icon: Icon(Icons.sports),
       label: ('Sports')
   ),
   // BottomNavigationBarItem(
   //     icon: Icon(Icons.settings),
   //     label: ('Settings')
   // ),
 ];
 List<Widget> screens = [
   BusinessNav(),
   scienceNav(),
   SportsNav(),
  // SettingNav(),
 ];

 void checkNavigation(int index){
   currentIndex = index;
   // if(index == 1)
   //   getScience();
   // else if(index == 2)
   //   getSports();
   emit(NewsBottomNavState());
 }
  List<dynamic> business = [];
 void getBusiness(){
   emit(NewsGetBusinessLoadingState());
   DioHelper.getData(
       url:'v2/top-headlines' ,
       query: {
         'country':'eg',
         'category': 'business',
         'apiKey' : 'e8a519508963481b969b28209182a9b5',
       }).then((value){
     //print(value.data['articles'][3]['title']);
     business = value.data['articles'];
     print(business[0]['title']);
     emit(NewsGetBusinessSuccessState());
   }).catchError((error){
     print(error.toString());
     emit(NewsGetBusinessErrorState(error.toString()));
   });
 }

  List<dynamic> sports = [];
  void getSports(){
    emit(NewsGetSportsLoadingState());
    if(sports.length == 0){
      DioHelper.getData(
          url:'v2/top-headlines' ,
          query: {
            'country':'eg',
            'category': 'sports',
            'apiKey' : 'e8a519508963481b969b28209182a9b5',
          }).then((value){
        //print(value.data['articles'][3]['title']);
        sports = value.data['articles'];
        print(sports[0]['title']);
        emit(NewsGetSportsSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetSportsErrorState(error.toString()));
      });
    }else{
      emit(NewsGetSportsSuccessState());
    }

  }
  List<dynamic> science = [];
  void getScience(){
    emit(NewsGetScienceLoadingState());
    if(science.length == 0){
      DioHelper.getData(
          url:'v2/top-headlines' ,
          query: {
            'country':'eg',
            'category': 'science',
            'apiKey' : 'e8a519508963481b969b28209182a9b5',
          }).then((value){
        //print(value.data['articles'][3]['title']);
        science = value.data['articles'];
        print(science[0]['title']);
        emit(NewsGetScienceSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });
    }else{
      emit(NewsGetScienceSuccessState());
    }
    }
  bool isDark = false;
  void ChangeThemeMode(){
    isDark = !isDark;
    emit(DoubgeDarkMode());
  }
  }