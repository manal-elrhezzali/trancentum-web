import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trancentum_web_app/screens/dashboard/dashboard_screen.dart';
import 'package:trancentum_web_app/screens/new_expedition/new_expedition_screen.dart';
import 'package:trancentum_web_app/screens/settings/settings_screen.dart';
import 'package:trancentum_web_app/screens/sign_in/sign_in_screen.dart';

import '../constants.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: bgColor),
            child: Image.asset(
              "assets/images/logo_trancentum_without_bg.png",
            ),
          ),
          DrawerListTile(
            title: "Dashboard",
            iconSvg: "assets/icons/Menu Dashboard.svg",
            press: () {
              Navigator.of(context)
                  .pushReplacementNamed(DashboardScreen.routeName);
            },
          ),
          DrawerListTile(
            title: "Compte",
            iconSvg: "assets/icons/User Icon.svg",
            press: () {
              //add navigator of ...
            },
          ),
          DrawerListTile(
            iconSvg: "assets/icons/Package.svg",
            title: "Nouvelle Expedition",
            press: () {
              Navigator.of(context)
                  .pushReplacementNamed(NewExpeditionScreen.routeName);
            },
          ),
          DrawerListTile(
            iconSvg: "assets/icons/Question Mark.svg",
            title: "Aide",
            press: () {
              Navigator.of(context)
                  .pushReplacementNamed(SettingsScreen.routeName);
            },
          ),
          DrawerListTile(
            iconSvg: "assets/icons/Log out.svg",
            title: "Déconnexion",
            press: () {
              Navigator.of(context)
                  .pushReplacementNamed(SignInScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key key,
    // For selecting those three line once press "Command+D"
    @required this.title,
    @required this.iconSvg,
    @required this.press,
  }) : super(key: key);

  final String title;
  final String iconSvg;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
              iconSvg,
              width: 16,
              color: Colors.white54,
            ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
