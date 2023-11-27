import 'package:flutter/material.dart';

Map themeMap = {
  "light": ThemeData(
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      color: Colors.teal,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor:
              MaterialStatePropertyAll<Color>(Colors.pinkAccent[200]!),
          textStyle: const MaterialStatePropertyAll<TextStyle>(
            TextStyle(color: Colors.black),
          )),
    ),
  ),
  "dark": ThemeData(
      brightness: Brightness.dark,
      // appBarTheme: const AppBarTheme(
      //   color: Colors.purple,
      // ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor:
                MaterialStatePropertyAll<Color>(Colors.purpleAccent[200]!),
            textStyle: const MaterialStatePropertyAll<TextStyle>(
              TextStyle(color: Colors.black),
            )),
      ),
      progressIndicatorTheme:
          const ProgressIndicatorThemeData(color: Color(0xFF3f3f3f))),
};
