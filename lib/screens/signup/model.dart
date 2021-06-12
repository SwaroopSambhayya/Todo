import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupModel extends ValueNotifier<bool> {
  SignupModel({bool value}) : super(value ?? false);
  Future<void> addUserDetails(String email, String password) async {
    value = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList("users").isEmpty)
      prefs.setStringList("users", ["{email:$email,password:$password}"]);
    else {
      List myList = prefs.getStringList("users");
      myList.add("{email:$email,password:$password}");
      prefs.setStringList("users", myList);
    }
    print(prefs.getStringList("user"));
    value = false;
  }
}
