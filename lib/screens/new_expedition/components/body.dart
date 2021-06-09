import 'package:flutter/material.dart';
import 'package:trancentum_web_app/components/default_text_field.dart';
import 'package:trancentum_web_app/screens/home/components/section_title.dart';

import '../../../constants.dart';
import '../../../responsive_widget.dart';
import 'drop_down_button.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);
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
                        // height: 500,
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
                        child: Text("I am retours fonds Container"),
                        width: double.infinity,
                        height: 500,
                        color: primaryColor,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: defaultPadding),
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
                        child: Text("I am reglement Container"),
                        width: double.infinity,
                        height: 500,
                        color: primaryColor,
                      ),
                    ],
                  ),
                ),
              ],
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
    );
  }
}
