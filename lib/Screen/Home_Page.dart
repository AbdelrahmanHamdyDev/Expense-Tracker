import 'dart:convert';

import 'package:expense/Model/Expence.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:expense/Data/DummyData.dart';
import 'package:expense/Widget/ExpenseList.dart';
import 'package:expense/Screen/Add_Page.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() {
    return _homeScreenState();
  }
}

class _homeScreenState extends State<homeScreen> {
  void _loadData() async {
    print("i'm loading");
    final prefs = await SharedPreferences.getInstance();
    final String? Data = prefs.getString('Data');
    if (Data != null) {
      List<dynamic> ConvertedData = jsonDecode(Data);
      setState(() {
        Allexpences =
            ConvertedData.map((json) => Expense.fromjson(json)).toList();
      });
    }
  }

  void _saveData() async {
    print("i'm saving");
    final prefs = await SharedPreferences.getInstance();
    final List<Map<String, dynamic>> ConvertedData =
        Allexpences.map((expense) => expense.tojson()).toList();
    prefs.setString('Data', jsonEncode(ConvertedData));
  }

  void addExpense(expense) {
    setState(() {
      Allexpences.add(expense);
      _saveData();
    });
  }

  void removeExpense(expense) {
    int expenseIndex = Allexpences.indexOf(expense);
    setState(() {
      Allexpences.remove(expense);
      _saveData();
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
              _saveData();
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
  void initState() {
    super.initState();
    _loadData();
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
