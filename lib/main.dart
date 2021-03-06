import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/model/taskModel.dart';
import 'package:todo/screens/constants.dart';
import 'package:todo/screens/signIn/view.dart';
import 'package:todo/screens/tasklist/view.dart';
import 'package:todo/services/signInNotifier.dart';
import 'package:todo/screens/tasklist/model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  List<TaskModel> taskList = await getTasks();

  runApp(
    ChangeNotifierProvider(
        create: (_) => TaskProvider(taskLists: taskList), child: MyApp()),
  );
}

Future<List<TaskModel>> getTasks() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  List<TaskModel> taskList = [];

  List taskData = jsonDecode(
    pref.getString("userTasks"),
  );
  if (taskData == null) {
    return [];
  } else {
    for (var i in taskData) {
      taskList.add(TaskModel.fromJson(i));
    }
  }
  return taskList;
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
      title: 'Todo',
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
