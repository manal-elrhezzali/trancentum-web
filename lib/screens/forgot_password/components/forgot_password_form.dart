import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:trancentum_web_app/components/no_account_button.dart';
import 'package:trancentum_web_app/screens/otp/otp_screen.dart';

import '../../../constants.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({Key key}) : super(key: key);

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  String email = "";
  var emailPattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  void _sendOTP() async {
    EmailAuth.sessionName = "Test Session";
    var response = await EmailAuth.sendOtp(receiverMail: email);
    if (response) {
      print("OTP SENT SUCCESSFULLY");
    } else {
      print("we could not send the OTP code");
    }
  }

  void _saveForm() {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState.save();
    /////remove these prints
    print(email);
    _sendOTP();
    Navigator.of(context).pushNamed(OtpScreen.routeName, arguments: email);
  }

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
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              onSaved: (newValue) => email = newValue,
              validator: (value) {
                if (value.isEmpty) {
                  return "Please provide an Email";
                }
                var result = new RegExp(emailPattern, caseSensitive: false)
                    .hasMatch(value);
                if (!result) {
                  return "Please provide a valid email";
                }
                return null; //means there is no error
              },
              style: TextStyle(color: whiteColor),
              decoration: InputDecoration(
                filled: true,
                fillColor: darkBgColor,
                border: underlineInputBorder,
                focusedBorder: underlineInputBorder,
                labelText: "Email",
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
                onPressed: _saveForm,
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
                if (_size.width > 392) NoAccountButton(),
              ],
            ),
            if (_size.width < 392) NoAccountButton(),
          ],
        ),
      ),
    );
  }
}
