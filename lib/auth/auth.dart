import 'package:flutter/material.dart';
import 'package:todo/login/login.dart';
import 'package:todo/register/register.dart';

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
          title: Text("login",style: TextStyle(fontSize: 30),),
          bottom: TabBar(
            indicatorPadding: EdgeInsets.only(bottom: 3,),
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
