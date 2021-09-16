import 'package:flutter/material.dart';
import 'package:trancentum_web_app/screens/forbidden_error_403_401/forbidden_error_screen.dart';
import 'package:trancentum_web_app/screens/mail_error/mail_error_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';

class NoAccountButton extends StatelessWidget {
  const NoAccountButton({
    Key key,
  }) : super(key: key);

  _openURL() async {
    if (await canLaunch("https://trancentum.com/")) {
      await launch("https://trancentum.com/");
    } else {
      print("could not launch");
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      mouseCursor: SystemMouseCursors.click,
      // onTap: _openURL,
      onTap: () {
        Navigator.of(context).pushNamed(ForbiddenErrorScreen.routeName);
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
