import 'package:flutter/material.dart';

Map themeMap = {
  "light": ThemeData(
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      color: Colors.black12,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(Colors.grey[200]!),
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
      elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(Colors.black),
            textStyle: MaterialStatePropertyAll<TextStyle>(
              TextStyle(color: Colors.black),
            )),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(color: Colors.deepPurple)),
};
