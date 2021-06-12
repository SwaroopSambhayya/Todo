import 'package:flutter/material.dart';
import 'package:todo/screens/signIn/components/myFormField.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController;
  TextEditingController passwordController;
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
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
                ),
                MyFormField(
                    textController: passwordController,
                    label: "Password",
                    secureText: true,
                    placeholderText: ""),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Login",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                    style: ElevatedButton.styleFrom(
                        minimumSize:
                            Size(MediaQuery.of(context).size.width * 0.85, 60),
                        primary: Theme.of(context).primaryColor),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: Text(
                      "New User? Signup",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(color: Theme.of(context).primaryColor),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
