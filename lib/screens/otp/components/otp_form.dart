import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trancentum_web_app/models/http_exception.dart';
import 'package:trancentum_web_app/services/auth.dart';

import '../../../constants.dart';
import 'package:trancentum_web_app/screens/mail_error/mail_error_screen.dart';

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
      //send reset link to user
      _resetPassword(
        email: email,
      );
    } else {
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

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("An error occurred!"),
        content: Text(message),
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Text("Okay"),
          ),
        ],
      ),
    );
  }

  Future<void> _resetPassword({
    @required String email,
  }) async {
    try {
      await Provider.of<Auth>(context, listen: false).sendResetPasswordEmail(email);
    } on HttpException catch (error) {
      var errorMessage = 'Reset Password failed';
      if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'Could not find a user with that email.';
      }
      _showErrorDialog(errorMessage);
    } catch (error) {
      // print("IN CATCH" + error.toString());
      // const errorMessage = "Could not reset your password. Please try again later.";
      // _showErrorDialog(errorMessage);
      Navigator.of(context).pushReplacementNamed(MailErrorScreen.routeName);
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
          ],
        ),
      ),
    );
  }
}
