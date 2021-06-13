import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SigninModel extends ValueNotifier<bool> {
  SigninModel({bool isSigned}) : super(isSigned ?? false);
  Future<bool> checkUserDetails(String email, String password) async {
    value = true;
    bool result = false;
    SharedPreferences pref = await SharedPreferences.getInstance();
    //pref.remove("users");
    List userList = jsonDecode(pref.getStringList("users").toString());

    if (userList == null)
      result = false;
    else {
      for (var i = 0; i < userList.length; i++) {
        if (userList[i]["email"] == email &&
            userList[i]["password"] == password) {
          result = true;
          await pref.setString("signedIn", email);
          break;
        }
      }
    }

    value = false;
    return result;
  }
}
