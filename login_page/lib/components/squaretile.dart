import 'package:flutter/material.dart';

class squaretile extends StatelessWidget {
  final String imagepath;
  const squaretile({super.key, required this.imagepath});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(imagepath, height: 72),
    );
  }
}
