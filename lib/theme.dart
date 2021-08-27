import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

ThemeData theme(BuildContext context) {
  return ThemeData(
    // scaffoldBackgroundColor: darkBgColor,
    // fontFamily: "RobotoCondensed",
    // appBarTheme: appBarTheme(),
    // textTheme: textTheme(),
    // // --------------------------
    // visualDensity: VisualDensity.adaptivePlatformDensity,
    // primarySwatch: Colors.blue,

    scaffoldBackgroundColor: bgColor,
    textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
        .apply(bodyColor: Colors.white),
    canvasColor: bgColor,
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
    color: bgColor,
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
