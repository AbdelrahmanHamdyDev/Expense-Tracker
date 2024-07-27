import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

var formatter = DateFormat.yMd();

enum Catogery { utilities, groceries, food, entertainment, saving }

var catogeryIcons = {
  Catogery.utilities: Icons.home,
  Catogery.groceries: Icons.shopping_cart,
  Catogery.food: Icons.food_bank,
  Catogery.entertainment: Icons.movie_creation,
  Catogery.saving: Icons.savings_rounded,
};

class Expense {
  const Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.catogery,
    required this.arabic,
  });

  final String title;
  final double amount;
  final DateTime date;
  final Catogery catogery;
  final bool arabic;

  String get formattedDate {
    return formatter.format(date);
  }
}
