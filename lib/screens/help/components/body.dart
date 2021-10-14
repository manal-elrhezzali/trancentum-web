import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:trancentum_web_app/screens/dashboard/dashboard_screen.dart';

import '../../../constants.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();
  final _emailFocusNode = FocusNode();
  final _subjectFocusNode = FocusNode();
  final _messageFocusNode = FocusNode();

  String email = "";
  String subject = "";
  String message = "";

  void _saveForm() {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState.save();
    send();
  }

  Future<void> send() async {
    final Email email = Email(
      body: message,
      subject: subject,
      recipients: ['testtestrzzl99@gmail.com'],//change this to Trancentum's email
    );
    String platformResponse;
    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'We will review your email and reply ASAP';
    } catch (error) {
      platformResponse = "Oops,Something went wrong! Please try again later.";
      print(platformResponse);
    }
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
         content: Text(
            platformResponse,
            style: TextStyle(color: whiteColor, fontWeight: FontWeight.bold),
          ),
          backgroundColor: primaryColor,
      ),
    );
    Navigator.of(context).pushNamed(DashboardScreen.routeName);
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _subjectFocusNode.dispose();
    _messageFocusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding * 2),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextFormField(
                      onSaved: (newValue) => email = newValue,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_subjectFocusNode);
                      },
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Veuillez saisir un email";
                        }
                        var result =
                            new RegExp(emailPattern, caseSensitive: false)
                                .hasMatch(value);
                        if (!result) {
                          return "Email invalid";
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
                    SizedBox(height: defaultPadding),
                    TextFormField(
                      focusNode: _subjectFocusNode,
                      onSaved: (newValue) => subject = newValue,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_messageFocusNode);
                      },
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Veuillez saisir un sujet";
                        }
                        return null; //means there is no error
                      },
                      style: TextStyle(color: whiteColor),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: bgColor,
                        border: underlineInputBorder,
                        focusedBorder: underlineInputBorder,
                        labelText: "Sujet",
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        labelStyle: TextStyle(color: whiteColor),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 44,
                          vertical: 20,
                        ),
                      ),
                    ),
                    SizedBox(height: defaultPadding),
                    TextFormField(
                      focusNode: _messageFocusNode,
                      onSaved: (newValue) => message = newValue,
                      keyboardType: TextInputType.multiline,
                      maxLines: 3,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Veuillez saisir un message";
                        }
                        return null; //means there is no error
                      },
                      style: TextStyle(color: whiteColor),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: bgColor,
                        border: underlineInputBorder,
                        focusedBorder: underlineInputBorder,
                        labelText: "Message",
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        labelStyle: TextStyle(color: whiteColor),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 44,
                          vertical: 20,
                        ),
                      ),
                    ),
                    SizedBox(height: defaultPadding * 2),
                    Container(
                      padding: EdgeInsets.all(defaultPadding / 2),
                      width: double.infinity,
                      color: bgColor,
                      child: FlatButton(
                        onPressed: _saveForm,
                        child: Text(
                          "Envoyer",
                          style: TextStyle(
                            color: whiteColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
