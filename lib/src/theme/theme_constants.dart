import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  backgroundColor: const Color.fromARGB(0, 102, 102, 102),
  primaryColor: Colors.grey, 
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: Color.fromARGB(255, 20, 16, 72),
    ),
  ),
  textTheme: const TextTheme(
    bodyText2: TextStyle(color: Colors.white),
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  backgroundColor: Color.fromARGB(0, 0, 0, 0),
);
