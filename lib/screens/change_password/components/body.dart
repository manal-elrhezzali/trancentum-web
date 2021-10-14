import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trancentum_web_app/global_widgets/section_title.dart';
import 'package:trancentum_web_app/models/http_exception.dart';
import 'package:trancentum_web_app/services/auth.dart';
import 'package:trancentum_web_app/screens/sign_in/sign_in_screen.dart';

import '../../../constants.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();
  String password = "";
  var _isLoading = false;

  FocusNode _submitButtonFocusNode = FocusNode();
  final _passwordController = TextEditingController();

  final _passwordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    _submitButtonFocusNode.dispose();
    super.dispose();
  }

  Widget buildSubForm(String title, List<Widget> widgets) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: title),
        SizedBox(height: defaultPadding),
        ...widgets,
      ],
    );
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

  Future<void> _saveForm() async {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    try {
      await Provider.of<Auth>(context, listen: false).changePassword(password);
      Provider.of<Auth>(context, listen: false).logout();
      Navigator.of(context).pushReplacementNamed('/');
    } on HttpException catch (error) {
      var errorMessage = 'Modification failed';
      if (error.toString().contains('INVALID_ID_TOKEN')) {
        errorMessage = 'Forbidden. Your token is invalid';
      } else if (error.toString().contains('WEAK_PASSWORD')) {
        errorMessage = 'The password is too weak! Please use a valid password.';
      }
      _showErrorDialog(errorMessage);
    } catch (error) {
      print("IN CATCH" + error.toString());
      const errorMessage =
          "Could not update your password. Please try again later.";
      _showErrorDialog(errorMessage);
    }
    setState(() {
      _isLoading = false;
    });
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
                    Column(
                      children: [
                        Container(
                          width: double.infinity,
                          color: darkBgColor,
                          child: buildSubForm(
                            "Change your Password",
                            [
                              TextFormField(
                                focusNode: _passwordFocusNode,
                                controller: _passwordController,
                                onSaved: (newValue) => password = newValue,
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_confirmPasswordFocusNode);
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Please provide a password";
                                  }
                                  if (value.length < 6) {
                                    return "Please enter at least 6 characters";
                                  }
                                  return null;
                                },
                                style: TextStyle(color: whiteColor),
                                obscureText: true,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: bgColor,
                                  border: underlineInputBorder,
                                  focusedBorder: underlineInputBorder,
                                  labelText: "Nouveau mot de passe",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.auto,
                                  labelStyle: TextStyle(color: whiteColor),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 44,
                                    vertical: 20,
                                  ),
                                ),
                              ),
                              SizedBox(height: defaultPadding),
                              TextFormField(
                                focusNode: _confirmPasswordFocusNode,
                                onSaved: (newValue) => password = newValue,
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_submitButtonFocusNode);
                                },
                                validator: (value) {
                                  if (value != _passwordController.text) {
                                    return "Passwords do not match";
                                  }
                                  return null;
                                },
                                obscureText: true,
                                style: TextStyle(color: whiteColor),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: bgColor,
                                  border: underlineInputBorder,
                                  focusedBorder: underlineInputBorder,
                                  labelText: "confirmer le mot de passe",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.auto,
                                  labelStyle: TextStyle(color: whiteColor),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 44,
                                    vertical: 20,
                                  ),
                                ),
                              ),
                              //submit button
                              SizedBox(height: defaultPadding * 2),
                              if (_isLoading)
                                CircularProgressIndicator()
                              else
                                Container(
                                  padding: EdgeInsets.all(defaultPadding / 2),
                                  width: double.infinity,
                                  color: bgColor,
                                  child: FlatButton(
                                    focusNode: _submitButtonFocusNode,
                                    onPressed: _saveForm,
                                    child: Text(
                                      "CONTINUER",
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
                      ],
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
