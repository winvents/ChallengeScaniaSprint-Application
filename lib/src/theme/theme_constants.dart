import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Color.fromARGB(255, 20, 20, 20),
  primaryColor: Colors.grey,
  textTheme: const TextTheme(
    bodyText2: TextStyle(color: Colors.white),
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  backgroundColor: Color.fromARGB(0, 0, 0, 0),
);
