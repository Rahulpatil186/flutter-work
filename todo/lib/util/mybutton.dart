import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  final String buttonName;
  VoidCallback onPressed;
  Mybutton({super.key, required this.buttonName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed,
        color: Colors.lightGreen,
        child: Text(buttonName));
  }
}
