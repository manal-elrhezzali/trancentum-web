import 'package:flutter/material.dart';
import 'package:trancentum_web_app/screens/dashboard/dashboard_screen.dart';
import 'package:trancentum_web_app/screens/sign_in/sign_in_screen.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  Body({Key key}) : super(key: key);
  final List<Map<String, Object>> listItems = [
    {
      "title": "Aide",
      "route": DashboardScreen.routeName, //change it
    },
    {
      "title": "Déconnexion",
      "route": SignInScreen.routeName,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      width: double.infinity,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: listItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            hoverColor: bgColor,
            contentPadding: EdgeInsets.all(defaultPadding),
            title: Text(
              listItems[index]["title"],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 15,
                color: whiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(listItems[index]["route"]);
            },
          );
        },
      ),
    );
  }
}
