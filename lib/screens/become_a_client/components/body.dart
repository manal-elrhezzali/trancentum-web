import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:trancentum_web_app/components/section_title.dart';
import 'package:trancentum_web_app/models/client_request_model.dart';
import 'package:trancentum_web_app/models/http_exception.dart';
import 'package:trancentum_web_app/providers/client.dart';
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
  Map<String, String> _clientData = {
    'adresse': '',
    'cin_rc': '',
    'code': '',
    'faxe': '',
    'fixe': '',
    'ice': '',
    'nom_rs': '',
    'tel': '',
  };
  var _isLoading = false;

  FocusNode _focusTelField = FocusNode();
  FocusNode _focusFixeField = FocusNode();
  FocusNode _focusFaxField = FocusNode();
  FocusNode _focusCinRcField = FocusNode();
  FocusNode _focusCodeField = FocusNode();
  FocusNode _focusIceField = FocusNode();
  FocusNode _focusNomRsField = FocusNode();

  FocusNode _submitButtonFocusNode = FocusNode();

/////////added now
  // String cinRc = "";
  // String code = "";
  // String ice = "";
  // String nomRs = "";

  //were already here
  // String adresse = "";
  // String tel = "";
  // String fixe = "";
  // String fax = "";
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
    /////remove these prints
    print(_clientData['adresse']);
    print(_clientData['tel']);
    print(_clientData['fixe']);
    print(_clientData['faxe']);
    print(_clientData['cin_rc']);
    print(_clientData['nom_rs']);
    print(_clientData['code']);
    print(_clientData['ice']);

    //send HTTP request to create a client

    try {
      final userId =
          await await Provider.of<Client>(context, listen: false).utilisateurId;
      //do HTTP stuff here
      await Provider.of<Client>(context, listen: false)
          .createClient(ClientRequestModel(
        adresse: _clientData['adresse'],
        cinRc: _clientData['cin_rc'],
        code: _clientData['code'],
        faxe: _clientData['faxe'],
        fixe: _clientData['fixe'],
        ice: _clientData['ice'],
        nomRs: _clientData['nom_rs'],
        tel: _clientData['tel'],
        userId: userId,
      ));

      Navigator.of(context).pushReplacementNamed(DashboardScreen.routeName);
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "You became one of our awesome clients!",
            style: TextStyle(color: whiteColor, fontWeight: FontWeight.bold),
          ),
          backgroundColor: primaryColor,
        ),
      );
    } on HttpException catch (error) {
      _showErrorDialog(error.toString());
    } catch (error) {
      const errorMessage =
          "Could not register you as a CLIENT. Please try again later.";
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
                            "Client details",
                            [
                              TextFormField(
                                onSaved: (newValue) =>
                                    _clientData['adresse'] = newValue,
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
                                onSaved: (newValue) =>
                                    _clientData['tel'] = newValue,
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
                                onSaved: (newValue) =>
                                    _clientData['fixe'] = newValue,
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
                                onSaved: (newValue) =>
                                    _clientData['faxe'] = newValue,
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
                                onSaved: (newValue) =>
                                    _clientData["cin_rc"] = newValue,
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
                                onSaved: (newValue) =>
                                    _clientData['code'] = newValue,
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
                                onSaved: (newValue) =>
                                    _clientData['ice'] = newValue,
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
                                onSaved: (newValue) =>
                                    _clientData['nom_rs'] = newValue,
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
