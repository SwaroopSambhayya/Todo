import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/screens/constants.dart';
import 'package:todo/screens/signIn/components/myFormField.dart';
import 'package:todo/screens/tasklist/model.dart';
import 'package:intl/intl.dart';

class CreateTask extends StatefulWidget {
  @override
  _CreateTaskState createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  TextEditingController titleController;
  TextEditingController descriptionController;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    super.initState();
  }

  getDate() {
    DateTime date = DateTime.now();
    DateFormat formatter = DateFormat("dd MMM");
    return formatter.format(date).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text("Add Task"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: MyFormField(
                    label: "Title",
                    textController: titleController,
                    validate: validate,
                    placeholderText: "",
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: MyFormField(
                    label: "Description",
                    textController: descriptionController,
                    validate: validate,
                    placeholderText: "Enter Description...",
                    maxLines: 8,
                    shouldFloat: true,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      String time = getDate();

                      bool result = await Provider.of<TaskProvider>(context,
                              listen: false)
                          .addTask(titleController.text,
                              descriptionController.text, time);
                      if (result) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Task successfully added"),
                          ),
                        );
                        Navigator.pop(context);
                      }
                    }
                  },
                  child: Text(
                    "Add",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      minimumSize:
                          Size(MediaQuery.of(context).size.width * 0.85, 60),
                      primary: Theme.of(context).primaryColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
