import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:todo/screens/constants.dart';
import 'package:todo/screens/signIn/components/myFormField.dart';
import 'package:todo/screens/signIn/model.dart';
import 'package:todo/screens/signup/view.dart';
import 'package:todo/screens/tasklist/view.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:todo/services/signInNotifier.dart';

class SignIn extends StatefulWidget {
  final SignInNotifier signInNotifier;
  SignIn({this.signInNotifier});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController;
  TextEditingController passwordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  SigninModel signInStatus;
  bool showPass = false;
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    signInStatus = SigninModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
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
                      "Login",
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
                      validate: emailValidate),
                  MyFormField(
                    textController: passwordController,
                    label: "Password",
                    secureText: !showPass ? true : false,
                    maxLines: 1,
                    placeholderText: "",
                    validate: validate,
                    suffixIcon: showPass ? EvaIcons.eyeOff : EvaIcons.eye,
                    suffixIconPressed: () {
                      setState(() {
                        showPass = !showPass;
                      });
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState.validate()) {
                          bool result = await signInStatus.checkUserDetails(
                              emailController.text, passwordController.text);
                          if (result) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Signin successfull"),
                                backgroundColor: Theme.of(context).primaryColor,
                              ),
                            );
                            widget.signInNotifier.value = true;
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Incorrect email/password"),
                                backgroundColor: Theme.of(context).primaryColor,
                              ),
                            );
                          }
                        }
                      },
                      child: ValueListenableBuilder(
                        valueListenable: signInStatus,
                        builder: (context, isLoading, child) {
                          return isLoading
                              ? SpinKitFadingCircle(
                                  size: 30,
                                  color: Colors.white,
                                )
                              : Text(
                                  "Login",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(fontWeight: FontWeight.w700),
                                );
                        },
                      ),
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(
                              MediaQuery.of(context).size.width * 0.85, 60),
                          primary: Theme.of(context).primaryColor),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: EdgeInsets.all(20),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Signup(),
                            ),
                          );
                        },
                        child: Text(
                          "New User? Signup",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
