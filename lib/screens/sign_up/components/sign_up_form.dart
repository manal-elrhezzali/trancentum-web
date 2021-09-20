import 'package:flutter/material.dart';
import 'package:trancentum_web_app/screens/sign_in/sign_in_screen.dart';

import '../../../constants.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  var _isLoading = false;
  final _passwordController = TextEditingController();

  final _passwordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  void _saveForm() {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });

    //do HTTP stuff

    setState(() {
      _isLoading = false;
    });

    ///remove these prints
    print(_authData["email"]);
    print(_authData["password"]);
    Navigator.of(context).pushNamed(SignInScreen.routeName);
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Signed Up",
          style: TextStyle(color: whiteColor, fontWeight: FontWeight.bold),
        ),
        backgroundColor: primaryColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var underlineInputBorder = UnderlineInputBorder(
      borderSide: BorderSide(
        color: bgColor,
      ),
    );
    return Center(
      child: Container(
        // padding: EdgeInset,
        width: 500,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                onSaved: (newValue) => _authData["email"] = newValue,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(_passwordFocusNode);
                },
                textInputAction: TextInputAction.next,
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
              SizedBox(height: defaultPadding),
              TextFormField(
                focusNode: _passwordFocusNode,
                controller: _passwordController,
                onSaved: (newValue) => _authData["password"] = newValue,
                onFieldSubmitted: (value) {
                  FocusScope.of(context)
                      .requestFocus(_confirmPasswordFocusNode);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please provide a password";
                  }
                  return null;
                },
                style: TextStyle(color: whiteColor),
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: darkBgColor,
                  border: underlineInputBorder,
                  focusedBorder: underlineInputBorder,
                  labelText: "Mot de passe",
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
                focusNode: _confirmPasswordFocusNode,
                onSaved: (newValue) => _authData["password"] = newValue,
                validator: (value) {
                  if (value != _passwordController.text) {
                    return "Passwords do not match";
                  }
                  return null;
                },
                style: TextStyle(color: whiteColor),
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: darkBgColor,
                  border: underlineInputBorder,
                  focusedBorder: underlineInputBorder,
                  labelText: "confirmer le mot de passe",
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  labelStyle: TextStyle(color: whiteColor),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 44,
                    vertical: 20,
                  ),
                ),
              ),
              SizedBox(height: 2 * defaultPadding),
              if (_isLoading)
                CircularProgressIndicator()
              else
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: FlatButton(
                    onPressed: _saveForm,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: redColor,
                    child: Text(
                      "Register",
                      style: TextStyle(
                        fontSize: 16,
                        color: whiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
