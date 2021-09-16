import 'package:flutter/material.dart';

import 'size_config.dart';

const kPrimaryColor = Color(0xFF3A37C2);
const kPrimaryLightColor = Color(0xFF858BA6);
const kSecondaryColor = Color(0xFF979797);
const greyColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);
const defaultDuration = Duration(milliseconds: 250);

//Dashbord / HomeScreen
const primaryColor = Color(0xFF2697FF);
const secondaryColor = Color(0xFF73BCFF);
const darkBgColor = Color(0xFF212332);
const bgColor = Color(0xFF2A2D3E);
const whiteColor = Colors.white70;
const reallyWhiteColor = Colors.white;
const greenColor = Color(0xFF1EB980);
const defaultPadding = 16.0;
const redColor = Color(0xFFFF6859);

//regex patterns
const String emailPattern =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//add tel fax fixe regex
const String kIceNullError = "Please Enter your ICE";
const String kInvalidIceError = "Please Enter Valid Ice";
const String kPasswordNullError = "Please Enter your password";
const String kPhoneNumberNullError = "Please Enter your phone number";
//add validation of complete profile

final otpInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(
    vertical: getProportionateScreenWidth(15),
  ),
  enabledBorder: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  border: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(color: greyColor),
  );
}

const underlineInputBorder = UnderlineInputBorder(
  borderSide: BorderSide(
    color: bgColor,
  ),
);
