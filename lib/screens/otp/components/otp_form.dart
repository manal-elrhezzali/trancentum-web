import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:trancentum_web_app/screens/mail_not_sent/mail_error_screen.dart';
import 'dart:convert';

// import 'package:mailer/mailer.dart';
// import 'package:mailer/smtp_server.dart';

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
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "OTP verified",
            style: TextStyle(color: whiteColor, fontWeight: FontWeight.bold),
          ),
          backgroundColor: primaryColor,
        ),
      );
      _sendPasswordToUser(
        email: 'testtestrzzl99@gmail.com',
        name: 'TranCENTUM',
        subject: 'You forgot your password?',
        message: 'QWERTYQEQWTRDWTDWYDTDQTYDTWDQTYD',
        clientEmail: email,
      );
    } else {
      print("Invalid OTP");
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Invalid OTP",
            style: TextStyle(color: whiteColor, fontWeight: FontWeight.bold),
          ),
          backgroundColor: primaryColor,
        ),
      );
    }
  }

  Future _sendPasswordToUser({
    @required String name,
    @required String clientEmail,
    @required String subject,
    @required String message,
    @required String email,
  }) async {
    final serviceId = 'service_1s2nsjg';
    final templateId = 'template_shok8of';
    final userId = 'user_PquyFgJDIMLBBbabATOOC';
    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    final response = await http.post(
      url,
      headers: {
        'origin': 'http://localhost',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'user_name': name,
          'user_email': email,
          'user_subject': subject,
          'user_message': message,
          'to_email': clientEmail,
        }
      }),
    );
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Email sent succesfully",
            style: TextStyle(color: whiteColor, fontWeight: FontWeight.bold),
          ),
          backgroundColor: primaryColor,
        ),
      );
    } else if (response.statusCode == 400) {
      Navigator.of(context).pushReplacementNamed(MailErrorScreen.routeName);
    }

    print(response.body);
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
