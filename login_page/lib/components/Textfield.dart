import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  final controller;
  final String hinttext;
  final bool obscuretext;

  const Textfield(
      {super.key,
      required this.controller,
      required this.obscuretext,
      required this.hinttext});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscuretext,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: Colors.greenAccent)),
          hintText: hinttext,
        ),
      ),
    );
  }
}
