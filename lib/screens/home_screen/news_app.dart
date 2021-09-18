import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Network/dio/dio_helper.dart';
import 'package:news_app/cubit/app_cubit.dart';
import 'package:news_app/cubit/cubit_states.dart';
import 'package:news_app/cubit/cuibt_app.dart';
class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getBusiness()..getScience()..getSports(),
      child: BlocConsumer<NewsCubit , NewsStates>(
        listener: (context, state){},
        builder: (context ,state) {
         var cubit = NewsCubit.get(context);
       return  Scaffold(
          appBar: AppBar(
            title: Text('NewsApp'),
            actions: [
              IconButton(onPressed: (){}, icon: Icon(Icons.search)),
              IconButton(onPressed: (){
                AppCubit.getCubit(context).ChangeThemeMode();
              }, icon: Icon(Icons.brightness_4_outlined)),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            items: cubit.bottomItems,
            onTap: (index){
             NewsCubit.get(context).checkNavigation(index);
       },
          ),
         body: cubit.screens[cubit.currentIndex],
        );
        }
      ),
    );
  }
}
