import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/constant/constant_app.dart';
import 'package:news_app/cubit/cubit_states.dart';
import 'package:news_app/cubit/cuibt_app.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
class BusinessNav extends StatelessWidget {
  const BusinessNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: BlocConsumer< NewsCubit, NewsStates>(
        listener: (context, state){},
        builder: (context , state){
          var list = NewsCubit.get(context).business;
          return Conditional.single(
            context: context,
            conditionBuilder: (BuildContext context) => list.length > 0,
           // condition: state is! NewsGetBusinessLoadingState,
              widgetBuilder: (BuildContext context)=>  ListView.separated(
               physics: BouncingScrollPhysics(),
                 itemBuilder: (context, index)=>builderArticles(list[index], context),
                 separatorBuilder: (context, index) => myDivider(),
                 itemCount: 10
             ),
            fallbackBuilder:(context) => Center(
              child: CircularProgressIndicator(),
            )
          );

        }
      )
    );
  }
}
