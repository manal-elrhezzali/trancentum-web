import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:trancentum_web_app/components/section_title.dart';
import 'package:trancentum_web_app/controllers/MenuController.dart';
import 'package:trancentum_web_app/screens/dashboard/dashboard_screen.dart';

import '../../../constants.dart';
import '../../../responsive.dart';

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
  FocusNode _submitButtonFocusNode = FocusNode();

  String adresse = "";
  String tel = "";
  String fixe = "";
  String fax = "";
  //review this
  var telPattern = r'ˆ(+212|0)([0-9]){9}$';

  var _initValues = {
    "adresse": "laurbbjkbfejbfkejkfbrekjk",
    "tel": "0676563549",
    "fixe": "0535615382",
    "fax": "0535615584",
  };
  bool editButtonClicked = false;

  @override
  void dispose() {
    _focusTelField.dispose();
    _focusFixeField.dispose();
    _focusFaxField.dispose();
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
    // print(adresse);
    // print(tel);
    // print(fixe);
    // print(fax);
    Navigator.of(context).pushNamed(DashboardScreen.routeName);
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Profile modifié",
        ),
        backgroundColor: kPrimaryColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (!Responsive.isDesktop(context))
                IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: context.read<MenuController>().controlMenu,
                ),
              IconButton(
                icon: Icon(
                  editButtonClicked ? Icons.save : Icons.edit,
                  color: redColor,
                ),
                onPressed: () {
                  setState(() {
                    if (editButtonClicked) {
                      _saveForm();
                    }
                    editButtonClicked = !editButtonClicked;
                  });
                },
              ),
            ],
          ),
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
                            "Profile",
                            [
                              TextFormField(
                                readOnly: editButtonClicked ? false : true,
                                initialValue: _initValues["adresse"],
                                onSaved: (newValue) => adresse = newValue,
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
                                readOnly: editButtonClicked ? false : true,
                                initialValue: _initValues["tel"],
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
                                readOnly: editButtonClicked ? false : true,
                                initialValue: _initValues["fixe"],
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
                                readOnly: editButtonClicked ? false : true,
                                initialValue: _initValues["fax"],
                                onSaved: (newValue) => fax = newValue,
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_submitButtonFocusNode);
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
