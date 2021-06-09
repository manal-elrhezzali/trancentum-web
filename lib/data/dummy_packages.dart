  import 'package:flutter/material.dart';
import 'package:trancentum_web_app/models/package_status_info.dart';

import '../constants.dart';

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