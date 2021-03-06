import 'package:flutter/material.dart';
import 'package:trancentum_web_app/models/package_status_info.dart';

import '../../../constants.dart';
import 'header_package_info_card.dart';

class PackageStatusInfoCardGridView extends StatelessWidget {
  const PackageStatusInfoCardGridView({
    Key key,
    @required this.myPackages,
    this.crossAxisCount = 6,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final List<PackagesStatusInfo> myPackages;

  final int crossAxisCount;
  final double childAspectRatio;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: myPackages.length, //dummy data
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => HeaderPackageInfoCard(
        info: myPackages[index],
        myPackages: myPackages,
      ),
    );
  }
}