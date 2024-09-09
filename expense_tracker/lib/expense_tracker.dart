import 'package:expense_tracker/Components/chart_widget/chart.dart';
import 'package:expense_tracker/Components/expense_list/espense_list.dart';
import 'package:expense_tracker/Components/new_expense.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseTracker extends StatefulWidget {
  const ExpenseTracker({super.key});

  @override
  State<ExpenseTracker> createState() => _ExpenseTrackerState();
}

class _ExpenseTrackerState extends State<ExpenseTracker> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: "Flutter Course",
        amount: 19.99,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: "Cinema",
        amount: 15.69,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  void _expenseAddOverlay() {
    showModalBottomSheet(
        isScrollControlled: true, //true causes full screen modal
        context: context,
        builder: (BuildContext ctx) => NewExpense(stateFunction: addExpense));
  }

  void addExpense(Expense newExpense) {
    setState(() {
      _registeredExpenses.add(newExpense);
    });
  }

  void removeExpense(Expense toBeRemovedExpense) {
    final toBeRemovedExpenseIndex =
        _registeredExpenses.indexOf(toBeRemovedExpense);
    setState(() {
      _registeredExpenses.remove(toBeRemovedExpense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 2),
      content: const Text("Expense removed"),
      action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(
                  toBeRemovedExpenseIndex, toBeRemovedExpense);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget emptyContent = const Center(child: Text("Expences data is empty!"));
    Widget nonEmptyContent = ExpenseList(
        expenses: _registeredExpenses, onRemoveExpense: removeExpense);
    Widget mainContent =
        _registeredExpenses.isEmpty ? emptyContent : nonEmptyContent;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Expense Tracker"),
          actions: [
            IconButton(
                onPressed: _expenseAddOverlay,
                icon: const Icon(Icons.add))
          ],
        ),
        body: Column(
          children: [
            Chart(expenses: _registeredExpenses),
            Expanded(child: mainContent)
          ],
        ));
  }
}
