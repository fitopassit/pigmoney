import 'package:flutter/material.dart';

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
