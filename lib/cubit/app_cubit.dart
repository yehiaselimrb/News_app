import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/app_states.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit(): super(DoubgeDarkMode());
  static AppCubit getCubit(context) => BlocProvider.of(context);
  bool isDark = false;
  void ChangeThemeMode(){
    isDark = !isDark;
    emit(DoubgeDarkMode());
  }
}