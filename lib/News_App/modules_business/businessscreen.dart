


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/defaultButton.dart';
import '../../news_screenCubit/cubit.dart';
import '../../news_screenCubit/states.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStatess>(
        listener:(context,state)=>{} ,
        builder:(context,state){
          var list= NewsCubit.get(context).Business;
      return  articleBuilder(list,context);  }
    );

  }
}






