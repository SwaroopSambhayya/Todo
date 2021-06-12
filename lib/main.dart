import 'package:flutter/material.dart';
import 'package:todo/screens/constants.dart';
import 'package:todo/screens/signIn/view.dart';
import 'package:todo/screens/tasklist/view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isSigned = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: isSigned ? Tasks() : SignIn(),
    );
  }
}
