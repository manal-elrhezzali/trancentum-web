import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';


import '../../../../constants.dart';
import 'chart.dart';
import 'package_status_info_card.dart';

class AllPackagesStatus extends StatelessWidget{
  final int expeditionEnregistreeCount;
  final int expeditionChargeeCount;
  final int expeditionRecueCount;
  final int expeditionLivreeCount;
  final int expeditionRetourCount;
  final int expeditionClotureeCount;   
  AllPackagesStatus({@required this.expeditionEnregistreeCount, @required this.expeditionChargeeCount , @required this.expeditionClotureeCount , @required this.expeditionLivreeCount, @required this.expeditionRecueCount , @required this.expeditionRetourCount,});
 @override
  Widget build(BuildContext context) {
     List<PieChartSectionData> pieChartSectionData = [
      PieChartSectionData(
        //enregistree
        value: expeditionEnregistreeCount.toDouble(),
        color: primaryColor,
        showTitle: false,
        radius: 10,
      ),
      PieChartSectionData(
        //chargee
        value: expeditionChargeeCount.toDouble(),
        color: kPrimaryColor,
        showTitle: false,
        radius: 10,
      ),
      PieChartSectionData(
        //recue
        value: expeditionRecueCount.toDouble(),
        color: Colors.green,
        showTitle: false,
        radius: 10,
      ),
      PieChartSectionData(
        //livree
        value: expeditionLivreeCount.toDouble(),
        color: Colors.brown,
        showTitle: false,
        radius: 10,
      ),
      PieChartSectionData(
        //retour
        value: expeditionRetourCount.toDouble(),
        color: Colors.red,
        showTitle: false,
        radius: 10,
      ),
      PieChartSectionData(
        //cloturee
        value: expeditionClotureeCount.toDouble(),
        color: Colors.orange,
        showTitle: false,
        radius: 10,
      ),
    ];
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Packages Status Chart",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          SizedBox(height: defaultPadding),
          Chart(pieChartSectionData: pieChartSectionData),
          PackageStatusInfoCard(
            title: "Enregistrée",
            amountOfPackages: expeditionEnregistreeCount,
            color: primaryColor,
          ),
          SizedBox(height: defaultPadding),
          PackageStatusInfoCard(
            title: "Chargée",
            amountOfPackages: expeditionChargeeCount,
            color: kPrimaryColor,
          ),
          SizedBox(height: defaultPadding),
          PackageStatusInfoCard(
            title: "Reçue",
            amountOfPackages:expeditionRecueCount,
            color: Colors.green,
          ),
          SizedBox(height: defaultPadding),
          PackageStatusInfoCard(
            title: "Livrée",
            amountOfPackages: expeditionLivreeCount,
            color: Colors.brown,
          ),
          SizedBox(height: defaultPadding),
          PackageStatusInfoCard(
            title: "Retour",
            amountOfPackages: expeditionRetourCount,
            color: Colors.red,
          ),
          SizedBox(height: defaultPadding),
          PackageStatusInfoCard(
            title: "Clôturée",
            amountOfPackages: expeditionClotureeCount,
            color: Colors.orange,
          ),
        ],
      ),
    );
  }
}



 
