import 'package:flutter/material.dart';
import 'package:expensestracker/widgets/Expenses.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) => runApp(
        const MaterialApp(home: Expenses()),
      ));
}
