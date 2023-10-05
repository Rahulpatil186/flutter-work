import 'package:flutter/material.dart';
import 'package:todo/util/mybutton.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onsave;
  VoidCallback oncancel;
  DialogBox(
      {super.key,
      required this.controller,
      required this.onsave,
      required this.oncancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: Container(
            height: 120,
            child: Column(
              children: [
                TextField(
                  controller: controller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "add new task"),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Mybutton(
                        buttonName: "save",
                        onPressed: onsave,
                      ),
                      SizedBox(width: 10),
                      Mybutton(
                        buttonName: "cancel",
                        onPressed: oncancel,
                      )
                    ],
                  ),
                )
              ],
            )));
  }
}
