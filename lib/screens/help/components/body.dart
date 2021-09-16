import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/src/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../constants.dart';
import '../../../responsive.dart';
import 'package:trancentum_web_app/controllers/MenuController.dart';

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
    // /////remove these prints
    print(email);
    print(subject);
    print(message);
    _sendEmailToTrancentum(
      name: "TranCENTUM",
      email: email,
      subject: subject,
      message: message,
      clientEmail: 'testtestrzzl99@gmail.com',
    );
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _subjectFocusNode.dispose();
    _messageFocusNode.dispose();
    super.dispose();
  }

  Future _sendEmailToTrancentum({
    @required String name,
    @required String clientEmail,
    @required String subject,
    @required String message,
    @required String email,
  }) async {
    final serviceId = 'service_1s2nsjg';
    final templateId = 'template_u23678o';
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
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Something went wrong, please try again later",
            style: TextStyle(color: whiteColor, fontWeight: FontWeight.bold),
          ),
          backgroundColor: primaryColor,
        ),
      );
    }
    // Navigator.of(context).pushNamed(DashboardScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!Responsive.isDesktop(context))
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: context.read<MenuController>().controlMenu,
            ),
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
