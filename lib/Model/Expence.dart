import 'package:flutter/foundation.dart';
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

  Map<String, dynamic> tojson() {
    return {
      "title": title,
      "amount": amount,
      "date": date.toString(),
      "catogery": catogery.toString().split('.').last,
      "arabic": arabic,
    };
  }

  static Expense fromjson(Map<String, dynamic> json) {
    return Expense(
      title: json["title"],
      amount: json["amount"],
      date: DateTime.parse(json["date"]),
      catogery: Catogery.values
          .firstWhere((e) => e.toString().split('.').last == json["catogery"]),
      arabic: json["arabic"],
    );
  }
}
