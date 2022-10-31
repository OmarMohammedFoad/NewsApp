import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData darkThemeData=ThemeData(
colorSchemeSeed:Colors.deepOrange,
primaryColor: Colors.deepOrange,
scaffoldBackgroundColor: HexColor("333739"),
appBarTheme:  AppBarTheme(
backwardsCompatibility: false,
backgroundColor: HexColor("333739"),
elevation: 00.0,
systemOverlayStyle:SystemUiOverlayStyle
(
statusBarColor:HexColor("333739"),
statusBarIconBrightness:Brightness.light
),
titleTextStyle:const TextStyle
(
color: Colors.white,
fontWeight: FontWeight.bold,
fontSize: 20,
),
iconTheme:const IconThemeData(color: Colors.white,size: 30)
),
bottomNavigationBarTheme:BottomNavigationBarThemeData
(
type:BottomNavigationBarType.fixed,
backgroundColor: HexColor("333739"),
elevation: 20.00,
selectedItemColor: Colors.deepOrange,
unselectedItemColor: Colors.grey
),
textTheme:const TextTheme
(
bodyText1:TextStyle(
fontWeight: FontWeight.w600,
fontSize: 18.5,
color: Colors.white
)


)
);
ThemeData lightThemeData=ThemeData(
  //     colorSchemeSeed:Colors.deepOrange,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.deepOrange,

    // buttonColor: Colors.deepOrange,

    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 00.0,
        systemOverlayStyle:SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness:Brightness.dark),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,

        ),
        iconTheme: IconThemeData(color: Colors.deepOrange,size: 30)
    ),
    bottomNavigationBarTheme:BottomNavigationBarThemeData(
      type:BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      elevation: 20.00,
      selectedItemColor: Colors.deepOrange,

      // selectedItemColor:Colors.
    ),
    textTheme: const TextTheme(
        bodyText1: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18.5,
            color: Colors.black

        )

    ),
  fontFamily:"Jannah",
  buttonColor: Colors.deepOrange
);