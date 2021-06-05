import 'package:flutter/material.dart';

import '../constants.dart';
import 'side_menu_item.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  bool showDashboardText = false;
  bool showAccountText = false;
  bool showNewPackageText = false;
  bool showHelpCenterText = false;
  bool showLogoutText = false;
  bool showPackageDEtailText = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Container(
        padding: EdgeInsets.all(2 * defaultPadding),
        color: darkBgColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo_trancentum_without_bg.png",
              width: 100,
              height: 100,
            ),
            SizedBox(height: defaultPadding * 2),
            //dashboard
            SideMenuItem(
              showText: showDashboardText,
              icon: Icons.dashboard,
              text: "Dashboard",
              pressHandler: () {
                setState(() {
                  showNewPackageText = false;
                  showDashboardText = !showDashboardText;
                  showAccountText = false;
                  showHelpCenterText = false;
                  showLogoutText = false;
                  showPackageDEtailText = false;
                });
              },
            ),

            SizedBox(height: defaultPadding),
            //compte
            SideMenuItem(
              showText: showAccountText,
              icon: Icons.account_circle_outlined,
              text: "Compte",
              pressHandler: () {
                setState(() {
                  showNewPackageText = false;
                  showDashboardText = false;
                  showAccountText = !showAccountText;
                  showHelpCenterText = false;
                  showLogoutText = false;
                  showPackageDEtailText = false;
                });
              },
            ),
            SizedBox(height: defaultPadding),
            //new package
            SideMenuItem(
              showText: showNewPackageText,
              icon: Icons.inventory_2_outlined,
              text: "New Expedition",
              pressHandler: () {
                setState(() {
                  showNewPackageText = !showNewPackageText;
                  showDashboardText = false;
                  showAccountText = false;
                  showHelpCenterText = false;
                  showLogoutText = false;
                  showPackageDEtailText = false;
                });
              },
            ),
            SizedBox(height: defaultPadding),
            //Expedition Detail
            SideMenuItem(
              showText: showPackageDEtailText,
              icon: Icons.info_outline_rounded,
              text: "Detail Expedition",
              pressHandler: () {
                setState(() {
                  showNewPackageText = false;
                  showDashboardText = false;
                  showAccountText = false;
                  showHelpCenterText = false;
                  showLogoutText = false;
                  showPackageDEtailText = !showPackageDEtailText;
                });
              },
            ),
            SizedBox(height: defaultPadding),
            //aide
            SideMenuItem(
              showText: showHelpCenterText,
              icon: Icons.help_center_outlined,
              text: "Aide",
              pressHandler: () {
                setState(() {
                  showNewPackageText = false;
                  showDashboardText = false;
                  showAccountText = false;
                  showHelpCenterText = !showHelpCenterText;
                  showLogoutText = false;
                  showPackageDEtailText = false;
                });
              },
            ),
            SizedBox(height: defaultPadding),
            //logout
            SideMenuItem(
              showText: showLogoutText,
              icon: Icons.logout_outlined,
              text: "Déconnexion",
              pressHandler: () {
                setState(() {
                  showNewPackageText = false;
                  showDashboardText = false;
                  showAccountText = false;
                  showHelpCenterText = false;
                  showLogoutText = !showLogoutText;
                  showPackageDEtailText = false;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
