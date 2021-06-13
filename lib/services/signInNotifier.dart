import 'package:flutter/material.dart';

class SignInNotifier extends ValueNotifier<bool> {
  SignInNotifier({bool value}) : super(value ?? false);
  setIsSigned(bool isSigned) {
    value = isSigned;
  }
}
