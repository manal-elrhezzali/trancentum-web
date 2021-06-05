import 'package:flutter/material.dart';
import 'package:trancentum_web_app/models/expedition.dart';

import '../../../constants.dart';

class RecentExpeditionCard extends StatelessWidget {
  const RecentExpeditionCard({
    Key key,
    @required this.info,
    @required this.myRecentExpedtions,
    @required this.tapHandler,
  }) : super(key: key);
  final Expedition info;
  final List<Expedition> myRecentExpedtions;
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
                  color: kSecondaryColor,
                  width: 1.0,
                ),
                color: kSecondaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            title: Text(
              info.codeExpedition,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
                color: whiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              info.date,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 13,
                color: Colors.white.withOpacity(0.5),
              ),
            ),
            trailing: Text(
              info.etat,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
                color: whiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
