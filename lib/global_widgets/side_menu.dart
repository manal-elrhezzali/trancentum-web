import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:trancentum_web_app/services/auth.dart';
import 'package:trancentum_web_app/screens/change_password/change_password_screen.dart';
import 'package:trancentum_web_app/screens/dashboard/dashboard_screen.dart';
import 'package:trancentum_web_app/screens/help/help_screen.dart';
import 'package:trancentum_web_app/screens/new_expedition/new_expedition_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key key,
  }) : super(key: key);
  _openURL() async {
    if (await canLaunch("https://trancentum.com/")) {
      await launch("https://trancentum.com/");
    } else {
      //show alert dialgue could not redirect you to our main website
      print("could not launch");
    }
  }

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
          // DrawerListTile(
          //   title: "Compte",
          //   iconSvg: "assets/icons/User Icon.svg",
          //   press: () {
          //     Navigator.of(context)
          //         .pushReplacementNamed(DetailsClientScreen.routeName);
          //   },
          // ),
          DrawerListTile(
            title: "Compte",
            iconSvg: "assets/icons/User Icon.svg",
            press: () {
              Navigator.of(context)
                  .pushReplacementNamed(ChangePasswordScreen.routeName);
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
              if (defaultTargetPlatform == TargetPlatform.android) {
                Navigator.of(context)
                    .pushReplacementNamed(HelpScreen.routeName);
              } else {
                _openURL();
              }
            },
          ),
          DrawerListTile(
            iconSvg: "assets/icons/Log out.svg",
            title: "Déconnexion",
            press: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/');
              Provider.of<Auth>(context, listen: false).logout();
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
