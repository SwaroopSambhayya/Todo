import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/model/taskModel.dart';
import 'package:todo/screens/createTask/view.dart';
import 'package:todo/screens/signIn/view.dart';
import 'package:todo/screens/tasklist/components/taskCard.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:todo/services/signInNotifier.dart';
import 'package:todo/screens/tasklist/model.dart';

class Tasks extends StatefulWidget {
  final SignInNotifier signInNotifier;
  Tasks({this.signInNotifier});
  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<void> getData() async {
    await Provider.of<TaskProvider>(context, listen: false).getTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text("Tasks"),
        backgroundColor: Theme.of(context).backgroundColor,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.remove("signedIn");
              widget.signInNotifier.value = false;
            },
          ),
        ],
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(right: 20, bottom: 30),
        width: 60,
        height: 60,
        child: FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 36,
          ),
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CreateTask(),
              ),
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: SafeArea(
        child: Consumer<TaskProvider>(
          builder: (context, taskProvider, child) {
            List<Task> tasks;
            if (taskProvider.userTasks == null)
              tasks = [];
            else
              tasks = taskProvider.userTasks.tasks;
            return taskProvider.isLoading
                ? Center(
                    child: SpinKitFadingCircle(
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                : taskProvider.userTasks == null
                    ? Container(
                        margin: EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Icon(
                                Icons.photo_album_outlined,
                                size: 200,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "You dont have any task added, please add the task by clicking add icon",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(color: Colors.grey),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      )
                    : StaggeredGridView.countBuilder(
                        crossAxisCount: 4,
                        itemCount: tasks.length,
                        itemBuilder: (context, index) {
                          return TaskCard(
                            title: tasks[index].title,
                            time: tasks[index].time,
                            description: tasks[index].description,
                          );
                        },
                        staggeredTileBuilder: (int index) =>
                            StaggeredTile.fit(2),
                        mainAxisSpacing: 1,
                        crossAxisSpacing: 1,
                      );
          },
        ),
      ),
    );
  }
}
