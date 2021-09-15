import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:trancentum_web_app/controllers/MenuController.dart';
import 'package:trancentum_web_app/models/expedition.dart';
import 'package:trancentum_web_app/providers/expeditions.dart';
import 'package:trancentum_web_app/screens/expedition_detail/expedition_detail_screen.dart';

import '../../../constants.dart';
import '../../../responsive.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //the state selected that was passed to the route
    String expeditionState =
        ModalRoute.of(context).settings.arguments as String;
    //gets expeditions by the state passed to the route
    final expeditionsData = Provider.of<Expeditions>(context);
    final _expeditionsByState =
        expeditionsData.getExpeditionsByState(expeditionState);
    return _expeditionsByState.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
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
                      if (!Responsive.isMobile(context))
                        Text(
                          "Expeditions par état",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                    ],
                  ),
                  SizedBox(height: defaultPadding),
                  Text(
                    "Aucune expedition trouvée",
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      "assets/images/waiting.png",
                      fit: BoxFit.cover,
                      color: whiteColor,
                    ),
                  ),
                ],
              ),
            );
          })
        : SafeArea(
            child: SingleChildScrollView(
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
                      if (!Responsive.isMobile(context))
                        Text(
                          "Expeditions by state",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                    ],
                  ),
                  SizedBox(height: defaultPadding),
                  Container(
                    padding: EdgeInsets.all(defaultPadding),
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Expéditions ",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
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
                                  _expeditionsByState.length,
                                  (index) => buildRecentExpeditionsDataRow(
                                      _expeditionsByState[index], context)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
