import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo/firebase/firebaseFinction.dart';
import 'package:todo/userModel.dart';

class MyProvider extends ChangeNotifier {
  User? firebaseUser;
  UserModel? userModel;

  MyProvider() {
    firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      initUser();
    }
  }

  initUser() async {
    userModel = await FirebaseFunction.readUser();
  }
}
