import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  primaryColor: Colors.deepPurpleAccent,
  backgroundColor: Colors.black,
  accentColor: Colors.grey[850],
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: TextTheme(
    bodyText1:
        TextStyle(color: Colors.white, fontFamily: "Poppins", fontSize: 18),
    headline3: TextStyle(
      color: Colors.white,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w700,
    ),
  ),
);

String validate(String value) {
  print(value);
  if (value.isEmpty) return "This field is madatory";
  return null;
}

String emailValidate(String value) {
  bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value);
  if (!emailValid) return "Please enter a valid Email";
  return null;
}
