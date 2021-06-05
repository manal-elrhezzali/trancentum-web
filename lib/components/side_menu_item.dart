import 'package:flutter/material.dart';

import '../constants.dart';

class SideMenuItem extends StatelessWidget {
  const SideMenuItem({
    Key key,
    @required this.showText,
    @required this.pressHandler,
    @required this.icon,
    @required this.text,
  }) : super(key: key);

  final bool showText;
  final Function pressHandler;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      IconButton(
        onPressed: pressHandler,
        icon: Icon(
          icon,
          color: showText ? whiteColor : Colors.grey.shade600,
        ),
      ),
      if (showText)
        Text(
          text,
          style: TextStyle(
            color: whiteColor,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
    ]);
  }
}
