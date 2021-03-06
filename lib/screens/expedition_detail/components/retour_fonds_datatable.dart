import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trancentum_web_app/models/expedition.dart';
import 'package:trancentum_web_app/services/expeditions.dart';

import '../../../constants.dart';

class RetourFondsDatatable extends StatelessWidget {
  final List<Expedition> retourFondsList = [];
  final Expedition expeditionTrouvee;
  RetourFondsDatatable({@required this.expeditionTrouvee});

  final columns = [
    "Retour",
    "Montant en DH",
    "Nombre",
    "Banque",
    "Série",
    "Observation",
    "Etat",
  ];

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Text(
              column,
              style: TextStyle(color: primaryColor),
            ),
          ))
      .toList();

  List<DataRow> getRows(List<Expedition> retoursFonds) =>
      retoursFonds.map((Expedition retour) {
        final cells = [
          retour.type.toString().split('.').last,
          retour.montant.toString(),
          retour.nombre.toString(),
          retour.banqueId,
          retour.serie,
          retour.observation,
          retour.etat,
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
    final retourFonds = Provider.of<Expeditions>(context)
        .findById(expeditionTrouvee.codeExpedition);
    retourFondsList.add(retourFonds);
    return DataTable(
      columnSpacing: defaultPadding,
      horizontalMargin: 0,
      columns: getColumns(columns),
      rows: getRows(retourFondsList),
    );
  }
}
