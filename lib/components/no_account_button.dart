import 'package:flutter/material.dart';

import '../constants.dart';

class NoAccountButton extends StatelessWidget {
  const NoAccountButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      mouseCursor: SystemMouseCursors.click,
      onTap: () {
        ///////////////////////
        ///////////////////////
        ///redirect to trancentum's contact page
        
      },
      child: Text(
        "Contactez-nous",
        style: TextStyle(
          decoration: TextDecoration.underline,
          color: redColor,
          fontSize: 18,
        ),
      ),
    );
  }
}