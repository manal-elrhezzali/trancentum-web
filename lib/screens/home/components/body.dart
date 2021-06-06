import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'package:fl_chart/fl_chart.dart';

import 'package:trancentum_web_app/constants.dart';
import 'package:trancentum_web_app/models/expedition.dart';
import 'package:trancentum_web_app/models/package_status_info.dart';

import 'package_status_info_card_grid_view.dart';
import 'recent_expedition_card_grid_view.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<PieChartSectionData> pieChartSectionData = [
    PieChartSectionData(
      //enregistree
      value: 25,
      color: primaryColor,
      showTitle: false,
      radius: 5,
    ),
    PieChartSectionData(
      //chargee
      value: 20,
      color: kPrimaryColor,
      showTitle: false,
      radius: 5,
    ),
    PieChartSectionData(
      //recue
      value: 10,
      color: Colors.green,
      showTitle: false,
      radius: 5,
    ),
    PieChartSectionData(
      //livree
      value: 20,
      color: Colors.brown,
      showTitle: false,
      radius: 5,
    ),
    PieChartSectionData(
      //retour
      value: 15,
      color: Colors.red,
      showTitle: false,
      radius: 5,
    ),
    PieChartSectionData(
      //cloturee
      value: 18,
      color: Colors.orange,
      showTitle: false,
      radius: 5,
    ),
  ];
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
  bool showAllRecentPackages = false;
  bool showAllNotifications = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding * 2),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  //status
                  Container(
                    // padding: EdgeInsets.all(defaultPadding),
                    width: double.infinity,
                    decoration: BoxDecoration(color: darkBgColor),
                    child: Text(
                      "Status Expeditions",
                      style: TextStyle(
                        color: whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: defaultPadding),
                  //package status header
                  PackageStatusInfoCardGridView(
                    demoMyPackages: demoMyPackages,
                    tapHandler: () {},
                  ),
                  SizedBox(height: defaultPadding),
                  Container(
                    // padding: EdgeInsets.all(defaultPadding),
                    width: double.infinity,
                    decoration: BoxDecoration(color: darkBgColor),
                    child: Text(
                      "Expeditions Consultées",
                      style: TextStyle(
                        color: whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: defaultPadding),
                  //expedition consultees
                  RecentExpeditionCardGridView(
                    childAspectRatio: 5,
                    tapHandler: () {},
                    crossAxisCount: 1,
                    demoRecentExpeditions: demoRecentExpeditions,
                    showAll: showAllRecentPackages,
                  ),
                  SizedBox(height: defaultPadding),
                  //tout afficher button
                  Container(
                    padding: EdgeInsets.all(defaultPadding / 2),
                    width: double.infinity,
                    color: bgColor,
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          showAllRecentPackages = !showAllRecentPackages;
                        });
                      },
                      child: Text(
                        showAllRecentPackages ? "REDUIRE" : "TOUT AFFICHER",
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
            SizedBox(width: defaultPadding),
            Expanded(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(color: darkBgColor),
                    child: Text(
                      "Graphe Expeditions",
                      style: TextStyle(
                        color: whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: defaultPadding),
                  // expedition status chart
                  Container(
                    width: double.infinity,
                    height: 200,
                    child: Stack(
                      children: [
                        PieChart(
                          PieChartData(
                            sectionsSpace: 0,
                            centerSpaceRadius: 100,
                            startDegreeOffset: -90,
                            sections: pieChartSectionData,
                          ),
                        ),
                        Positioned.fill(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Total",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3
                                    .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              Text(
                                "of 342 Exped.",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                      color: whiteColor,
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: defaultPadding * 2),
                  //Notifications
                  Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Notifications",
                          style: TextStyle(
                            color: whiteColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: defaultPadding),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: showAllNotifications ? 6 : 3,
                          itemBuilder: (context, index) {
                            return Card(
                              color: bgColor,
                              elevation: 0,
                              child: ListTile(
                                contentPadding: EdgeInsets.all(defaultPadding),
                                leading: Icon(
                                  Icons.notification_important_outlined,
                                  color: kSecondaryColor,
                                ),
                                title: Text(
                                  "I am a notification notification notification notification",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: whiteColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                trailing: IconButton(
                                  onPressed: () {
                                    //delete the notification
                                  },
                                  icon: Icon(
                                    Icons.delete_forever_outlined,
                                    color: redColor,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: defaultPadding),
                        //tout afficher button
                        Container(
                          padding: EdgeInsets.all(defaultPadding / 2),
                          width: double.infinity,
                          color: bgColor,
                          child: FlatButton(
                            onPressed: () {
                              setState(() {
                                showAllNotifications = !showAllNotifications;
                              });
                            },
                            child: Text(
                              showAllNotifications
                                  ? "REDUIRE"
                                  : "TOUT AFFICHER",
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
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
