import 'package:flutter/material.dart';

class ToDOTile extends StatelessWidget {
  String taskname;
  bool taskcomplete;
  void Function(bool?) onChanged;
  void Function() onPressed;
  ToDOTile({
    super.key,
    required this.taskname,
    required this.taskcomplete,
    required this.onChanged,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadiusDirectional.circular(12)),
        child: Row(children: [
          Checkbox(value: taskcomplete, onChanged: onChanged),
          Text(
            taskname,
            style: TextStyle(
              decoration: taskcomplete
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  margin: EdgeInsets.only(left: 600),
                  child: ElevatedButton(
                      onPressed: onPressed, child: Text("delete"))),
            ],
          )
        ]),
      ),
    );
  }
}
