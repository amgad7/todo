import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/firebase/firebaseFinction.dart';
import 'package:todo/taskModel.dart';

class UpdateTask extends StatefulWidget {
  static const String routeName = "update";
  UpdateTask({super.key});

  @override
  State<UpdateTask> createState() => _UpdateTaskState();
}

class _UpdateTaskState extends State<UpdateTask> {
  DateTime chosenDate = DateTime.now();

  var titleController = TextEditingController();

  var descriptionController = TextEditingController();
  TaskModel? taskModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDFECDB),
      appBar: AppBar(
        backgroundColor: Color(0xff5D9CEC),
        title: Text(
          "To Do List",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                color: Color(0xff5D9CEC),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 30),
                  width: MediaQuery.of(context).size.width * .9,
                  height: MediaQuery.of(context).size.height * .7,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),

                ),
              )
            ],
          )
        ],
      ),
    );
  }

  selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: chosenDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        Duration(days: 365),
      ),
    );
    if (selectedDate != null) {
      chosenDate = selectedDate;
      setState(() {});
    }
  }
}
