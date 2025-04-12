import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/firebase/firebaseFinction.dart';
import 'package:todo/home/home.dart';
import 'package:todo/provider/my_provider.dart';

class LoginTab extends StatelessWidget {
  LoginTab({super.key});
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return Padding(
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
                    FirebaseFunction.login(
                        emailController.text, passwordController.text,
                            () {
                          provider.initUser();
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        HomeScreen.routeName,
                        (route) => false,
                      );
                    }, (error) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("error"),
                            content: Text(error),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  }, child: Text("ok"))
                            ],
                          );
                        },
                      );
                    });
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  )))
        ],
      ),
    );
  }
}
