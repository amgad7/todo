import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:todo/firebase/firebaseFinction.dart';
import 'package:todo/home/task_item.dart';
import 'package:todo/taskModel.dart';

class TasksTab extends StatefulWidget {
   TasksTab({super.key});

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
DateTime selectedDate=DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DatePicker(
          height: 90,
          DateTime.now(),
          initialSelectedDate: selectedDate,
          selectionColor: Colors.blue,
          selectedTextColor: Colors.white,
          onDateChange: (date) {
            selectedDate=date;
            setState(() {

            });

          },
        ),
        Expanded(
          child: StreamBuilder<QuerySnapshot<TaskModel>>(
            stream: FirebaseFunction.getTasks(selectedDate),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Column(
                  children: [
                    Text("Something went Wrong"),
                    ElevatedButton(onPressed: () {}, child: Text("try again")),
                  ],
                );
              }
              var tasks = snapshot.data?.docs
                      .map(
                        (e) => e.data(),
                      )
                      .toList() ??
                  [];
              if(tasks.isEmpty){
                return Center(child: Text("No Tasks"));
              }
              return ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  height: 12,
                ),
                itemBuilder: (context, index) {
                  return TaskItem(taskModel: tasks[index],);
                },
                itemCount: tasks.length,
              );
            },
          ),
        )
      ],
    );
  }
}
