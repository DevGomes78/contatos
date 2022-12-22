import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

import '../constants/string_constants.dart';
import '../model/client_model.dart';
import '../views/clientes.dart';

class SaveUser {
  saveUser(UserModel userModel, context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(
      StringConstants.loguinUserInfos,
      json.encode(userModel.toJson()),
    );
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ClientPage()));
  }
}