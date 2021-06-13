import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:todo/screens/constants.dart';
import 'package:todo/screens/signIn/components/myFormField.dart';
import 'package:todo/screens/signup/model.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:todo/screens/tasklist/view.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController emailController;
  TextEditingController passwordController;
  TextEditingController confirmPassController;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  SignupModel statusNotifier;
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPassController = TextEditingController();
    statusNotifier = SignupModel();
    super.initState();
  }

  String verifyPassword(String value) {
    if (value.isEmpty) return "Confirm passoword field is mandatory";
    if (value != passwordController.text) return "Password does not match";
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      "Hi, Welcome to Todo",
                      style: Theme.of(context)
                          .textTheme
                          .headline3
                          .copyWith(fontSize: 30),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      "One stop to create and manage tasks",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Center(
                    child: Text(
                      "Signup",
                      style: Theme.of(context)
                          .textTheme
                          .headline3
                          .copyWith(fontSize: 30),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  MyFormField(
                    textController: emailController,
                    label: "Email",
                    validate: emailValidate,
                  ),
                  MyFormField(
                    textController: passwordController,
                    label: "Password",
                    secureText: true,
                    placeholderText: "",
                    validate: validate,
                    maxLines: 1,
                    suffixIcon: EvaIcons.eye,
                  ),
                  MyFormField(
                    textController: confirmPassController,
                    label: "Confirm Password",
                    secureText: true,
                    placeholderText: "",
                    validate: verifyPassword,
                    maxLines: 1,
                    suffixIcon: EvaIcons.eye,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          bool res = await statusNotifier.addUserDetails(
                              emailController.text, passwordController.text);
                          if (res) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Signup Sucessfull"),
                                backgroundColor: Theme.of(context).primaryColor,
                              ),
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Tasks(),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Account already exists"),
                                backgroundColor: Theme.of(context).accentColor,
                              ),
                            );
                          }
                        }
                      },
                      child: ValueListenableBuilder(
                        valueListenable: statusNotifier,
                        builder: (context, value, child) {
                          return !value
                              ? Text(
                                  "Signup",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(fontWeight: FontWeight.w700),
                                )
                              : SpinKitFadingCircle(
                                  color: Colors.white,
                                  size: 30,
                                );
                        },
                      ),
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(
                              MediaQuery.of(context).size.width * 0.85, 60),
                          primary: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
