import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/screens/createTask/view.dart';
import 'package:todo/screens/signIn/view.dart';
import 'package:todo/screens/tasklist/components/taskCard.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:todo/services/signInNotifier.dart';

class Tasks extends StatefulWidget {
  final SignInNotifier signInNotifier;
  Tasks({this.signInNotifier});
  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
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
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          itemCount: 8,
          itemBuilder: (context, index) {
            return TaskCard();
          },
          staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
        ),
      ),
    );
  }
}
