import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:todo/util/ToDo_tile.dart';
import 'package:todo/util/dialogBox.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  // This widget is the root of your application.
  final _controller = TextEditingController();

  List todolist = [
    ["check excel", false],
    ["check code", false],
    ["excersize", false]
  ];
  void check(bool value, int index) {
    setState(() {
      todolist[index][1] = !todolist[index][1];
    });
  }

  void savenewtask() {
    setState(() {
      todolist.add([_controller.text, false]);
      _controller.clear();
      Navigator.of(context).pop();
    });
  }

  void createtask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onsave: savenewtask,
          oncancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void del(List todolist, int index) {
    setState(() {
      todolist.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: new Center(
            child: Text(" To-Do list", style: TextStyle(fontSize: 30))),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: todolist.length,
        itemBuilder: (context, index) {
          return ToDOTile(
              taskname: todolist[index][0],
              taskcomplete: todolist[index][1],
              onChanged: (value) => check(value!, index),
              onPressed: () => del(todolist, index));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => createtask(),
        child: Icon(Icons.add),
      ),
    );
  }
}

