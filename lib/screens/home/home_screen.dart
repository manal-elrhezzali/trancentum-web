import 'package:flutter/material.dart';
import 'package:trancentum_web_app/components/side_menu.dart';
import 'package:trancentum_web_app/responsive_widget.dart';

import '../../constants.dart';
import 'components/desktop_body.dart';
import 'components/mobile_body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBgColor,
      appBar: ResponsiveWidget.isMobileOrTablet(context)
          ? AppBar(
              backgroundColor: bgColor,
              foregroundColor: kSecondaryColor,
              bottom: TabBar(
                isScrollable: true,
                tabs: choices.map<Widget>((Choice choice) {
                  return Tab(
                    text: choice.title,
                    icon: Icon(choice.icon),
                  );
                }).toList(),
              ),
            )
          : null,
      body: SafeArea(
        child: ResponsiveWidget(
          mobile: MobileBody(),
          desktop: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //side menu
              Expanded(child: SideMenu()),
              //home body
              Expanded(
                flex: 5,
                child: DesktopBody(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Choice {
  final String title;
  final IconData icon;
  const Choice({this.title, this.icon});
}

const List<Choice> choices = <Choice>[
  Choice(title: "Dashboard", icon: Icons.dashboard),
  Choice(title: "Compte", icon: Icons.account_circle_outlined),
  Choice(title: "New Expedition", icon: Icons.inventory_2_outlined),
  Choice(title: "Detail Expedition", icon: Icons.info_outline_rounded),
  Choice(title: "Aide", icon: Icons.help_center_outlined),
  Choice(title: "Déconnexion", icon: Icons.logout_outlined),
];
