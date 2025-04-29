import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo/base.dart';
import 'package:todo/firebase/firebaseFinction.dart';
import 'package:todo/register/register_connector.dart';

import '../userModel.dart';

class RegisterViewModel extends BaseViewModel<RegisterConnector> {
  void createUserAccount({
    required String email,
    required String password,
    required String phone,
    required String userName,
  }) async {
    try {
      connector!.showLoading();
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserModel user = UserModel(
          id: credential.user?.uid ?? "",
          email: email,
          userName: userName,
          phone: phone);
      await FirebaseFunction.addUser(user);
      connector!.hideLoading();
      connector!.success();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        connector!.hideLoading();
        connector!.showMessage(message: e.message ?? "");
      }
    } catch (e) {
      connector!.hideLoading();
      connector!.showMessage(message: "something went wrong");
    }
  }
}
