import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:trancentum_web_app/global_widgets/section_title.dart';
import 'package:trancentum_web_app/models/expedition.dart';
import 'package:trancentum_web_app/services/expeditions.dart';
import 'package:trancentum_web_app/screens/dashboard/dashboard_screen.dart';

import '../../../constants.dart';
import '../../../responsive.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final _telExpediteurFocusNode = FocusNode();
  final _villeExpediteurFocusNode = FocusNode();
  final _nomDestinataireFocusNode = FocusNode();
  final _telDestinataireFocusNode = FocusNode();
  final _villeDestinataireFocusNode = FocusNode();
  final _nbrDeBonsFocusNode = FocusNode();
  final _nbrFacturesFocusNode = FocusNode();
  final _montantRetoursDeFondsFocusNode = FocusNode();
  final _nbrRetoursDeFondsFocusNode = FocusNode();
  final _typeDeRetoursFocusNode = FocusNode();
  final _nbrColisFocusNode = FocusNode();
  final _typeDeMarchandiseFocusNode = FocusNode();
  final _modePaiementFocusNode = FocusNode();
  final _typeTaxationFocusNode = FocusNode();
  final _submitButtonFocusNode = FocusNode();

  // List<Ville> villes = [];

  List villes = <Map>[];
  List listItemsRetoursFondsDropDownButton = [];
  List listItemsTypeMarchandiseDropDownButton = [];
  List listItemsModePaiementDropDownButton = [];
  List listItemsTypeTaxationDropDownButton = [];

  // var telPattern = r'ˆ[0][0-9]{9}$'; //review this
  // var fixePattern = r'ˆ[0][0-9]{9}$'; //review this
  // var faxPattern = r'ˆ[0][0-9]{9}$'; //review this

  Expedition expedition = Expedition(
    etat: "Brouillon",
    ptaxe1: 0.0,
    ptaxe2: 0.0,
    ptaxe3: 0.0,
    dcreation: DateTime.now(),
    codeGenere: "",
    codeExpedition: null,
    modePaiement: "",
    taxation: "Forfait",
    nbrColis: 0,
    nbrFactures: 0,
    pht: 0,
    premise: 0.0,
    ptaxe4: 0.0,
    pttc: 0.0,
    ptva: 0.0,
    ttlPoids: 0.0,
    ttlValDeclaree: 0.0,
    typeLivraison: "",
    codeABarre: "",
    nomDestinataire: "",
    telDestinataire: "",
    nomExpediteur: "",
    telExpediteur: "",
    villeDestinataireId: "",
    villeExpediteurId: "",
    //reglement
    typeTaxation: "",
    typeMarchandise: "",
    nombre: "0",
    //retourFonds
    type: "",
    montant: 0,
    nombreBonsLivraison: 0,
  );

  // Reglement reglement = Reglement(

  //   typeTaxation: "",
  //   codeExpedition: "",
  //   nombre: "",
  //   modePaiement: "",
  //   typeMarchandise: "",
  // );

//   //----->dropDown
// // String _initialValueVilleExpediteur = "Fes";
  var _initialValueVilleExpediteur;
  var _initialValueVilleDestinataire;

  // //----->dropDown
  var _initialValueTypeMarchandise;
  var _initialValueTyperRetours;
  var _initialValueModePaiement;
  var _initialValueTypeTaxation = "Forfait";

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
      await Provider.of<Expeditions>(context, listen: false)
          .addExpedition(expedition);
    } catch (error) {
      //to wait for the user to click okay and pop the dialog
      //before running the code in finally
      await showDialog<Null>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("An error has occured"),
          content: Text("Something went wrong."),
          actions: [
            FlatButton(
              child: Text("Okay"),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            ),
          ],
        ),
      );
    }
    //will run only one of the await"s"is done
    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pushNamed(
      DashboardScreen.routeName,
    );
  }

  @override
  void dispose() {
    _telExpediteurFocusNode.dispose();
    _villeExpediteurFocusNode.dispose();
    _nomDestinataireFocusNode.dispose();
    _telDestinataireFocusNode.dispose();
    _villeDestinataireFocusNode.dispose();
    _nbrDeBonsFocusNode.dispose();
    _nbrFacturesFocusNode.dispose();
    _montantRetoursDeFondsFocusNode.dispose();
    _nbrRetoursDeFondsFocusNode.dispose();
    _typeDeRetoursFocusNode.dispose();
    _nbrColisFocusNode.dispose();
    _typeDeMarchandiseFocusNode.dispose();
    _modePaiementFocusNode.dispose();
    _typeTaxationFocusNode.dispose();
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

  @override
  void initState() {
    super.initState();
    //get villes json Map from Back-End
    villes = [
      {
        'id': 'c1',
        'nom': 'Fes',
      },
      {
        'id': 'c2',
        'nom': 'Meknes',
      },
      {
        'id': 'c3',
        'nom': 'Tanjer',
      },
    ];
    listItemsRetoursFondsDropDownButton = [
      "C/Remboursement",
      "C/Cheque",
      "C/Traite",
      "C/BL",
    ];
    listItemsTypeMarchandiseDropDownButton = [
      "Marchandise 1",
      "Marchandise 2",
    ];
    listItemsModePaiementDropDownButton = [
      "PP",
      "PPE",
      "PD",
      "PDE",
    ];
    listItemsTypeTaxationDropDownButton = [
      "Forfait",
      "Taxation",
      "Service",
    ];
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // =========================expediteur form=========================
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                color: darkBgColor,
                                child: buildSubForm(
                                  "Expediteur",
                                  [
                                    TextFormField(
                                      onSaved: (newValue) =>
                                          expedition.nomExpediteur = newValue,
                                      textInputAction: TextInputAction.next,
                                      onFieldSubmitted: (_) {
                                        FocusScope.of(context).requestFocus(
                                            _telExpediteurFocusNode);
                                      },
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "Veuillez saisir le nom de l\'expediteur";
                                        }
                                        return null; //means there is no error
                                      },
                                      style: TextStyle(color: whiteColor),
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: bgColor,
                                        border: underlineInputBorder,
                                        focusedBorder: underlineInputBorder,
                                        labelText: "Nom Expediteur",
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.auto,
                                        labelStyle:
                                            TextStyle(color: whiteColor),
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 44,
                                          vertical: 20,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: defaultPadding),
                                    TextFormField(
                                      focusNode: _telExpediteurFocusNode,
                                      onSaved: (newValue) =>
                                          expedition.telExpediteur = newValue,
                                      onFieldSubmitted: (_) {
                                        FocusScope.of(context).requestFocus(
                                            _villeExpediteurFocusNode);
                                      },
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.phone,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "Veuillez saisir un tel";
                                        }
                                        // var result =
                                        //     new RegExp(telPattern, caseSensitive: false)
                                        //         .hasMatch(value);
                                        // if (!result) {
                                        //   return "Veuillez saisir un tel valid";
                                        // }
                                        return null; //means there is no error
                                      },
                                      style: TextStyle(color: whiteColor),
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: bgColor,
                                        border: underlineInputBorder,
                                        focusedBorder: underlineInputBorder,
                                        labelText: "Telephone Expediteur",
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.auto,
                                        labelStyle:
                                            TextStyle(color: whiteColor),
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 44,
                                          vertical: 20,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: defaultPadding),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 44,
                                        vertical: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        color: bgColor,
                                        border: Border(
                                          bottom: BorderSide(
                                            width: 1.0,
                                            color: bgColor,
                                          ),
                                        ),
                                      ),
                                      child: DropdownButtonFormField(
                                        onChanged: (newValue) {
                                          setState(() {
                                            expedition.villeExpediteurId =
                                                newValue;
                                          });
                                          FocusScope.of(context).requestFocus(
                                              _nbrDeBonsFocusNode);
                                        },
                                        focusNode: _villeExpediteurFocusNode,
                                        value: _initialValueVilleExpediteur,
                                        hint: Text(
                                          'Ville Expediteur',
                                          style: TextStyle(color: whiteColor),
                                        ),
                                        dropdownColor: darkBgColor,
                                        isExpanded: true,
                                        // underline: SizedBox(),
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: kSecondaryColor,
                                        ),
                                        validator: (value) => value == null
                                            ? 'field required'
                                            : null,
                                        items: villes.map((ville) {
                                          return DropdownMenuItem<String>(
                                            value: ville["id"],
                                            child: Text(
                                              ville["nom"],
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: defaultPadding),

                        //=========================form destinataire=========================
                        if (Responsive.isDesktop(context))
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  // height: 500,
                                  color: darkBgColor,
                                  child: buildSubForm(
                                    "Destinataire",
                                    [
                                      TextFormField(
                                        focusNode: _nomDestinataireFocusNode,
                                        onSaved: (newValue) => expedition
                                            .nomDestinataire = newValue,
                                        textInputAction: TextInputAction.next,
                                        onFieldSubmitted: (_) {
                                          FocusScope.of(context).requestFocus(
                                              _telDestinataireFocusNode);
                                        },
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return "Veuillez saisir le nom du destinataire";
                                          }
                                          return null; //means there is no error
                                        },
                                        style: TextStyle(color: whiteColor),
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: bgColor,
                                          border: underlineInputBorder,
                                          focusedBorder: underlineInputBorder,
                                          labelText: "Nom Destinataire",
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.auto,
                                          labelStyle:
                                              TextStyle(color: whiteColor),
                                          contentPadding: EdgeInsets.symmetric(
                                            horizontal: 44,
                                            vertical: 20,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: defaultPadding),
                                      TextFormField(
                                        focusNode: _telDestinataireFocusNode,
                                        onSaved: (newValue) => expedition
                                            .telDestinataire = newValue,
                                        textInputAction: TextInputAction.next,
                                        keyboardType: TextInputType.phone,
                                        onFieldSubmitted: (_) {
                                          FocusScope.of(context).requestFocus(
                                              _villeDestinataireFocusNode);
                                        },
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return "Veuillez saisir un tel";
                                          }
                                          // var result =
                                          //     new RegExp(telPattern, caseSensitive: false)
                                          //         .hasMatch(value);
                                          // if (!result) {
                                          //   return "Veuillez saisir un tel valid";
                                          // }
                                          return null; //means there is no error
                                        },
                                        style: TextStyle(color: whiteColor),
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: bgColor,
                                          border: underlineInputBorder,
                                          focusedBorder: underlineInputBorder,
                                          labelText: "Telephone Destinataire",
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.auto,
                                          labelStyle:
                                              TextStyle(color: whiteColor),
                                          contentPadding: EdgeInsets.symmetric(
                                            horizontal: 44,
                                            vertical: 20,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: defaultPadding),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 44,
                                          vertical: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          color: bgColor,
                                          border: Border(
                                            bottom: BorderSide(
                                              width: 1.0,
                                              color: bgColor,
                                            ),
                                          ),
                                        ),
                                        child: DropdownButtonFormField(
                                          focusNode:
                                              _villeDestinataireFocusNode,
                                          value: _initialValueVilleDestinataire,
                                          hint: Text(
                                            "Ville Destinataire",
                                            style: TextStyle(color: whiteColor),
                                          ),
                                          dropdownColor: darkBgColor,
                                          isExpanded: true,
                                          // underline: SizedBox(),
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: kSecondaryColor,
                                          ),
                                          onChanged: (newValue) {
                                            setState(() {
                                              expedition.villeDestinataireId =
                                                  newValue;
                                            });
                                            FocusScope.of(context).requestFocus(
                                                _nbrColisFocusNode);
                                          },

                                          validator: (value) => value == null
                                              ? 'field required'
                                              : null,
                                          items: villes.map((ville) {
                                            return DropdownMenuItem<String>(
                                              value: ville["id"],
                                              child: Text(
                                                ville["nom"],
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                    SizedBox(
                      height: defaultPadding,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //=========================retours de fonds form=========================
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                color: darkBgColor,
                                child: buildSubForm(
                                  "Retours de fonds",
                                  [
                                    TextFormField(
                                      focusNode: _nbrDeBonsFocusNode,
                                      onSaved: (newValue) =>
                                          expedition.nombreBonsLivraison =
                                              int.parse(newValue),
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.number,
                                      onFieldSubmitted: (_) {
                                        FocusScope.of(context).requestFocus(
                                            _nbrFacturesFocusNode);
                                      },
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "Veuillez saisir le nombre de Bons Livraison";
                                        }
                                        return null;
                                      },
                                      style: TextStyle(color: whiteColor),
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: bgColor,
                                        border: underlineInputBorder,
                                        focusedBorder: underlineInputBorder,
                                        labelText: "Nombre Bons livraison",
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.auto,
                                        labelStyle:
                                            TextStyle(color: whiteColor),
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 44,
                                          vertical: 20,
                                        ),
                                      ),
                                    ),
                                    // DefaultTextField(
                                    //   labelText: "Nombre Bons livraison",
                                    // ),
                                    SizedBox(height: defaultPadding),
                                    TextFormField(
                                      focusNode: _nbrFacturesFocusNode,
                                      onSaved: (newValue) => expedition
                                          .nbrFactures = double.parse(newValue),
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.number,
                                      onFieldSubmitted: (value) {
                                        FocusScope.of(context).requestFocus(
                                            _montantRetoursDeFondsFocusNode);
                                      },
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "Veuillez saisir le nbr de factures";
                                        }
                                        return null;
                                      },
                                      style: TextStyle(color: whiteColor),
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: bgColor,
                                        border: underlineInputBorder,
                                        focusedBorder: underlineInputBorder,
                                        labelText: "Nombre Factures",
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.auto,
                                        labelStyle:
                                            TextStyle(color: whiteColor),
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 44,
                                          vertical: 20,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: defaultPadding),
                                    TextFormField(
                                      focusNode:
                                          _montantRetoursDeFondsFocusNode,
                                      onSaved: (newValue) => expedition
                                          .montant = double.parse(newValue),
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.number,
                                      onFieldSubmitted: (_) {
                                        FocusScope.of(context).requestFocus(
                                            _nbrRetoursDeFondsFocusNode);
                                      },
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "Veuillez saisir le montant";
                                        }
                                        return null;
                                      },
                                      style: TextStyle(color: whiteColor),
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: bgColor,
                                        border: underlineInputBorder,
                                        focusedBorder: underlineInputBorder,
                                        labelText: "Montant",
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.auto,
                                        labelStyle:
                                            TextStyle(color: whiteColor),
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 44,
                                          vertical: 20,
                                        ),
                                      ),
                                    ),

                                    SizedBox(height: defaultPadding),
                                    TextFormField(
                                      focusNode: _nbrRetoursDeFondsFocusNode,
                                      onSaved: (newValue) =>
                                          expedition.nombre = newValue,
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.number,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "Veuillez saisir le nombre";
                                        }
                                        return null;
                                      },
                                      onFieldSubmitted: (_) {
                                        FocusScope.of(context).requestFocus(
                                            _typeDeRetoursFocusNode);
                                      },
                                      style: TextStyle(color: whiteColor),
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: bgColor,
                                        border: underlineInputBorder,
                                        focusedBorder: underlineInputBorder,
                                        labelText: "Nombre",
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.auto,
                                        labelStyle:
                                            TextStyle(color: whiteColor),
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 44,
                                          vertical: 20,
                                        ),
                                      ),
                                    ),

                                    // DefaultTextField(
                                    //   labelText: "Nombre",
                                    // ),
                                    SizedBox(height: defaultPadding),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 44,
                                        vertical: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        color: bgColor,
                                        border: Border(
                                          bottom: BorderSide(
                                            width: 1.0,
                                            color: bgColor,
                                          ),
                                        ),
                                      ),
                                      child: DropdownButtonFormField(
                                        focusNode: _typeDeRetoursFocusNode,
                                        onChanged: (newValue) {
                                          setState(() {
                                            expedition.type = newValue;
                                          });
                                          FocusScope.of(context).requestFocus(
                                              _nomDestinataireFocusNode);
                                        },
                                        value: _initialValueTyperRetours,
                                        hint: Text(
                                          "Type de retours",
                                          style: TextStyle(color: whiteColor),
                                        ),
                                        dropdownColor: darkBgColor,
                                        isExpanded: true,
                                        // underline: SizedBox(),
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: kSecondaryColor,
                                        ),

                                        validator: (value) => value == null
                                            ? 'field required'
                                            : null,
                                        items:
                                            listItemsRetoursFondsDropDownButton
                                                .map((value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: defaultPadding),

                        //=========================Reglement form=========================
                        if (Responsive.isDesktop(context))
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  color: darkBgColor,
                                  child: buildSubForm(
                                    "Règlement",
                                    [
                                      TextFormField(
                                        focusNode: _nbrColisFocusNode,
                                        keyboardType: TextInputType.number,
                                        onSaved: (newValue) => expedition
                                            .nbrColis = double.parse(newValue),
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return "Veuillez saisir le Nombre de Colis";
                                          }
                                          return null;
                                        },
                                        onFieldSubmitted: (_) {
                                          FocusScope.of(context).requestFocus(
                                              _typeDeMarchandiseFocusNode);
                                        },
                                        style: TextStyle(color: whiteColor),
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: bgColor,
                                          border: underlineInputBorder,
                                          focusedBorder: underlineInputBorder,
                                          labelText: "Nombre",
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.auto,
                                          labelStyle:
                                              TextStyle(color: whiteColor),
                                          contentPadding: EdgeInsets.symmetric(
                                            horizontal: 44,
                                            vertical: 20,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: defaultPadding),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 44,
                                          vertical: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          color: bgColor,
                                          border: Border(
                                            bottom: BorderSide(
                                              width: 1.0,
                                              color: bgColor,
                                            ),
                                          ),
                                        ),
                                        child: DropdownButtonFormField(
                                          focusNode:
                                              _typeDeMarchandiseFocusNode,
                                          value: _initialValueTypeMarchandise,
                                          hint: Text(
                                            "Type Marchandise",
                                            style: TextStyle(color: whiteColor),
                                          ),
                                          dropdownColor: darkBgColor,
                                          isExpanded: true,
                                          // underline: SizedBox(),
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: kSecondaryColor,
                                          ),
                                          onChanged: (newValue) {
                                            setState(() {
                                              expedition.typeMarchandise =
                                                  newValue;
                                            });
                                            FocusScope.of(context).requestFocus(
                                                _modePaiementFocusNode);
                                          },

                                          validator: (value) => value == null
                                              ? 'field required'
                                              : null,
                                          items:
                                              listItemsTypeMarchandiseDropDownButton
                                                  .map((value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(
                                                value,
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                      SizedBox(height: defaultPadding),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 44,
                                          vertical: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          color: bgColor,
                                          border: Border(
                                            bottom: BorderSide(
                                              width: 1.0,
                                              color: bgColor,
                                            ),
                                          ),
                                        ),
                                        child: DropdownButtonFormField(
                                          focusNode: _modePaiementFocusNode,
                                          value: _initialValueModePaiement,
                                          hint: Text(
                                            "Mode Paiement",
                                            style: TextStyle(color: whiteColor),
                                          ),
                                          onChanged: (newValue) {
                                            setState(() {
                                              expedition.modePaiement =
                                                  newValue;
                                            });
                                            FocusScope.of(context).requestFocus(
                                                _typeTaxationFocusNode);
                                          },
                                          dropdownColor: darkBgColor,
                                          isExpanded: true,
                                          // underline: SizedBox(),
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: kSecondaryColor,
                                          ),

                                          validator: (value) => value == null
                                              ? 'field required'
                                              : null,
                                          items:
                                              listItemsModePaiementDropDownButton
                                                  .map((value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(
                                                value,
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                      SizedBox(height: defaultPadding),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 44,
                                          vertical: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          color: bgColor,
                                          border: Border(
                                            bottom: BorderSide(
                                              width: 1.0,
                                              color: bgColor,
                                            ),
                                          ),
                                        ),
                                        child: DropdownButtonFormField(
                                          focusNode: _typeTaxationFocusNode,
                                          value: _initialValueTypeTaxation,
                                          hint: Text(
                                            "Type Taxation",
                                            style: TextStyle(color: whiteColor),
                                          ),
                                          dropdownColor: darkBgColor,
                                          isExpanded: true,
                                          // underline: SizedBox(),
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: kSecondaryColor,
                                          ),
                                          onChanged: (newValue) {
                                            setState(() {
                                              expedition.typeTaxation =
                                                  newValue;
                                            });
                                            FocusScope.of(context).requestFocus(
                                                _submitButtonFocusNode);
                                          },

                                          validator: (value) => value == null
                                              ? 'field required'
                                              : null,
                                          items:
                                              listItemsTypeTaxationDropDownButton
                                                  .map((value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(
                                                value,
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),

                    //destinataire subForm

                    if (!Responsive.isDesktop(context))
                      SizedBox(height: defaultPadding),

                    if (!Responsive.isDesktop(context))
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  // height: 500,
                                  color: darkBgColor,
                                  child: buildSubForm(
                                    "Destinataire",
                                    [
                                      TextFormField(
                                        focusNode: _nomDestinataireFocusNode,
                                        onSaved: (newValue) => expedition
                                            .nomDestinataire = newValue,
                                        textInputAction: TextInputAction.next,
                                        onFieldSubmitted: (_) {
                                          FocusScope.of(context).requestFocus(
                                              _telDestinataireFocusNode);
                                        },
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return "Veuillez saisir le nom du destinataire";
                                          }
                                          return null; //means there is no error
                                        },
                                        style: TextStyle(color: whiteColor),
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: bgColor,
                                          border: underlineInputBorder,
                                          focusedBorder: underlineInputBorder,
                                          labelText: "Nom Destinataire",
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.auto,
                                          labelStyle:
                                              TextStyle(color: whiteColor),
                                          contentPadding: EdgeInsets.symmetric(
                                            horizontal: 44,
                                            vertical: 20,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: defaultPadding),
                                      TextFormField(
                                        focusNode: _telDestinataireFocusNode,
                                        onSaved: (newValue) => expedition
                                            .telDestinataire = newValue,
                                        textInputAction: TextInputAction.next,
                                        keyboardType: TextInputType.phone,
                                        onFieldSubmitted: (_) {
                                          FocusScope.of(context).requestFocus(
                                              _villeDestinataireFocusNode);
                                        },
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return "Veuillez saisir un tel";
                                          }
                                          // var result =
                                          //     new RegExp(telPattern, caseSensitive: false)
                                          //         .hasMatch(value);
                                          // if (!result) {
                                          //   return "Veuillez saisir un tel valid";
                                          // }
                                          return null; //means there is no error
                                        },
                                        style: TextStyle(color: whiteColor),
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: bgColor,
                                          border: underlineInputBorder,
                                          focusedBorder: underlineInputBorder,
                                          labelText: "Telephone Destinataire",
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.auto,
                                          labelStyle:
                                              TextStyle(color: whiteColor),
                                          contentPadding: EdgeInsets.symmetric(
                                            horizontal: 44,
                                            vertical: 20,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: defaultPadding),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 44,
                                          vertical: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          color: bgColor,
                                          border: Border(
                                            bottom: BorderSide(
                                              width: 1.0,
                                              color: bgColor,
                                            ),
                                          ),
                                        ),
                                        child: DropdownButtonFormField(
                                          focusNode:
                                              _villeDestinataireFocusNode,
                                          value: _initialValueVilleDestinataire,
                                          hint: Text(
                                            "Ville Destinataire",
                                            style: TextStyle(color: whiteColor),
                                          ),
                                          dropdownColor: darkBgColor,
                                          isExpanded: true,
                                          // underline: SizedBox(),
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: kSecondaryColor,
                                          ),
                                          onChanged: (newValue) {
                                            setState(() {
                                              expedition.villeDestinataireId =
                                                  newValue;
                                            });
                                            FocusScope.of(context).requestFocus(
                                                _nbrColisFocusNode);
                                          },

                                          validator: (value) => value == null
                                              ? 'field required'
                                              : null,
                                          items: villes.map((ville) {
                                            return DropdownMenuItem<String>(
                                              value: ville["id"],
                                              child: Text(
                                                ville["nom"],
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    SizedBox(height: defaultPadding),

                    if (!Responsive.isDesktop(context))
                      //=========================Reglement form=========================
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  color: darkBgColor,
                                  child: buildSubForm(
                                    "Règlement",
                                    [
                                      TextFormField(
                                        focusNode: _nbrColisFocusNode,
                                        keyboardType: TextInputType.number,
                                        textInputAction: TextInputAction.next,
                                        onSaved: (newValue) =>
                                            expedition.nombre = newValue,
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return "Veuillez saisir le Nombre ";
                                          }
                                          return null;
                                        },
                                        onFieldSubmitted: (_) {
                                          FocusScope.of(context).requestFocus(
                                              _typeDeMarchandiseFocusNode);
                                        },
                                        style: TextStyle(color: whiteColor),
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: bgColor,
                                          border: underlineInputBorder,
                                          focusedBorder: underlineInputBorder,
                                          labelText: "Nombre",
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.auto,
                                          labelStyle:
                                              TextStyle(color: whiteColor),
                                          contentPadding: EdgeInsets.symmetric(
                                            horizontal: 44,
                                            vertical: 20,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: defaultPadding),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 44,
                                          vertical: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          color: bgColor,
                                          border: Border(
                                            bottom: BorderSide(
                                              width: 1.0,
                                              color: bgColor,
                                            ),
                                          ),
                                        ),
                                        child: DropdownButtonFormField(
                                          focusNode:
                                              _typeDeMarchandiseFocusNode,
                                          value: _initialValueTypeMarchandise,
                                          hint: Text(
                                            "Type Marchandise",
                                            style: TextStyle(color: whiteColor),
                                          ),
                                          dropdownColor: darkBgColor,
                                          isExpanded: true,
                                          // underline: SizedBox(),
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: kSecondaryColor,
                                          ),
                                          onChanged: (newValue) {
                                            setState(() {
                                              expedition.typeMarchandise =
                                                  newValue;
                                            });
                                            FocusScope.of(context).requestFocus(
                                                _modePaiementFocusNode);
                                          },

                                          validator: (value) => value == null
                                              ? 'field required'
                                              : null,
                                          items:
                                              listItemsTypeMarchandiseDropDownButton
                                                  .map((value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(
                                                value,
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                      SizedBox(height: defaultPadding),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 44,
                                          vertical: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          color: bgColor,
                                          border: Border(
                                            bottom: BorderSide(
                                              width: 1.0,
                                              color: bgColor,
                                            ),
                                          ),
                                        ),
                                        child: DropdownButtonFormField(
                                          focusNode: _modePaiementFocusNode,
                                          value: _initialValueModePaiement,
                                          hint: Text(
                                            "Mode Paiement",
                                            style: TextStyle(color: whiteColor),
                                          ),
                                          onChanged: (newValue) {
                                            setState(() {
                                              expedition.modePaiement =
                                                  newValue;
                                            });
                                            FocusScope.of(context).requestFocus(
                                                _typeTaxationFocusNode);
                                          },
                                          dropdownColor: darkBgColor,
                                          isExpanded: true,
                                          // underline: SizedBox(),
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: kSecondaryColor,
                                          ),

                                          validator: (value) => value == null
                                              ? 'field required'
                                              : null,
                                          items:
                                              listItemsModePaiementDropDownButton
                                                  .map((value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(
                                                value,
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                      SizedBox(height: defaultPadding),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 44,
                                          vertical: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          color: bgColor,
                                          border: Border(
                                            bottom: BorderSide(
                                              width: 1.0,
                                              color: bgColor,
                                            ),
                                          ),
                                        ),
                                        child: DropdownButtonFormField(
                                          focusNode: _typeTaxationFocusNode,
                                          value: _initialValueTypeTaxation,
                                          hint: Text(
                                            "Type Taxation",
                                            style: TextStyle(color: whiteColor),
                                          ),
                                          dropdownColor: darkBgColor,
                                          isExpanded: true,
                                          // underline: SizedBox(),
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: kSecondaryColor,
                                          ),
                                          onChanged: (newValue) {
                                            setState(() {
                                              expedition.typeTaxation =
                                                  newValue;
                                            });
                                            FocusScope.of(context).requestFocus(
                                                _submitButtonFocusNode);
                                          },
                                          validator: (value) => value == null
                                              ? 'field required'
                                              : null,
                                          items:
                                              listItemsTypeTaxationDropDownButton
                                                  .map((value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(
                                                value,
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

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
            ),
          ),
        ],
      ),
    );
  }
}
