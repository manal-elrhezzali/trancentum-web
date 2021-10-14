import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:trancentum_web_app/models/expedition.dart';
import 'package:trancentum_web_app/services/expeditions.dart';
import 'package:trancentum_web_app/screens/expedition_detail/expedition_detail_screen.dart';


import '../../../../constants.dart';

class RecentExpeditionsArray extends StatelessWidget {
  const RecentExpeditionsArray({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final recentExpeditionsData = Provider.of<Expeditions>(context,listen: false).searchedItems;
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Expéditions récentes",
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                showCheckboxColumn: false,
                columnSpacing: defaultPadding,
                horizontalMargin: 0,
                columns: [
                  DataColumn(
                    label: Text(
                      "Code d\' expédition",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "Date",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "État",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "V. Départ",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "V. D'arrivée",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
                rows: List.generate(
                    recentExpeditionsData.length,
                    (index) => buildRecentExpeditionsDataRow(
                        recentExpeditionsData[index], context)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  DataRow buildRecentExpeditionsDataRow(
      Expedition expedition, BuildContext context) {
    return DataRow(
      onSelectChanged: (bool selected) {
        if (selected) {
          Navigator.of(context).pushNamed(ExpeditionDetailScreen.routeName,
              arguments: expedition.codeExpedition);
        }
      },
      cells: [
        DataCell(
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Text(
              expedition.codeExpedition,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        DataCell(
          Text(
            DateFormat.yMMMd().format(expedition.dcreation),
            style: TextStyle(color: Colors.white),
          ),
        ),
        DataCell(
          Text(
            expedition.etat.toString().split('.').last,
            style: TextStyle(color: Colors.white),
          ),
        ),
        DataCell(
          Text(
            expedition.villeExpediteurId,
            style: TextStyle(color: Colors.white),
          ),
        ),
        DataCell(
          Text(
            expedition.villeDestinataireId,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
