import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trancentum_web_app/components/section_title.dart';
import 'package:trancentum_web_app/screens/dashboard/dashboard_screen.dart';
import 'package:trancentum_web_app/screens/sign_in/sign_in_screen.dart';

import '../../../constants.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();

  FocusNode _focusTelField = FocusNode();
  FocusNode _focusFixeField = FocusNode();
  FocusNode _focusFaxField = FocusNode();
  FocusNode _focusCinRcField = FocusNode();
  FocusNode _focusCodeField = FocusNode();
  FocusNode _focusIceField = FocusNode();
  FocusNode _focusNomRsField = FocusNode();

  FocusNode _submitButtonFocusNode = FocusNode();

/////////added now
  String cinRc = "";
  String code = "";
  String ice = "";
  String nomRs = "";

  //were already here
  String adresse = "";
  String tel = "";
  String fixe = "";
  String fax = "";
  //review this
  var telPattern = r'ˆ(+212|0)([0-9]){9}$';

  // var _initValues = {
  //   "adresse": "laurbbjkbfejbfkejkfbrekjk",
  //   "tel": "0676563549",
  //   "fixe": "0535615382",
  //   "fax": "0535615584",
  // };

  @override
  void dispose() {
    _focusTelField.dispose();
    _focusFixeField.dispose();
    _focusFaxField.dispose();
    _focusCinRcField.dispose();
    _focusCodeField.dispose();
    _focusIceField.dispose();
    _focusNomRsField.dispose();
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

  void _saveForm() {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState.save();
    /////remove these prints
    print(adresse);
    print(tel);
    print(fixe);
    print(fax);
    print(cinRc);
    print(nomRs);
    print(code);
    print(ice);

    //send HTTP request to create a client

    Navigator.of(context).pushNamed(DashboardScreen.routeName);
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "You became valuable client!",
          style: TextStyle(color: whiteColor, fontWeight: FontWeight.bold),
        ),
        backgroundColor: primaryColor,
      ),
    );
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
                            "Client details",
                            [
                              TextFormField(
                                onSaved: (newValue) => adresse = newValue,
                                keyboardType: TextInputType.streetAddress,
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_focusTelField);
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Veuillez saisir une adresse";
                                  }
                                  return null; //means there is no error
                                },
                                style: TextStyle(color: whiteColor),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: bgColor,
                                  border: underlineInputBorder,
                                  focusedBorder: underlineInputBorder,
                                  labelText: "Adresse",
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
                                focusNode: _focusTelField,
                                keyboardType: TextInputType.phone,
                                onSaved: (newValue) => tel = newValue,
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_focusFixeField);
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Veuillez saisir un Telephone";
                                  }
                                  return null; //means there is no error
                                },
                                style: TextStyle(color: whiteColor),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: bgColor,
                                  border: underlineInputBorder,
                                  focusedBorder: underlineInputBorder,
                                  labelText: "Telephone",
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
                                focusNode: _focusFixeField,
                                keyboardType: TextInputType.phone,
                                onSaved: (newValue) => fixe = newValue,
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_focusFaxField);
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Veuillez saisir un fixe";
                                  }
                                  return null; //means there is no error
                                },
                                style: TextStyle(color: whiteColor),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: bgColor,
                                  border: underlineInputBorder,
                                  focusedBorder: underlineInputBorder,
                                  labelText: "Fixe",
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
                                focusNode: _focusFaxField,
                                keyboardType: TextInputType.phone,
                                onSaved: (newValue) => fax = newValue,
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_focusCinRcField);
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Veuillez saisir un fax";
                                  }
                                  return null; //means there is no error
                                },
                                style: TextStyle(color: whiteColor),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: bgColor,
                                  border: underlineInputBorder,
                                  focusedBorder: underlineInputBorder,
                                  labelText: "Fax",
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
                                focusNode: _focusCinRcField,
                                onSaved: (newValue) => cinRc = newValue,
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_focusCodeField);
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Veuillez saisir un CIN";
                                  }
                                  return null; //means there is no error
                                },
                                style: TextStyle(color: whiteColor),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: bgColor,
                                  border: underlineInputBorder,
                                  focusedBorder: underlineInputBorder,
                                  labelText: "CIN",
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
                                focusNode: _focusCodeField,
                                onSaved: (newValue) => code = newValue,
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_focusIceField);
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Veuillez saisir un code";
                                  }
                                  return null; //means there is no error
                                },
                                style: TextStyle(color: whiteColor),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: bgColor,
                                  border: underlineInputBorder,
                                  focusedBorder: underlineInputBorder,
                                  labelText: "Code",
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
                                focusNode: _focusIceField,
                                onSaved: (newValue) => ice = newValue,
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_focusNomRsField);
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Veuillez saisir un ICE";
                                  }
                                  return null; //means there is no error
                                },
                                style: TextStyle(color: whiteColor),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: bgColor,
                                  border: underlineInputBorder,
                                  focusedBorder: underlineInputBorder,
                                  labelText: "ICE",
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
                                focusNode: _focusNomRsField,
                                onSaved: (newValue) => nomRs = newValue,
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_submitButtonFocusNode);
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Veuillez saisir un nom";
                                  }
                                  return null; //means there is no error
                                },
                                style: TextStyle(color: whiteColor),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: bgColor,
                                  border: underlineInputBorder,
                                  focusedBorder: underlineInputBorder,
                                  labelText: "Nom",
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
                              //submit button
                              SizedBox(height: defaultPadding * 2),
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
                              SizedBox(height: defaultPadding),
                              Container(
                                padding: EdgeInsets.all(defaultPadding / 2),
                                width: double.infinity,
                                color: redColor,
                                child: FlatButton(
                                  onPressed: () => Navigator.of(context)
                                      .pushReplacementNamed(
                                          SignInScreen.routeName),
                                  child: Text(
                                    "Go to sign In",
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
