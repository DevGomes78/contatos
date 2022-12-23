import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/error_constants.dart';
import '../constants/string_constants.dart';
import '../model/client_model.dart';

class LoginUser {
  List<dynamic> list = [];
  Future<List?> getsavedUser(context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? jsonUser = prefs.getString(StringConstants.loguinUserInfos);
      Map<String, dynamic> mapUser = json.decode(jsonUser.toString());
      UserModel userModel = UserModel.fromJson(mapUser);
      list= [userModel.name,userModel.mail,userModel.phone].toList();


      return list;
    } catch (e) {
      print('${ErrorConstants.userNotRegister}$e');
    }
    return null;
  }
}