import 'package:flutter/material.dart';

import 'package:expense/Model/Expence.dart';

class ExpenseCard extends StatelessWidget {
  const ExpenseCard({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;

    return Card(
      child: Padding(
        padding: EdgeInsets.all((screenheight / screenwidth) * 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: (expense.arabic)
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            Text(expense.title),
            SizedBox(height: screenheight / 40),
            Row(
              children: [
                Icon(catogeryIcons[expense.catogery]),
                SizedBox(width: screenwidth / 50),
                Text("${expense.amount.toStringAsFixed(1)} E£"),
                const Spacer(),
                Text(expense.formattedDate),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
