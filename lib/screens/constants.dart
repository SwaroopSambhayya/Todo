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
