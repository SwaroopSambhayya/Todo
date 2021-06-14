import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/model/taskModel.dart';
import 'package:todo/screens/tasklist/model.dart';

void main() {
  test(
      "Given user when enters title and description and submits task then create a task",
      () async {
    //arrange
    SharedPreferences pref = await SharedPreferences.getInstance();
    TaskProvider taskProvider = TaskProvider(taskLists: []);
    //act
    bool result;
    if (pref.getString("signedIn") == null)
      result = false;
    else
      result = await taskProvider.addTask("Hello", "How are you", "14 jun");
    //assert
    expect(pref.getString("signedIn") == null ? false : true, result);
  });
  test("Given user when logins successfully then retirve tasks", () async {
    //arrange
    SharedPreferences pref = await SharedPreferences.getInstance();
    TaskProvider taskProvider = TaskProvider(
      taskLists: [
        TaskModel(
          user: pref.getString("signedIn"),
          tasks: [
            Task(
                title: "Cool",
                description: "Hello, how are you",
                time: "07 Jun"),
          ],
        ),
      ],
    );
    //act
    bool result;
    if (pref.getString("signedIn") == null)
      result = false;
    else
      result = await taskProvider.getTasks();
    //assert
    expect(pref.getString("signedIn") == null ? false : true, result);
  });
}
