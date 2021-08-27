import 'package:flutter/material.dart';
import 'package:trancentum_web_app/components/default_text_field.dart';
import 'package:trancentum_web_app/components/section_title.dart';

import '../../../constants.dart';
import '../../../responsive.dart';
import 'drop_down_button.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();

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
  Widget build(BuildContext context) {
    List listItemsVilleExpediteurDropDownButton = [
      "Meknes",
      "Casablanca",
      "Fès",
    ];
    List listItemsVilleDestinataireDropDownButton = [
      "Tanger",
      "Errachidia",
      "Larache",
    ];
    List listItemsRetoursFondsDropDownButton = [
      "C/Remboursement",
      "C/chèque",
      "C/Traite",
      "C/BL",
    ];
    List listItemsTypeMarchandiseDropDownButton = [
      "marchandise 1",
      "marchandise 2",
    ];
    List listItemsModePaiementDropDownButton = [
      "PP",
      "PPE",
      "PD",
      "PDE",
    ];
    List listItemsTypeTaxationDropDownButton = [
      "Forfait",
      "Taxation",
      "Service",
    ];
    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding * 2),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
                            "Expediteur",
                            [
                              DefaultTextField(
                                labelText: "Nom Expediteur",
                              ),
                              SizedBox(height: defaultPadding),
                              DefaultTextField(
                                labelText: "Tel Expediteur",
                              ),
                              SizedBox(height: defaultPadding),
                              DropDownButton(
                                hintText: "Ville Expediteur",
                                dropDownItems:
                                    listItemsVilleExpediteurDropDownButton,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: defaultPadding),
                        Container(
                          width: double.infinity,
                          color: darkBgColor,
                          child: buildSubForm(
                            "Retours de fonds",
                            [
                              DefaultTextField(
                                labelText: "Nombre Bons livraison",
                              ),
                              SizedBox(height: defaultPadding),
                              DefaultTextField(
                                labelText: "Nombre Factures",
                              ),
                              SizedBox(height: defaultPadding),
                              DefaultTextField(
                                labelText: "Montant",
                              ),
                              SizedBox(height: defaultPadding),
                              DefaultTextField(
                                labelText: "Nombre",
                              ),
                              SizedBox(height: defaultPadding),
                              DropDownButton(
                                hintText: "Type de retours",
                                dropDownItems:
                                    listItemsRetoursFondsDropDownButton,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: defaultPadding),
                  Responsive.isDesktop(context)
                      ? Expanded(
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                // height: 500,
                                color: darkBgColor,
                                child: buildSubForm(
                                  "Destinataire",
                                  [
                                    DefaultTextField(
                                      labelText: "Nom Destinataire",
                                    ),
                                    SizedBox(height: defaultPadding),
                                    DefaultTextField(
                                      labelText: "Tel Destinataire",
                                    ),
                                    SizedBox(height: defaultPadding),
                                    DropDownButton(
                                      hintText: "Ville Destinataire",
                                      dropDownItems:
                                          listItemsVilleDestinataireDropDownButton,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: defaultPadding),
                              Container(
                                width: double.infinity,
                                color: darkBgColor,
                                child: buildSubForm(
                                  "Règlement",
                                  [
                                    DefaultTextField(
                                      labelText: "Nombre Colis",
                                    ),
                                    SizedBox(height: defaultPadding),
                                    DropDownButton(
                                      hintText: "Type Marchandise",
                                      dropDownItems:
                                          listItemsTypeMarchandiseDropDownButton,
                                    ),
                                    SizedBox(height: defaultPadding),
                                    DropDownButton(
                                      hintText: "Mode Paiement",
                                      dropDownItems:
                                          listItemsModePaiementDropDownButton,
                                    ),
                                    SizedBox(height: defaultPadding),
                                    DropDownButton(
                                      hintText: "Type Taxation",
                                      dropDownItems:
                                          listItemsTypeTaxationDropDownButton,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      : SizedBox(
                          height: 0,
                          width: 0,
                        ),
                ],
              ),
              Responsive.isMobile(context)
                  ? SizedBox(height: defaultPadding)
                  : SizedBox(
                      height: 0,
                      width: 0,
                    ),
              Responsive.isMobile(context)
                  ? Container(
                      width: double.infinity,
                      // height: 500,
                      color: darkBgColor,
                      child: buildSubForm(
                        "Destinataire",
                        [
                          DefaultTextField(
                            labelText: "Nom Destinataire",
                          ),
                          SizedBox(height: defaultPadding),
                          DefaultTextField(
                            labelText: "Tel Destinataire",
                          ),
                          SizedBox(height: defaultPadding),
                          DropDownButton(
                            hintText: "Ville Destinataire",
                            dropDownItems:
                                listItemsVilleDestinataireDropDownButton,
                          ),
                        ],
                      ),
                    )
                  : SizedBox(
                      height: 0,
                      width: 0,
                    ),
              Responsive.isMobile(context)
                  ? SizedBox(height: defaultPadding)
                  : SizedBox(
                      height: 0,
                      width: 0,
                    ),
              Responsive.isMobile(context)
                  ? Container(
                      width: double.infinity,
                      color: darkBgColor,
                      child: buildSubForm(
                        "Règlement",
                        [
                          DefaultTextField(
                            labelText: "Nombre Colis",
                          ),
                          SizedBox(height: defaultPadding),
                          DropDownButton(
                            hintText: "Type Marchandise",
                            dropDownItems:
                                listItemsTypeMarchandiseDropDownButton,
                          ),
                          SizedBox(height: defaultPadding),
                          DropDownButton(
                            hintText: "Mode Paiement",
                            dropDownItems: listItemsModePaiementDropDownButton,
                          ),
                          SizedBox(height: defaultPadding),
                          DropDownButton(
                            hintText: "Type Taxation",
                            dropDownItems: listItemsTypeTaxationDropDownButton,
                          ),
                        ],
                      ),
                    )
                  : SizedBox(
                      height: 0,
                      width: 0,
                    ),
              SizedBox(height: defaultPadding * 2),
              Container(
                padding: EdgeInsets.all(defaultPadding / 2),
                width: double.infinity,
                color: bgColor,
                child: FlatButton(
                  onPressed: () {},
                  child: Text(
                    "CONTINUER",
                    style: TextStyle(
                      color: whiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
