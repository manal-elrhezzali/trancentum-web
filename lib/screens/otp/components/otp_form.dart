import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

import '../../../constants.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({Key key}) : super(key: key);

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  String otpCode = "";
  final _formKey = GlobalKey<FormState>();

  void _verifyOTP(String email, String userOTP) async {
    var result = EmailAuth.validate(receiverMail: email, userOTP: userOTP);
    if (result) {
      print("OTP Verified");
      // ScaffoldMessenger.of(context).hideCurrentSnackBar();
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text(
      //       "OTP Verified",
      //     ),
      //   ),
      // );
      _sendPasswordToUser(email);
    } else {
      print("Invalid OTP");
      // ScaffoldMessenger.of(context).hideCurrentSnackBar();
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text(
      //       "Invalid OTP",
      //     ),
      //   ),
      // );
    }
  }

  void _sendPasswordToUser(String email) async {
    String username = 'testtestrzzl99@gmail.com';
    String password = 'poiuytrewq97531@';

    final smtpServer = gmail(username, password);

    // Create our message.
    final message = Message()
      ..from = Address(username)
      ..recipients.add(email)
      ..subject = 'Your TranCENTUM account Password :: 😀 :: ${DateTime.now()}'
      ..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ..html =
          "<h1>Your Password</h1>\n<p>Here add the password test test test</p>";

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
      // ScaffoldMessenger.of(context).hideCurrentSnackBar();
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text(
      //       "Message sent",
      //     ),
      //   ),
      // );
    } on MailerException catch (e) {
      print('Message not sent.');
      // Navigator.of(context).pushReplacementNamed(ErrorScreen.routeName);

      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }

  void _saveForm(String email, String userOTP) {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState.save();
    _verifyOTP(email, userOTP);
  }

  @override
  Widget build(BuildContext context) {
    String email = ModalRoute.of(context).settings.arguments as String;

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
              keyboardType: TextInputType.number,
              onSaved: (newValue) => otpCode = newValue,
              validator: (value) {
                if (value.isEmpty) {
                  return "Please provide an OTP code";
                }
                return null; //means there is no error
              },
              style: TextStyle(color: whiteColor),
              decoration: InputDecoration(
                filled: true,
                fillColor: darkBgColor,
                border: underlineInputBorder,
                focusedBorder: underlineInputBorder,
                labelText: "OTP code",
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
                  _saveForm(email, otpCode);
                  print(email);
                  print(otpCode);
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
          ],
        ),
      ),
    );
  }
}
