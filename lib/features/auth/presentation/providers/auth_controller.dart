import 'dart:convert';

import 'package:crafty_bay/features/auth/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  static const _tokenkey = 'access-token';
  static const _userkey = 'user-data';

  static UserModel? userModel;
  static String? accessToken;

  static Future<void> saveUserData(String token, UserModel model) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(_tokenkey, token);
    await preferences.setString(_userkey, jsonEncode(model.toJson()));
    accessToken = token;
    userModel = model;

  }
  static Future<void> getUserData() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    accessToken = preferences.getString(_tokenkey);
    String? userDataString = preferences.getString(_userkey);
    if(userDataString != null){
      userModel = UserModel.fromJson(jsonDecode(userDataString));
    }
  }

  static Future<bool> isAlreadyLoggedIn() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(_tokenkey) != null;

  }
  static Future<void> clearUserData() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}