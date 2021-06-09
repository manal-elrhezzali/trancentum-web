import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'package:trancentum_web_app/constants.dart';
import 'package:trancentum_web_app/data/dummy_expeditions.dart';
import 'package:trancentum_web_app/data/dummy_packages.dart';
import 'package:trancentum_web_app/data/pie_chart_section_data.dart';

import 'expeditions_chart.dart';
import 'notifications_section.dart';
import 'package_status_info_card_grid_view.dart';
import 'recent_expedition_card_grid_view.dart';
import 'section_title.dart';
import 'show_or_Reduce_button.dart';

class DesktopBody extends StatefulWidget {
  DesktopBody({Key key}) : super(key: key);

  @override
  State<DesktopBody> createState() => _DesktopBodyState();
}

class _DesktopBodyState extends State<DesktopBody> {
 

  bool showAllRecentPackages = false;
  bool showAllNotifications = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(defaultPadding * 2),
      child: Row(
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
    );
  }
}
