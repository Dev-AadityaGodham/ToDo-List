// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:to_do_list/utils/my_buttons.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onAdd;
  VoidCallback onCancel;
  DialogBox({super.key,required this.controller,required this.onAdd,required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      
      backgroundColor: Colors.cyan,
      content: Container(
        
        height: 130,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Enter The New Task",
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyButtons(onPressed: onAdd, ButtonName: "Add"),
                
                MyButtons(onPressed: onCancel, ButtonName: "Cancel")
              ],
            )
          ],
        ),
      ),
    );
  }
}
