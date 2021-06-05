import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:trancentum_web_app/constants.dart';
import 'package:trancentum_web_app/models/package_status_info.dart';

import 'package_status_info_card_grid_view.dart';

class Body extends StatelessWidget {
  Body({Key key}) : super(key: key);
  final List<PackagesStatusInfo> demoMyPackages = [
    PackagesStatusInfo(
      title: "Enregistrée",
      numOfPackages: 4,
      color: primaryColor,
    ),
    PackagesStatusInfo(
      title: "Chargée",
      numOfPackages: 8,
      color: kPrimaryColor,
    ),
    PackagesStatusInfo(
      title: "Reçue",
      numOfPackages: 22,
      color: Colors.green,
    ),
    PackagesStatusInfo(
      title: "Livrée",
      numOfPackages: 7,
      color: Colors.brown,
    ),
    PackagesStatusInfo(
      title: "Retour",
      numOfPackages: 10,
      color: Colors.red,
    ),
    PackagesStatusInfo(
      title: "Clôturée",
      numOfPackages: 2,
      color: Colors.orange,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(defaultPadding * 2),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              children: [
                //status
                Container(
                  padding: EdgeInsets.all(defaultPadding),
                  width: double.infinity,
                  decoration: BoxDecoration(color: darkBgColor),
                  child: Text(
                    "Status d'Expeditions",
                    style: TextStyle(
                      color: whiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),

                PackageStatusInfoCardGridView(
                  demoMyPackages: demoMyPackages,
                ),

                SizedBox(height: defaultPadding * 2),
                //datatable Container
                Container(
                  width: double.infinity,
                  child: Text("DataTable container"),
                  color: Colors.pink,
                ),
              ],
            ),
          ),
          SizedBox(width: defaultPadding),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  color: whiteColor,
                  child: Text("Chart Container hereeeee"),
                ),
                SizedBox(height: defaultPadding * 2),
                Container(
                  width: double.infinity,
                  color: redColor,
                  child: Text("Notifications Container hereeeee"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
