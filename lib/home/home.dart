import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/auth/auth.dart';
import 'package:todo/firebase/firebaseFinction.dart';
import 'package:todo/home/addTaskBottomSheet.dart';
import 'package:todo/home/tabs/settings_tab.dart';
import 'package:todo/home/tabs/tasks_tab.dart';
import 'package:todo/provider/my_provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Scaffold(
      extendBody: true,
      backgroundColor: Color(0xFFDFECDB),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "ToDo ${provider.userModel?.userName}",
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        actions: [
          ElevatedButton(
              onPressed: () {
                FirebaseFunction.logout();
                Navigator.pushNamedAndRemoveUntil(context,
                    AuthScreen.routeName, (route) => false,);
              },
              child: Icon(Icons.logout,color: Colors.white,),style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade300),)
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.white, width: 3),
            borderRadius: BorderRadius.circular(25)),
        backgroundColor: Colors.blue,
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: AddTaskBottomSheet());
              });
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 31,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        padding: EdgeInsets.zero,
        notchMargin: 8,
        height: 60,
        child: BottomNavigationBar(
            currentIndex: index,
            onTap: (value) {
              index = value;
              setState(() {});
            },
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.transparent,
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.task,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                  ),
                  label: ""),
            ]),
      ),
      body: tabs[index],
    );
  }

  List<Widget> tabs = [TasksTab(), SettingsTab()];
}
