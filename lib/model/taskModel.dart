import 'dart:convert';

TaskModel taskModelFromJson(String str) {
  final jsonData = json.decode(str);
  return TaskModel.fromJson(jsonData);
}

String taskModelToJson(TaskModel data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class TaskModel {
  String user;
  List<Task> tasks;

  TaskModel({
    this.user,
    this.tasks,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => new TaskModel(
        user: json["user"],
        tasks: new List<Task>.from(json["tasks"].map((x) => Task.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "tasks": new List<dynamic>.from(tasks.map((x) => x.toJson())),
      };
}

class Task {
  String title;
  String description;
  String time;

  Task({
    this.title,
    this.description,
    this.time,
  });

  factory Task.fromJson(Map<String, dynamic> json) => new Task(
        title: json["title"],
        description: json["description"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "time": time,
      };
}
