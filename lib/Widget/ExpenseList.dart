import 'package:expense/Theme.dart';
import 'package:flutter/material.dart';

import 'package:expense/Model/Expence.dart';
import 'package:expense/Widget/Expense_Card.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(
      {super.key, required this.expenses, required this.removeExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) removeExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctk, index) => Dismissible(
        background: Container(
          color: LightScheme.error.withOpacity(0.75),
        ),
        direction: DismissDirection.endToStart, //right to left
        onDismissed: (direction) {
          removeExpense(expenses[index]);
        },
        key: ValueKey(expenses[index]),
        child: ExpenseCard(
          expense: expenses[index],
        ),
      ),
    );
  }
}

// 