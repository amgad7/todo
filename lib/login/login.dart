import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/base.dart';
import 'package:todo/firebase/firebaseFinction.dart';
import 'package:todo/home/home.dart';
import 'package:todo/login/login_connector.dart';
import 'package:todo/login/login_view_model.dart';
import 'package:todo/provider/my_provider.dart';

class LoginTab extends StatefulWidget {
  LoginTab({super.key});

  @override
  State<LoginTab> createState() => _LoginTabState();
}

class _LoginTabState extends BaseView<LoginTab, LoginViewModel>
    implements LoginConnector {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    viewModel.connector = this;
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              decoration: InputDecoration(
                label: Text("email"),
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                errorBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              controller: passwordController,
              decoration: InputDecoration(
                label: Text("passowrd"),
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                errorBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      viewModel.login(
                        emailController.text,
                        passwordController.text,
                      );
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    )))
          ],
        ),
      ),
    );
  }

  @override
  goToHome() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      HomeScreen.routeName,
      (route) => false,
    );
  }

  @override
  LoginViewModel initMyViewModel() {
   return  LoginViewModel();
  }
}
