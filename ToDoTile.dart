// ignore_for_file: prefer_const_constructors, must_be_immutable


import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String TaskName;
  final bool TaskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? DeleteTheTask;
//delete task
  

  ToDoTile(
      {super.key,
      required this.TaskName,
      required this.TaskCompleted,
      required this.onChanged,
      required this.DeleteTheTask});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Slidable(
        
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(onPressed: DeleteTheTask,
          icon: Icons.delete,
          backgroundColor: Colors.teal.shade300,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
            
          ),
          
          ),
          
        
        ]),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10)
            ),
            color: Colors.teal,
          ),
          child: Row(
            children: [
              Checkbox(
                value: TaskCompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              Text(TaskName,style: TextStyle(
                decoration:TaskCompleted? TextDecoration.lineThrough:TextDecoration.none,
                color: Colors.white,fontSize:20
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
