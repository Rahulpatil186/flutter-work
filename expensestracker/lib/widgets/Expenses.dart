import 'package:expensestracker/widgets/New_expense.dart';
import 'package:expensestracker/widgets/expenses_list/Expenses_list.dart';
import 'package:expensestracker/model/expense.dart';
import 'package:expensestracker/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() => _Expenses();
}

class _Expenses extends State<Expenses> {
  final List<Expense> _registerexpenses = [
    Expense(
        title: 'flutter course',
        ammount: 20.0,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'cinema',
        ammount: 23.0,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  void _openAddExpenseOverlay() {
    // ignore: unused_element
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpense(onAddExpense: _addExpense));
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registerexpenses.add(expense);
    });
  }

  void removeExpense(Expense expense) {
    setState(() {
      _registerexpenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense tracker"),
        actions: [
          IconButton(
              style: const ButtonStyle(
                  iconColor: MaterialStatePropertyAll(Colors.white)),
              onPressed: _openAddExpenseOverlay,
              icon: const Icon(Icons.add)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ExpensesList(
                  expenses: _registerexpenses, onRemoveExpense: removeExpense)),
        ],
      ),
    );
  }
}
