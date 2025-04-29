import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/base.dart';
import 'package:todo/firebase/firebaseFinction.dart';
import 'package:todo/home/home.dart';
import 'package:todo/register/register_connector.dart';
import 'package:todo/register/register_view_model.dart';

class RegisterTab extends StatefulWidget {
  RegisterTab({super.key});

  @override
  State<RegisterTab> createState() => _RegisterTabState();
}

class _RegisterTabState extends BaseView<RegisterTab, RegisterViewModel>
    implements RegisterConnector {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var userNameController = TextEditingController();

  var phoneController = TextEditingController();

  var formKey = GlobalKey<FormState>();

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.connector=this;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: userNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "userName required";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  label: Text("userName"),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "email required";
                  }
                  bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value);
                  if (!emailValid) {
                    return "please write email valid ex:xx.xx.com";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  label: Text("email"),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: phoneController,
                decoration: InputDecoration(
                  label: Text("phone"),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "phone required";
                  }
                  if (value.length < 6) {
                    return "password should be at 6 char";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  label: Text("passowrd"),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          viewModel.createUserAccount(
                            email: emailController.text,
                            password: passwordController.text,
                            userName: userNameController.text,
                            phone: phoneController.text,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                      child: Text(
                        "Register",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      )))
            ],
          ),
        ),
      ),
    );
  }

  @override
  RegisterViewModel initMyViewModel() {
    return RegisterViewModel();
  }

  @override
  success() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      HomeScreen.routeName,
      (route) => false,
    );
  }
}
