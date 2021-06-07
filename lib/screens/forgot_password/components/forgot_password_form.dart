import 'package:flutter/material.dart';
import 'package:trancentum_web_app/components/no_account_button.dart';
import 'package:trancentum_web_app/screens/otp/otp_screen.dart';

import '../../../constants.dart';

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    var underlineInputBorder = UnderlineInputBorder(
      borderSide: BorderSide(
        color: bgColor,
      ),
    );
    return Container(
      width: 500,
      child: Column(
        children: [
          TextFormField(
            style: TextStyle(color: whiteColor),
            decoration: InputDecoration(
              filled: true,
              fillColor: darkBgColor,
              border: underlineInputBorder,
              focusedBorder: underlineInputBorder,
              labelText: "TELEPHONE",
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              labelStyle: TextStyle(color: whiteColor),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 44,
                vertical: 20,
              ),
            ),
          ),
          SizedBox(height: 2 * defaultPadding),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: FlatButton(
              onPressed: () {
                Navigator.of(context).pushNamed(OtpScreen.routeName);
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: redColor,
              child: Text(
                "Continuer",
                style: TextStyle(
                  fontSize: 20,
                  color: whiteColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 2 * defaultPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Vous n'avez pas de compte?",
                style: TextStyle(
                  color: whiteColor,
                  fontSize: 18,
                ),
              ),
              SizedBox(width: 10),
              if (_size.width > 392)
                NoAccountButton(),
            ],
          ),
          if (_size.width < 392)
            NoAccountButton(),
        ],
      ),
    );
  }
}


