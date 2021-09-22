import 'package:flutter/material.dart';
import 'package:trancentum_web_app/screens/sign_in/sign_in_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../constants.dart';

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
          "Sign up à TranCENTUM",
          style: TextStyle(
            color: whiteColor,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(flex: 2),
        InkWell(
          onTap: () => Navigator.of(context).pushNamed(SignInScreen.routeName),
          child: Text(
            "Vous avez dèjà un compte ?",
            style: TextStyle(
              color: redColor,
            ),
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
