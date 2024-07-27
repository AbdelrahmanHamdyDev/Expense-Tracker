import 'package:flutter/material.dart';

var LightScheme = ColorScheme.fromSeed(
  seedColor: Color(0xFF2E236C),
);
ThemeData LightTheme = new ThemeData().copyWith(
  colorScheme: LightScheme,
  scaffoldBackgroundColor: LightScheme.primaryContainer,
  appBarTheme: AppBarTheme(
    backgroundColor: LightScheme.primary,
    foregroundColor: LightScheme.onPrimary,
  ),
  cardTheme: CardTheme(
    color: LightScheme.surface,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: LightScheme.primary,
      foregroundColor: LightScheme.onPrimary,
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: LightScheme.onPrimaryContainer,
    ),
  ),
);

var DarkScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: Color(0xFF2E236C),
);
ThemeData DarkTheme = new ThemeData.dark().copyWith(
  colorScheme: DarkScheme,
  scaffoldBackgroundColor: DarkScheme.surface,
  appBarTheme: AppBarTheme(
    backgroundColor: DarkScheme.primaryContainer,
    foregroundColor: DarkScheme.onPrimaryContainer,
  ),
  cardTheme: CardTheme(
    color: DarkScheme.secondaryContainer,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: DarkScheme.primaryContainer,
      foregroundColor: DarkScheme.onPrimaryContainer,
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: DarkScheme.onSurface,
    ),
  ),
);
