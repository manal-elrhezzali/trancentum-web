import 'package:flutter/material.dart';
import 'package:trancentum_web_app/models/package_status_info.dart';

import '../../../constants.dart';

class HeaderPackageInfoCard extends StatelessWidget {
  const HeaderPackageInfoCard({
    Key key,
    @required this.info,
    @required this.myPackages,
    @required this.tapHandler,
  }) : super(key: key);

  final PackagesStatusInfo info;
  final List<PackagesStatusInfo> myPackages;
  final Function tapHandler;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: tapHandler,
        child: Card(
          color: bgColor,
          elevation: 0,
          child: ListTile(
            contentPadding: EdgeInsets.all(defaultPadding),
            leading: Container(
              height: 40,
              width: 8,
              decoration: BoxDecoration(
                border: Border.all(
                  color: info.color,
                  width: 1.0,
                ),
                color: info.color,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            title: Text(
              info.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
                color: whiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              info.nbrOfPackages.toString(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: reallyWhiteColor.withOpacity(0.5),
                fontSize: 14,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_outlined,
              color: kSecondaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
