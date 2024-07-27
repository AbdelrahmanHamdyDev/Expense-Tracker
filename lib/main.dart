import 'package:flutter/material.dart';
import 'package:expense/Theme.dart';

import 'package:expense/Home_Page.dart';

void main() {
  runApp(
    MaterialApp(
      theme: LightTheme,
      darkTheme: DarkTheme,
      home: const homeScreen(),
    ),
  );
}