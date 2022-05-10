import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColorDark: Color.fromARGB(255, 46, 48, 51),
    primaryColorLight: Color.fromARGB(255, 99, 102, 106),
    shadowColor: Color.fromARGB(255, 62, 213, 152),
    hoverColor: Color.fromARGB(255, 62, 213, 152),
    hintColor: Colors.white);

ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColorDark: Color.fromARGB(255, 33, 89, 243),
    primaryColorLight: Color.fromARGB(255, 0, 119, 255),
    hoverColor: Color.fromARGB(255, 0, 119, 255),
    hintColor: Colors.black);

final DarkTheme = ThemeData.dark().copyWith(
  appBarTheme: AppBarTheme(backgroundColor: Colors.black87),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Color.fromARGB(255, 2, 31, 58),
    selectedItemColor: Color.fromARGB(255, 255, 255, 255),
  ),
  primaryColorDark: Color.fromARGB(255, 1, 24, 46),
  primaryColorLight: Color.fromARGB(255, 6, 66, 122),
);

final LightTheme = ThemeData.light().copyWith(
  appBarTheme: AppBarTheme(backgroundColor: Colors.blue),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.blue,
    selectedItemColor: Color.fromARGB(255, 241, 241, 250),
  ),
  primaryColorDark: Colors.black,
  primaryColorLight: Colors.white,
);
