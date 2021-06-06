import 'package:flutter/material.dart';

import 'constants.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: reallyWhiteColor,
    fontFamily: "RobotoCondensed",
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    // --------------------------
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primarySwatch: Colors.blue,
  );
}

TextTheme textTheme() {
  return TextTheme(
    bodyText1: TextStyle(color: whiteColor),
    bodyText2: TextStyle(color: whiteColor),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: reallyWhiteColor,
    elevation: 0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: reallyWhiteColor),
    textTheme: TextTheme(
      headline6: TextStyle(
        color: reallyWhiteColor,
        fontSize: 18,
      ),
    ),
  );
}
