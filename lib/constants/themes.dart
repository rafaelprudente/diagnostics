import 'package:flutter/material.dart';

final ThemeData lightRedTheme = ThemeData(
  primaryColor: Colors.red,
  buttonColor: Colors.red,
  brightness: Brightness.light,
  accentColor: Colors.redAccent,
  appBarTheme: const AppBarTheme(color: Colors.red),
  scaffoldBackgroundColor: Colors.redAccent,
);

final ThemeData darkRedTheme = ThemeData(
  primaryColor: Colors.red,
  buttonColor: Colors.red,
  brightness: Brightness.dark,
  accentColor: Colors.redAccent,
  appBarTheme: const AppBarTheme(color: Colors.red),
  scaffoldBackgroundColor: Colors.redAccent,
);
