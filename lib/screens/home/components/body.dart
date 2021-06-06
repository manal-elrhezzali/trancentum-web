import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'package:fl_chart/fl_chart.dart';

import 'package:trancentum_web_app/constants.dart';
import 'package:trancentum_web_app/models/expedition.dart';
import 'package:trancentum_web_app/models/package_status_info.dart';
import 'package:trancentum_web_app/responsive_widget.dart';

import 'expeditions_chart.dart';
import 'notifications_section.dart';
import 'package_status_info_card_grid_view.dart';
import 'recent_expedition_card_grid_view.dart';
import 'section_title.dart';
import 'show_or_Reduce_button.dart';

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
        child: ResponsiveWidget(
          desktop: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    //status
                    SectionTitle(title: "Status Expeditions"),
                    SizedBox(height: defaultPadding),
                    //package status header
                    PackageStatusInfoCardGridView(
                      demoMyPackages: demoMyPackages,
                      tapHandler: () {},
                    ),
                    SizedBox(height: defaultPadding),
                    SectionTitle(title: "Expeditions Consultées"),
        
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
                    ShowOrReduceButton(
                      pressHandler: () {
                        setState(() {
                          showAllRecentPackages = !showAllRecentPackages;
                        });
                      },
                      showAll: showAllRecentPackages,
                    ),
                  ],
                ),
              ),
              SizedBox(width: defaultPadding),
              Expanded(
                child: Column(
                  children: [
                    SectionTitle(title: "Graphe Expeditions"),
                    SizedBox(height: defaultPadding),
                    // expedition status chart
                    ExpeditionsChart(
                      pieChartSectionData: pieChartSectionData,
                      totalOfExpeditions: 342,
                    ),
                    SizedBox(height: defaultPadding * 2),
                    //NOTIFICATIONS
                    NotificationsSection(
                      showAll: showAllNotifications,
                      pressHandler: () {
                        setState(() {
                          showAllNotifications = !showAllNotifications;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          mobile: Container(
          //mobile
          child: Text("OOps i am mobile design"),
        ),
        ),
      ),
    );
  }
}
