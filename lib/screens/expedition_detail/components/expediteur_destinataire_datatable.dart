import 'package:flutter/material.dart';
import 'package:trancentum_web_app/models/expedition.dart';


import '../../../constants.dart';

class ExpediteurDestinataireDatatable extends StatelessWidget {
  final List<Expedition> expeditionList = [];
    final Expedition expeditionTrouvee;

  ExpediteurDestinataireDatatable({@required this.expeditionTrouvee});
  final columns = [
    "Expediteur",
    "Destinataire",
    "Ville Expedieur",
    "Ville Destinataire",
  ];

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Text(
              column,
              style: TextStyle(color: primaryColor),
            ),
          ))
      .toList();

  List<DataRow> getRows(List<Expedition> expeditions) =>
      expeditions.map((Expedition expedition) {
        
        final cells = [
          // expedition.nomExpediteur, // replace with expediteur name
          // expedition.nomDestinataire, // replace with destinateur name
          "Manal EL RHEZZALI",
          "Aya Hamani",
          expedition.villeExpediteurId,
          expedition.villeDestinataireId,
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
    //get the villeExpediteur and villeDestinataireId from their id 
    expeditionList.add(expeditionTrouvee);
    return DataTable(
      columnSpacing: defaultPadding,
      horizontalMargin: 0,
      columns: getColumns(columns),
      rows: getRows(expeditionList),
    );
  }
}
