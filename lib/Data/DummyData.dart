import 'package:expense/Expense/Expence.dart';

var currenttime = DateTime.now();

List<Expense> Allexpences = [
  Expense(
      title: "سوري بطاطس",
      amount: 25,
      date: currenttime,
      catogery: Catogery.food,
      arabic: true),
  Expense(
      title: "Dune Movie",
      amount: 60,
      date: currenttime,
      catogery: Catogery.entertainment,
      arabic: false),
];
