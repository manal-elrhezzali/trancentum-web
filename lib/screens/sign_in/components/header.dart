import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants.dart';

class Header extends StatelessWidget {
  _openURL() async {
    if (await canLaunch("https://trancentum.com/")) {
      await launch("https://trancentum.com/");
    } else {
      print("could not launch");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          "assets/images/logo_trancentum_without_bg.png",
          width: 150,
          height: 150,
        ),
        SizedBox(width: 2 * defaultPadding),
        Text(
          "Se connecter à TranCENTUM",
          style: TextStyle(
            color: whiteColor,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(flex: 2),
        Text(
          "Vous n'avez pas de compte ?",
          style: TextStyle(
            color: whiteColor,
          ),
        ),
        SizedBox(width: 2 * defaultPadding),
        OutlinedButton(
          onPressed: _openURL,
          style: OutlinedButton.styleFrom(
            primary: whiteColor,
            padding: EdgeInsets.all(defaultPadding),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            side: BorderSide(
              color: redColor,
              width: 1,
            ),
          ),
          child: Text(
            "Contactez-nous",
          ),
        ),
      ],
    );
  }
}
