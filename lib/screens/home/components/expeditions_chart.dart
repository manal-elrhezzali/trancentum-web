import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class ExpeditionsChart extends StatelessWidget {
  const ExpeditionsChart({
    Key key,
    @required this.pieChartSectionData,
    @required this.totalOfExpeditions,
  }) : super(key: key);

  final List<PieChartSectionData> pieChartSectionData;
  final int totalOfExpeditions;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  style: Theme.of(context).textTheme.headline3.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Text(
                  "of $totalOfExpeditions Exped.",
                  style: Theme.of(context).textTheme.headline6.copyWith(
                        color: whiteColor,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
