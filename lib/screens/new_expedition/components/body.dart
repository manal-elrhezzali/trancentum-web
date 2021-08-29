import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:trancentum_web_app/components/section_title.dart';
import 'package:trancentum_web_app/controllers/MenuController.dart';
import 'package:trancentum_web_app/models/expedition.dart';
import 'package:trancentum_web_app/screens/dashboard/dashboard_screen.dart';

import '../../../constants.dart';
import '../../../responsive.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //exepediteur/destinataire subform focus nodes
  final _telExpediteurFocusNode = FocusNode();
  final _telDestinataireFocusNode = FocusNode();

  //Retours de fonds subForm focus nodes
  final _nbrFacturesFocusNode = FocusNode();
  final _montantRetoursDeFondsFocusNode = FocusNode();
  final _nbrRetoursDeFondsFocusNode = FocusNode();

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
    codeExpedition: "",
    modePaiement: "PD",
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
    clientDestinataireId: "",
    clientExpediteurId: "",
    villeDestinataireId: "",
    villeExpediteurId: "",
  );

  //// expediteur / destinataire form
  String nomExpediteur = "";
  String telExpediteur = "";
  String nomDestinataire = "";
  String telDestinataire = "";
  //----->dropDown
// String _initialValueVilleExpediteur = "Fes";
  var _initialValueVilleExpediteur;
  var _initialValueVilleDestinataire;

  //// Retours de fonds form
  String nbrDeBonsLivraison = "";
  String nbrFactures = "";
  String montant = "";
  String nombre = "";
  //----->dropDown
  var _initialValueTypeDeRetours;

  //// Reglements form
  String nombreDeColis = "";
  //----->dropDown
  var _initialValueTypeMarchandise;
  var _initialValueModePaiement;
  var _initialValueTypeTaxation = "Forfait";

  void _saveForm() {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState.save();
    /////remove these prints
    print(nomExpediteur);
    print(telExpediteur);
    print(_initialValueVilleExpediteur);
    //
    print(nbrDeBonsLivraison);
    print(nbrFactures);
    print(montant);
    print(nombre);
    print(_initialValueTypeDeRetours);
    //
    print(nomDestinataire);
    print(telDestinataire);
    print(_initialValueVilleDestinataire);

    print(nombreDeColis);
    print(_initialValueTypeMarchandise);
    print(_initialValueModePaiement);
    print(_initialValueTypeTaxation);

    Navigator.of(context).pushNamed(DashboardScreen.routeName);
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Expedition added",
        ),
      ),
    );
  }

  @override
  void dispose() {
    _telExpediteurFocusNode.dispose();
    _telDestinataireFocusNode.dispose();
    _nbrFacturesFocusNode.dispose();
    _montantRetoursDeFondsFocusNode.dispose();
    _nbrRetoursDeFondsFocusNode.dispose();
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

    //get json Map from Back-End
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
                                          nomExpediteur = newValue,
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
                                          telExpediteur = newValue,
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
                                        onChanged: (newValue) => setState(() =>
                                            _initialValueVilleExpediteur =
                                                newValue),
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
                                        onSaved: (newValue) =>
                                            nomDestinataire = newValue,
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
                                        onSaved: (newValue) =>
                                            telDestinataire = newValue,
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
                                          value: _initialValueVilleExpediteur,
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
                                          onChanged: (newValue) => setState(() =>
                                              _initialValueVilleDestinataire =
                                                  newValue),
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
                                      onSaved: (newValue) =>
                                          nbrDeBonsLivraison = newValue,
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
                                      onSaved: (newValue) =>
                                          nbrFactures = newValue,
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
                                      onSaved: (newValue) => montant = newValue,
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
                                      onSaved: (newValue) => nombre = newValue,
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.number,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "Veuillez saisir le nombre";
                                        }
                                        return null;
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
                                        value: _initialValueTypeDeRetours,
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
                                        onChanged: (newValue) => setState(() =>
                                            _initialValueTypeDeRetours =
                                                newValue),
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
                                        keyboardType: TextInputType.number,
                                        onSaved: (newValue) =>
                                            nombreDeColis = newValue,
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return "Veuillez saisir le Nombre de Colis";
                                          }
                                          return null;
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
                                          onChanged: (newValue) => setState(
                                              () =>
                                                  _initialValueTypeMarchandise =
                                                      newValue),
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
                                          value: _initialValueModePaiement,
                                          hint: Text(
                                            "Mode Paiement",
                                            style: TextStyle(color: whiteColor),
                                          ),
                                          dropdownColor: darkBgColor,
                                          isExpanded: true,
                                          // underline: SizedBox(),
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: kSecondaryColor,
                                          ),
                                          onChanged: (newValue) => setState(
                                              () => _initialValueModePaiement =
                                                  newValue),
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
                                          onChanged: (newValue) => setState(
                                              () => _initialValueTypeTaxation =
                                                  newValue),
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
                                        onSaved: (newValue) =>
                                            nomDestinataire = newValue,
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
                                        onSaved: (newValue) =>
                                            telDestinataire = newValue,
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
                                          value: _initialValueVilleExpediteur,
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
                                          onChanged: (newValue) => setState(() =>
                                              _initialValueVilleDestinataire =
                                                  newValue),
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
                                        keyboardType: TextInputType.number,
                                        onSaved: (newValue) =>
                                            nombreDeColis = newValue,
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return "Veuillez saisir le Nombre de Colis";
                                          }
                                          return null;
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
                                          onChanged: (newValue) => setState(
                                              () =>
                                                  _initialValueTypeMarchandise =
                                                      newValue),
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
                                          value: _initialValueModePaiement,
                                          hint: Text(
                                            "Mode Paiement",
                                            style: TextStyle(color: whiteColor),
                                          ),
                                          dropdownColor: darkBgColor,
                                          isExpanded: true,
                                          // underline: SizedBox(),
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: kSecondaryColor,
                                          ),
                                          onChanged: (newValue) => setState(
                                              () => _initialValueModePaiement =
                                                  newValue),
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
                                          onChanged: (newValue) => setState(
                                              () => _initialValueTypeTaxation =
                                                  newValue),
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
