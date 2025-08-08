
// Shared preference is used to
//Remembering if the user is logged in

//Storing theme or language settings

//Tracking whether the onboarding screen was shown

// Saving the last selected tab, search keyword, etc.

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper{

  static String userIdKey ="USERKEY";
  static String userNameKey = "USERNAMEKEY";
  static String userEmailKey = "USEREMAILKEY";





Future<bool>saveUserId (String getUserId) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();;
  return prefs.setString(userIdKey,getUserId );

}

Future<bool>   saveUserName(String getUserName)async{
   SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString(userNameKey, getUserName);
}

Future<bool> saveUserEmail(String getUserEmail)async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString(userEmailKey, getUserEmail);
}

static Future <String?> getUserEmail()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString( userEmailKey);
}

static Future<String?> getUserName()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString( userNameKey);
}

Future<String?> getUserId()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString( userIdKey);
}



}