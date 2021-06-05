import 'package:flutter/material.dart';

class PackagesStatusInfo {
  final String title, svgSrc;
  final int numOfPackages, percentage;
  final Color color;

  PackagesStatusInfo({
    this.numOfPackages,
    this.title,
    this.percentage,
    this.color,
    this.svgSrc = "assets/icons/Package.svg",
  });
  int get nbrOfPackages => numOfPackages;
}

