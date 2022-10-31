import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'News_App/search/search.dart';
import 'components/defaultButton.dart';
import 'cubit/cubit.dart';
import 'news_screenCubit/cubit.dart';
import 'news_screenCubit/states.dart';


class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStatess>(
      listener: (context, state) => {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title:const Text
              (
              "NewsApp",
              ),
            actions: [
              IconButton(onPressed:(){
                NavigateTo(context,Search());
              } ,
                  icon: Icon(Icons.search),

              ),
              IconButton(
                  icon: Icon(Icons.brightness_4_outlined),onPressed:(){
                AppCubit.get(context).changeBrightnessModee();
              } ,)

            ],
          ),


          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.current_indx,
            items: cubit.BottomItem,
            onTap: cubit.changeBottom,
          ),
          body: cubit.pages[cubit.current_indx],
        );
      },
    );
  }
}
