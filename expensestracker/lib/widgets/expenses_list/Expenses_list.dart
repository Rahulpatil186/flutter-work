import 'package:expensestracker/model/expense.dart';
import 'package:expensestracker/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses,required this.onRemoveExpense});
  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      //creates scrollable widget where length of list is not defined
      itemBuilder: (context, index) => Dismissible(key: ValueKey(Expenses_item(expenses[index])),
      onDismissed:(direction) => onRemoveExpense(expenses[index]),
      
      child: Expenses_item(expenses[index]),) ,
    );
  }
}
