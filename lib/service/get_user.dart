import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/error_constants.dart';
import '../constants/string_constants.dart';
import '../model/client_model.dart';

class LoginUser {

  Future<UserModel?> getsavedUser(context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? jsonUser = prefs.getString(StringConstants.loguinUserInfos);
      Map<String, dynamic> mapUser = json.decode(jsonUser.toString());
      UserModel userModel = UserModel.fromJson(mapUser);
      return userModel;
    } catch (e) {
      print('${ErrorConstants.userNotRegister}$e');
    }
    return null;
  }
}