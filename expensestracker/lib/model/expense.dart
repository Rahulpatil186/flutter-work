import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formater = DateFormat.yMd();

final uuid = Uuid();

enum Category { food, travel, leisure, work }

const categoryIcons = {
  //map
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class Expense {
  Expense(
      {required this.title,
      required this.ammount,
      required this.date,
      required this.category})
      : id = uuid.v4(); //v4() generates id in string formate
  final String title;
  final double ammount;
  final String id;
  final DateTime date;
  Category category;

  String get formatedDate {
    //add third party  package intl to format date Using flutter pub add intl
    return formater.format(date);
  }
}
