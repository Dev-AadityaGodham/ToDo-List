// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field

import 'package:flutter/material.dart';
import 'package:to_do_list/utils/dialog_box.dart';
import 'package:to_do_list/utils/todo_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //text controller
  final _controller = TextEditingController();

  //task list
  List toDolist = [
    ["Make videro", true],
  ];

  //save new task

  void AddNewTask() {
    setState(() {
      toDolist.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void checkBoxChange(bool? value, int index) {
    setState(() {
      toDolist[index][1] = !toDolist[index][1];
    });
  }

  //delete task
  void DeleteTask(int index) {
    setState(() {
      toDolist.removeAt(index);
    });
  }

  void creatNewTasks() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            onAdd: AddNewTask,
            onCancel: () => Navigator.of(context).pop(),
            controller: _controller,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        // backgroundColor: Colors.teal.shade200,
        appBar: AppBar(
          title: Center(
              child: Text("T O  L I S T",
                  style: TextStyle(fontWeight: FontWeight.bold))),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: creatNewTasks,
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
            itemBuilder: (context, index) {
              return ToDoTile(
                DeleteTheTask: (context) => DeleteTask(index),
                TaskName: toDolist[index][0],
                TaskCompleted: toDolist[index][1],
                onChanged: (value) => checkBoxChange(value, index),
              );
            },
            itemCount: toDolist.length));
  }
}
