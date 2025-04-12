import 'package:flutter/material.dart';
import 'package:todo/auth/login.dart';
import 'package:todo/auth/register.dart';

class AuthScreen extends StatelessWidget {
  static const String routeName = "auth";
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("login"),
          bottom: TabBar(
            indicatorColor: Colors.white,

              tabs: [
            Text("login"),
            Text("register"),
          ]),
        ),
        body: TabBarView(children: [
          LoginTab(),
          RegisterTab(),
        ]),
      ),
    );
  }
}
