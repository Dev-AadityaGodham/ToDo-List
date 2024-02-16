// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  final String ButtonName;
  VoidCallback onPressed;

  
  MyButtons({super.key, required this.onPressed,required this.ButtonName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onPressed ,
      child: Container(
        height: 50,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.cyan.shade200,
          borderRadius: BorderRadius.circular(10)
          
        ),
        child: Center(
          child: Text(ButtonName,style: TextStyle(
            fontWeight: FontWeight.bold
          ),),
        ),
      ),
    );
  }
}
