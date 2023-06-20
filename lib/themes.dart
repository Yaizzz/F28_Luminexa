import 'package:flutter/material.dart';

class MyThemes {
  static final primaryColor = Colors.blue.shade300;
  static final primary = Colors.blue;

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColorDark: primaryColor,
    colorScheme: ColorScheme.dark(primary: primary),
    dividerColor: Colors.white,
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(primary: primary),
    primaryColor: primaryColor,
    dividerColor: Colors.black,
  );
}
