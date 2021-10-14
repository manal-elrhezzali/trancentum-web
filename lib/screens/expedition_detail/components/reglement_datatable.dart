import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:trancentum_web_app/models/expedition.dart';
import 'package:trancentum_web_app/services/expeditions.dart';

import '../../../constants.dart';

class ReglementDatatable extends StatelessWidget {
  final List<Expedition> reglementList = [];
  final Expedition expeditionTrouvee;

  ReglementDatatable({@required this.expeditionTrouvee});

  final columns = [
    "Mode Paiement",
    "Type Taxation",
    "Montant HT",
    "Montant TVA",
    "Montant TTC",
    "Nombre",
    "Poids",
    "Type",
    "Valeur Déclarée",
    "Frais Ht/1 colis",
    "Frais HT total",
    "Frais TTC/1 colis",
    "Frais TTC total",
  ];

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Text(
              column,
              style: TextStyle(color: primaryColor),
            ),
          ))
      .toList();

  List<DataRow> getRows(List<Expedition> reglements) =>
      reglements.map((Expedition reglement) {
        final cells = [
          reglement.modePaiement,
          reglement.typeTaxation,
          reglement.montantHT,
          reglement.montantTVA,
          reglement.montantTTC,
          reglement.nombre,
          reglement.poids,
          reglement.typeMarchandise,
          reglement.valeurDeclaree,
          reglement.fraisHTperColis,
          reglement.fraisHTTotal,
          reglement.fraisTTCperColis,
          reglement.fraisTTCTotal,
        ];
        return DataRow(cells: getCells(cells));
      }).toList();
  List<DataCell> getCells(List<String> cells) => cells
      .map((data) => DataCell(Text(
            '$data',
          )))
      .toList();

  @override
  Widget build(BuildContext context) {
    //find reglement by code expedition
     final reglement = Provider.of<Expeditions>(context)
        .findById(expeditionTrouvee.codeExpedition);
    reglementList.add(reglement);
    return DataTable(
      columnSpacing: defaultPadding,
      horizontalMargin: 0,
      columns: getColumns(columns),
      rows: getRows(reglementList),
    );
  }
}
