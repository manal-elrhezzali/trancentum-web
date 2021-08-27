import 'package:flutter/material.dart';
import 'package:trancentum_web_app/components/side_menu.dart';

import '../../constants.dart';
import '../../responsive.dart';
import 'components/body.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key key}) : super(key: key);
  static String routeName = "/settings";

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: SafeArea(child: Body()),
      desktop: Scaffold(
        backgroundColor: darkBgColor,
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //side menu
              Expanded(child: SideMenu()),
              //home body
              Expanded(
                flex: 5,
                child: Body(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
