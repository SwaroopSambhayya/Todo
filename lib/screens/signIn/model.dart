import 'package:flutter/cupertino.dart';

class SigninModel extends ValueNotifier<bool> {
  SigninModel({bool isSigned}) : super(isSigned ?? false);
  void checkUserDetails(String email, String password) {}
}
