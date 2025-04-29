import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo/base.dart';
import 'package:todo/login/login_connector.dart';

class LoginViewModel extends BaseViewModel<LoginConnector> {

  login(
    String email,
    String password,
  ) async {
    try {
      connector!.showLoading();
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      connector!.hideLoading();
      connector!.goToHome();
    } on FirebaseAuthException catch (e) {
      connector!.showMessage(message: e.message ?? "");
    }
  }
}
