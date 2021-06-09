import 'package:flutter/material.dart';
import 'package:trancentum_web_app/screens/home/home_screen.dart';
import 'package:trancentum_web_app/screens/new_expedition/new_expedition_screen.dart';
import 'package:trancentum_web_app/screens/sign_in/sign_in_screen.dart';

class SideMenuChoice {
  final String title;
  final IconData icon;
  const SideMenuChoice({this.title, this.icon});
}

class SideMenuChoicePage {
  const SideMenuChoicePage({Key key, this.choice, this.context});
  final SideMenuChoice choice;
  final BuildContext context;
  DisplayPage(SideMenuChoice choice, BuildContext context) {
    switch (choice.title) {
      case "Dashboard":
        return Navigator.of(context).pushNamed(HomeScreen.routeName);
        break;
      case "Compte":
        return Navigator.of(context).pushNamed(HomeScreen.routeName);
        break;
      case "New Expedition":
        return Navigator.of(context).pushNamed(NewExpeditionScreen.routeName);
        break;
      case "Detail Expedition":
        return Navigator.of(context).pushNamed(NewExpeditionScreen.routeName);
        break;
      case "Aide":
        return Navigator.of(context).pushNamed(NewExpeditionScreen.routeName);
        break;
      case "Déconnexion":
        return Navigator.of(context).pushNamed(SignInScreen.routeName);
        break;
    }
    ;
  }
}

const List<SideMenuChoice> choices = <SideMenuChoice>[
  SideMenuChoice(title: "Dashboard", icon: Icons.dashboard),
  SideMenuChoice(title: "Compte", icon: Icons.account_circle_outlined),
  SideMenuChoice(title: "New Expedition", icon: Icons.inventory_2_outlined),
  SideMenuChoice(title: "Detail Expedition", icon: Icons.info_outline_rounded),
  SideMenuChoice(title: "Aide", icon: Icons.help_center_outlined),
  SideMenuChoice(title: "Déconnexion", icon: Icons.logout_outlined),
];
