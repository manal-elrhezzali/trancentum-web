import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trancentum_web_app/constants.dart';

class WaitingScreen extends StatelessWidget {
  final String text;
   const WaitingScreen({
    Key key,
    @required this.text,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBgColor,
      body: Center(
        child: Text(
          'Loading...',
          style: TextStyle(color: redColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
