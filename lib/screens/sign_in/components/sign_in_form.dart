import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trancentum_web_app/models/http_exception.dart';
import 'package:trancentum_web_app/providers/auth.dart';
import 'package:trancentum_web_app/screens/dashboard/dashboard_screen.dart';
import 'package:trancentum_web_app/screens/forgot_password/forgot_pasword_screen.dart';

import '../../../constants.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  var _isLoading = false;
  bool rememberMeIsChecked = false;
  bool visibility = false;

  final _formKey = GlobalKey<FormState>();

  final _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
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

    ///remove these prints
    print(_authData["email"]);
    print(_authData["password"]);
    try {
      await Provider.of<Auth>(context, listen: false).login(
        _authData["email"],
        _authData["password"]
      );
      // Navigator.of(context).pushReplacementNamed(DashboardScreen.routeName);
      // ScaffoldMessenger.of(context).hideCurrentSnackBar();
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text(
      //       "Logged In",
      //       style: TextStyle(color: whiteColor, fontWeight: FontWeight.bold),
      //     ),
      //     backgroundColor: primaryColor,
      //   ),
      // );
    } on HttpException catch (error) {
      _showErrorDialog(error.toString());
    } 
    catch (error) {
      const errorMessage = "Could not authenticate you! Please try again later.";
      _showErrorDialog(errorMessage);
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

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
                onSaved: (newValue) => _authData["password"] = newValue,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please provide a password";
                  }
                  return null;
                },
                style: TextStyle(color: whiteColor),
                obscureText: visibility == false ? true : false,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: darkBgColor,
                  border: underlineInputBorder,
                  focusedBorder: underlineInputBorder,
                  labelText: "Mot de passe",
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  labelStyle: TextStyle(color: whiteColor),
                  suffixIcon: IconButton(
                    icon: visibility == false
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                    onPressed: () {
                      setState(() {
                        visibility = !visibility;
                      });
                    },
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 44,
                    vertical: 20,
                  ),
                ),
              ),
              SizedBox(height: 2 * defaultPadding),
              Row(
                children: [
                  Checkbox(
                    shape: CircleBorder(),
                    value: rememberMeIsChecked,
                    activeColor: redColor,
                    onChanged: (value) {
                      setState(() {
                        rememberMeIsChecked = value;
                      });
                    },
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Mémoriser",
                    style: TextStyle(
                      color: whiteColor,
                      fontSize: 16,
                    ),
                  ),
                  Spacer(),
                  if (_size.width >= 350)
                    InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(ForgotPasswordScreen.routeName);
                      },
                      child: Text(
                        "Mot de passe oublié ?",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: redColor,
                        ),
                      ),
                    ),
                ],
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
                      "Se connecter",
                      style: TextStyle(
                        fontSize: 16,
                        color: whiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              if (_size.width < 350) SizedBox(height: defaultPadding),
              if (_size.width < 350)
                InkWell(
                  onTap: _saveForm,
                  child: Text(
                    "Mot de passe oublié ?",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: redColor,
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
