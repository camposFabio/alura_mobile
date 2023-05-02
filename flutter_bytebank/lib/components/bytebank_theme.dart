import 'package:flutter/material.dart';

final bytebanktheme = ThemeData(
  primaryColor: Colors.green.shade900,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: Colors.green.shade900,
    secondary: Colors.blueAccent.shade700,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor:
          MaterialStateProperty.all<Color>(Colors.blueAccent.shade700),
    ),
  ),
);
