import 'package:flutter/material.dart';

import '../constants.dart';

class DefaultTextField extends StatelessWidget {
  const DefaultTextField({
    Key key,
    @required this.labelText,
  }) : super(key: key);
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: whiteColor),
      decoration: InputDecoration(
        filled: true,
        fillColor: bgColor,
        border: underlineInputBorder,
        focusedBorder: underlineInputBorder,
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        labelStyle: TextStyle(color: whiteColor),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 44,
          vertical: 20,
        ),
      ),
    );
  }
}