import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:trancentum_web_app/models/expedition.dart';
import 'package:trancentum_web_app/models/package_status_info.dart';
import 'package:trancentum_web_app/screens/home/components/package_status_info_card_grid_view.dart';
import 'package:trancentum_web_app/screens/home/components/show_or_Reduce_button.dart';

import '../../../constants.dart';
import 'expeditions_chart.dart';
import 'notifications_section.dart';
import 'recent_expedition_card_grid_view.dart';
import 'section_title.dart';

class MobileBody extends StatefulWidget {
  MobileBody({Key key}) : super(key: key);

  @override
  State<MobileBody> createState() => _MobileBodyState();
}

class _MobileBodyState extends State<MobileBody> {
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
    Size _size = MediaQuery.of(context).size;
    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //NOTIFICATIONS
            NotificationsSection(
              showAll: showAllNotifications,
              pressHandler: () {
                setState(() {
                  showAllNotifications = !showAllNotifications;
                });
              },
            ),
            SizedBox(height: defaultPadding * 2),

            //status
            SectionTitle(title: "Status Expeditions"),
            SizedBox(height: defaultPadding),
            //package status header
            PackageStatusInfoCardGridView(
              demoMyPackages: demoMyPackages,
              tapHandler: () {},
              crossAxisCount: (_size.width < 518) ? 1 : 2,
              childAspectRatio: (_size.width < 518)
                  ? ((_size.width < 416) ? 3 : 4)
                  : ((_size.width > 660)
                      ? ((_size.width > 726) ? 3.5 : 3)
                      : 2.5),
            ),
            SizedBox(height: defaultPadding * 2),
            //Chart section
            Column(
              children: [
                SectionTitle(title: "Graphe Expeditions"),
                SizedBox(height: defaultPadding),
                // expedition status chart
                ExpeditionsChart(
                  pieChartSectionData: pieChartSectionData,
                  totalOfExpeditions: 342,
                ),
              ],
            ),
            SizedBox(height: defaultPadding * 2),

            SectionTitle(title: "Expeditions Consultées"),
            SizedBox(height: defaultPadding),

            //expedition consultees
            RecentExpeditionCardGridView(
              childAspectRatio: 4,
              tapHandler: () {},
              crossAxisCount: (_size.width < 518) ? 1 : 2,
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
    );
  }
}
