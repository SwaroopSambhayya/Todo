import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/model/taskModel.dart';

class TaskProvider extends ChangeNotifier {
  List<TaskModel> taskLists = [];
  TaskModel userTasks;
  bool isLoading = true;
  Future getTasks() async {
    isLoading = true;
    SharedPreferences pref = await SharedPreferences.getInstance();

    userTasks = null;
    var data = pref.getString("userTasks");
    print(data);
    if (data != null) {
      List temp = jsonDecode(data);

      for (var i = 0; i < temp.length; i++) {
        if (temp[i]["user"] == pref.getString("signedIn")) {
          userTasks = TaskModel.fromJson(temp[i]);
          break;
        }
      }
    }

    isLoading = false;

    notifyListeners();
    return true;
  }

  Future<bool> addTask(title, description, time) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    isLoading = true;

    //print(taskLists);
    if (userTasks == null) {
      userTasks = TaskModel(
        user: pref.getString("signedIn"),
        tasks: [
          Task(title: title, time: time, description: description),
        ],
      );
      await updateTaskList(true);
    } else {
      print("Cool");
      userTasks.tasks.add(
        Task(title: title, time: time, description: description),
      );
      await updateTaskList(false);
    }

    isLoading = false;
    notifyListeners();
    return true;
  }

  updateTaskList(newRecord) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (newRecord) {
      taskLists.add(userTasks);
    } else {
      for (var i = 0; i < taskLists.length; i++) {
        if (taskLists[i].user == pref.getString("signedIn")) {
          taskLists[i] = userTasks;
        }
      }
    }
    pref.setString(
      "userTasks",
      jsonEncode(taskLists),
    );
  }
}
