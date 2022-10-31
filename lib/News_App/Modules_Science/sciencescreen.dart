import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/defaultButton.dart';
import '../../news_screenCubit/cubit.dart';
import '../../news_screenCubit/states.dart';



class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStatess>(
        listener:(context,state)=>{} ,
        builder:(context,state){
          var list= NewsCubit.get(context).Science;
          return articleBuilder(list,context);}
    );

  }
}






