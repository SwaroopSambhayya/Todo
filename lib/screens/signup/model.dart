import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupModel extends ValueNotifier<bool> {
  SignupModel({bool value}) : super(value ?? false);
  Future<bool> addUserDetails(String email, String password) async {
    value = true;
    bool result = true;
    Map user = {
      "email": email,
      "password": password,
    };
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList("users") == null) {
      await prefs.setStringList("users", [jsonEncode(user)]);
      await prefs.setString("signedIn", email);
    } else {
      List userList = prefs.getStringList("users");
      List userDetails = jsonDecode(userList.toString());
      for (var i = 0; i < userDetails.length; i++) {
        if (userDetails[i]["email"] == email) {
          result = false;
          break;
        }
      }
      if (result) {
        userList.add(jsonEncode(user));
        await prefs.setStringList("users", userList);
        await prefs.setString("signedIn", email);
      }
    }

    value = false;
    return result;
  }
}
