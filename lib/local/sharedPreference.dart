import 'package:shared_preferences/shared_preferences.dart';

class cacheHelper
{
  static SharedPreferences? sharedPreferences;

  static init() async
  {
      sharedPreferences= await  SharedPreferences.getInstance();
  }


 static  Future<bool?>   setbool(
  {
    required String key,
    required bool value
  }) async
  {
 return  await sharedPreferences?.setBool(key, value);
  }

  static bool? getbool(
      {
        required String key,
      })
  {
    return  sharedPreferences?.getBool(key);
  }





}