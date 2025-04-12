import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/auth/auth.dart';
import 'package:todo/firebase_options.dart';
import 'package:todo/home/home.dart';
import 'package:todo/home/splash.dart';
import 'package:todo/provider/my_provider.dart';
import 'package:todo/update_task.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ChangeNotifierProvider(
      create: (context) => MyProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: provider.firebaseUser != null
          ? HomeScreen.routeName
          : AuthScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        AuthScreen.routeName: (context) => AuthScreen(),
        UpdateTask.routeName: (context) => UpdateTask()
      },
    );
  }
}
