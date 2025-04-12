import 'package:flutter/material.dart';
import 'package:todo/home/home.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "splash";

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1),(){
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
    return Scaffold(
      body: Image.asset(
        "assets/images/splash_todo.png",
        fit: BoxFit.fill,
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }
}
