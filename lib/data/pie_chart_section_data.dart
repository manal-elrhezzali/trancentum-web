 import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

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