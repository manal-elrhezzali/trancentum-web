
import 'package:flutter/material.dart';
import 'package:trancentum_web_app/models/package_status_info.dart';

class ProgressLine extends StatelessWidget {
  const ProgressLine({
    Key key,
    @required this.info,
    @required this.myPackages,
  }) : super(key: key);

  final PackagesStatusInfo info;
  final List<PackagesStatusInfo> myPackages;

  double calculatePercentage(
      List<PackagesStatusInfo> packagesInfo, PackagesStatusInfo package) {
    int sumOfPackages = calculateSumOfPackages(packagesInfo);
    double percentage = (package.nbrOfPackages * 100 / sumOfPackages);
    print(percentage);
    return percentage;
  }

  int calculateSumOfPackages(List<PackagesStatusInfo> packagesInfo) {
    int sumOfPackages = 0;
    packagesInfo.forEach((onePackage) {
      sumOfPackages += onePackage.nbrOfPackages;
    });
    print(sumOfPackages);
    return sumOfPackages;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
            color: info.color.withOpacity(0.1),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth *
                (calculatePercentage(myPackages, info) /
                    calculateSumOfPackages(myPackages)),
            height: 5,
            decoration: BoxDecoration(
              color: info.color,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}
