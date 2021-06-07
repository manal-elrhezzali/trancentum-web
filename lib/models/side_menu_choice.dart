import 'package:flutter/material.dart';

class SideMenuChoice {
  final String title;
  final IconData icon;
  const SideMenuChoice({this.title, this.icon});
}

const List<SideMenuChoice> choices = <SideMenuChoice>[
  SideMenuChoice(title: "Dashboard", icon: Icons.dashboard),
  SideMenuChoice(title: "Compte", icon: Icons.account_circle_outlined),
  SideMenuChoice(title: "New Expedition", icon: Icons.inventory_2_outlined),
  SideMenuChoice(title: "Detail Expedition", icon: Icons.info_outline_rounded),
  SideMenuChoice(title: "Aide", icon: Icons.help_center_outlined),
  SideMenuChoice(title: "Déconnexion", icon: Icons.logout_outlined),
];
