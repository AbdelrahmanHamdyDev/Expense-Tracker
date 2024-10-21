import 'package:expense/Model/Expence.dart';

var currenttime = DateTime.now();

List<Expense> Allexpences = [
  Expense(
    title: "Dune Movie",
    amount: 120,
    date: currenttime,
    catogery: Catogery.entertainment,
    arabic: false,
  ),
];
