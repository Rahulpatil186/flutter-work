import 'package:flutter/material.dart';
import 'package:expensestracker/model/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});
  final void Function(Expense expense) onAddExpense;
  @override
  State<NewExpense> createState() => _NewExpense();
}

class _NewExpense extends State<NewExpense> {
  final _titlecontroller = TextEditingController();
  final _ammountcontroller = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.food;
  @override
  void dispose() {
    //dispose textediting controller when not needed always dispose controller
    _titlecontroller.dispose();
    _ammountcontroller.dispose();
  }

  void _datePicker() async {
    final now = DateTime.now();
    final firstdate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstdate,
        lastDate: now);

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpenseData() {
    final enteredNumber = double.tryParse(_ammountcontroller.text);
    final ammountIsIvalid = enteredNumber == null || enteredNumber <= 0;
    if (_titlecontroller.text.trim().isEmpty ||
        ammountIsIvalid ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (cxt) => AlertDialog(
          title: Text('invalid input'),
          content: const Text('please make sure to enter valid credentials'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(cxt);
              },
              child: const Text('Okay'),
            )
          ],
        ),
      );
      return;
    }
    widget.onAddExpense(
      Expense(
          title: _titlecontroller.text,
          ammount: enteredNumber,
          date: _selectedDate!,
          category: _selectedCategory),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          TextField(
            controller: _titlecontroller,
            maxLength: 50,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextField(
                  controller: _ammountcontroller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text('ammount'),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                  children: [
                    Text(_selectedDate == null
                        ? 'no Date selected'
                        : formater.format(_selectedDate!)),
                    IconButton(
                        onPressed: _datePicker,
                        icon: const Icon(Icons.calendar_month)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values
                    .map(
                      // ignore: non_constant_identifier_names
                      (Category) => DropdownMenuItem(
                        value: Category,
                        child: Text(
                          Category.name.toUpperCase(),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),
              const Spacer(),
              ElevatedButton(
                  onPressed: () => _submitExpenseData(),
                  child: Text('save expense')),
              const SizedBox(width: 25),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('cancel'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
