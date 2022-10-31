

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/defaultButton.dart';
import '../../news_screenCubit/cubit.dart';
import '../../news_screenCubit/states.dart';



class Search extends StatelessWidget {

  var controller = TextEditingController();


  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStatess>(
        listener: (context, state) => {},
        builder: (context, state) {
          var list = NewsCubit
              .get(context)
              .search;
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: defualt_textform(controller: controller,
                      label: "search",
                      prefix: Icons.search,
                      warning: "please insert the search bar ",
                      keytype: TextInputType.text,
                      onchanged:(value)
                      {
                        NewsCubit.get(context).getSearchData(value);
                      }
                  ),
                ),
                SizedBox(height: 20,),
                Expanded(child: articleBuilder(list, context))
              ],
            ),
          );
        }


    );
  }
}
