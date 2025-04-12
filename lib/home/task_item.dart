import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/firebase/firebaseFinction.dart';
import 'package:todo/taskModel.dart';
import 'package:todo/update_task.dart';

class TaskItem extends StatelessWidget {
  TaskModel taskModel;
  TaskItem({required this.taskModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(18)),
      child: Slidable(
        startActionPane: ActionPane(motion: DrawerMotion(), children: [
          SlidableAction(
            onPressed: (context) {
              FirebaseFunction.deleteTask(taskModel.id ?? "");
            },
            label: "Delete",
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              bottomLeft: Radius.circular(25),
            ),
            icon: Icons.delete,
            spacing: 10,
            backgroundColor: Colors.red,
          ),
          SlidableAction(
            onPressed: (context) {
              Navigator.pushNamed(context, UpdateTask.routeName);
            },
            label: "Edit",
            spacing: 10,
            icon: Icons.edit,
            backgroundColor: Colors.blue,
          )
        ]),
        child: InkWell(
          onTap: () {
            taskModel.isDone = true;
            FirebaseFunction.updateTask(taskModel);
          },
          child: Container(
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                Container(
                  width: 8,
                  height: 80,
                  decoration: BoxDecoration(
                      color: taskModel.isDone! ? Colors.green : Colors.blue,
                      borderRadius: BorderRadius.circular(25)),
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        taskModel.title ?? "",
                        style: TextStyle(fontSize: 25),
                      ),
                      Text(taskModel.description ?? ""),
                    ],
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Container(
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                    decoration: BoxDecoration(
                        color: taskModel.isDone! ? Colors.green : Colors.blue,
                        borderRadius: BorderRadius.circular(14)),
                    child: Icon(
                      Icons.done,
                      color: Colors.white,
                      size: 30,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
