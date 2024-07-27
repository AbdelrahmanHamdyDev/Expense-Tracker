import 'package:flutter/material.dart';

import 'package:expense/Data/DummyData.dart';
import 'package:expense/Expense/ExpenseList.dart';
import 'package:expense/Add_Page.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() {
    return _homeScreenState();
  }
}

class _homeScreenState extends State<homeScreen> {
  void addExpense(expense) {
    setState(() {
      Allexpences.add(expense);
    });
  }

  void removeExpense(expense) {
    int expenseIndex = Allexpences.indexOf(expense);
    setState(() {
      Allexpences.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text("Expense Removed."),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              Allexpences.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  void _AddingPage() {
    showModalBottomSheet(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      context: context,
      builder: (ctk) => AddingExpense(Addexpense: addExpense),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
        actions: [
          IconButton(
            onPressed: _AddingPage,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
        child: (Allexpences.isEmpty)
            ? const Center(
                child: Text("Enter Some Expenses to Show!"),
              )
            : Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenwidth / 60,
                  vertical: screenheight / 50,
                ),
                child: ExpenseList(
                  expenses: Allexpences,
                  removeExpense: removeExpense,
                ),
              ),
      ),
    );
  }
}
