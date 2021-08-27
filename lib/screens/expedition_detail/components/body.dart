import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:trancentum_web_app/controllers/MenuController.dart';
import 'package:trancentum_web_app/models/expedition.dart';

import '../../../constants.dart';
import '../../../responsive.dart';
import 'expediteur_destinataire_datatable.dart';
import 'infos_generales_datatable.dart';
import 'reglement_datatable.dart';
import 'retour_fonds_datatable.dart';

class Body extends StatelessWidget {
  final Expedition searchedExpedition;

  Body({@required this.searchedExpedition});

  Widget buildDataTable(String title, Widget widget) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white54),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: redColor,
              fontSize: 18,
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: widget,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(defaultPadding),
      child: Column(
        children: [
          Row(
            children: [
              if (!Responsive.isDesktop(context))
                IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: context.read<MenuController>().controlMenu,
                ),
              if (Responsive.isMobile(context))
                Text(
                  "Details d'expedition",
                  style: Theme.of(context).textTheme.headline6,
                ),
            ],
          ),
          SizedBox(height: defaultPadding),
          buildDataTable(
              "Informations Générales",
              InfoGeneraleDatatable(
                expeditionTrouvee: searchedExpedition,
              )),
          SizedBox(height: defaultPadding),
          buildDataTable(
              "Expediteur / Destinataire",
              ExpediteurDestinataireDatatable(
                expeditionTrouvee: searchedExpedition,
              )),
          SizedBox(height: defaultPadding),
          buildDataTable("Retours de fonds",
              RetourFondsDatatable(expeditionTrouvee: searchedExpedition)),
          SizedBox(height: defaultPadding),
          buildDataTable("Règlements",
              ReglementDatatable(expeditionTrouvee: searchedExpedition)),
        ],
      ),
    );
  }
}
