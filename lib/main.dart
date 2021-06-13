import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/screens/constants.dart';
import 'package:todo/screens/signIn/view.dart';
import 'package:todo/screens/tasklist/view.dart';
import 'package:todo/services/signInNotifier.dart';
import 'package:todo/screens/tasklist/model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => TaskProvider(), child: MyApp()),
  );
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SharedPreferences prefs;

  SignInNotifier _notifier;
  @override
  void initState() {
    initializeApp();
    super.initState();
  }

  initializeApp() async {
    _notifier = SignInNotifier();
    prefs = await SharedPreferences.getInstance();
    if (prefs.getString("signedIn") == null)
      _notifier.value = false;
    else {
      _notifier.value = true;
      print(
        prefs.getString("signedIn"),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: ValueListenableBuilder(
        valueListenable: _notifier,
        builder: (context, isSignedIn, child) {
          return isSignedIn
              ? Tasks(
                  signInNotifier: _notifier,
                )
              : SignIn(signInNotifier: _notifier);
        },
      ),
    );
  }
}
