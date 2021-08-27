import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({
    Key key,
    @required this.pieChartSectionData,
  }) : super(key: key);

  final List<PieChartSectionData> pieChartSectionData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PieChart(
        PieChartData(
          sectionsSpace: 0,
          centerSpaceRadius: 70,
          startDegreeOffset: -90,
          sections: pieChartSectionData,
        ),
      ),
    );
  }
}
