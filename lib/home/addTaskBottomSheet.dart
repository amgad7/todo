import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/firebase/firebaseFinction.dart';
import 'package:todo/taskModel.dart';

class AddTaskBottomSheet extends StatefulWidget {
  AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  DateTime chosenDate = DateTime.now();
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "add new task",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 26,
          ),
          TextFormField(
            controller: titleController,
            decoration: InputDecoration(
                label: Text("title"),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(12)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(12))),
          ),
          SizedBox(
            height: 26,
          ),
          TextFormField(
            controller: descriptionController,
            decoration: InputDecoration(
                label: Text("descreption"),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(12)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(12))),
          ),
          SizedBox(
            height: 26,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Select time",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(
            height: 26,
          ),
          InkWell(
            onTap: () {
              selectDate(context);
            },
            child: Text(
              "${chosenDate.toString().substring(0, 10)}",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.w100),
            ),
          ),
          SizedBox(
            height: 26,
          ),
          Container(
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {
                    TaskModel model = TaskModel(
                      userId: FirebaseAuth.instance.currentUser!.uid,
                        title: titleController.text,
                        description: descriptionController.text,
                        date: DateUtils.dateOnly(chosenDate)
                            .millisecondsSinceEpoch);
                    FirebaseFunction.addTask(model);
                    Navigator.pop(context);
                  },
                  child: Text(
                    "add task",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                  )))
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
