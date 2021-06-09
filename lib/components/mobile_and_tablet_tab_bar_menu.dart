import 'package:flutter/material.dart';
import 'package:trancentum_web_app/screens/home/components/mobile_body.dart';
import 'package:trancentum_web_app/screens/new_expedition/new_expedition_screen.dart';
import 'package:trancentum_web_app/screens/settings/settings_screen.dart';
import 'package:trancentum_web_app/screens/sign_in/sign_in_screen.dart';

import '../constants.dart';

class MobileAndTabletTabBarMenu extends StatefulWidget {
  @override
  _MobileAndTabletTabBarMenuState createState() =>
      _MobileAndTabletTabBarMenuState();
}

class _MobileAndTabletTabBarMenuState extends State<MobileAndTabletTabBarMenu> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        "page": MobileBody(),
        "title": "Dashboard",
        "icon": Icons.dashboard,
      },
      {
        "page": NewExpeditionScreen(),
        "title": "Compte",
        "icon": Icons.account_circle_outlined,
      },
      {
        "page": NewExpeditionScreen(),
        "title": "New Expedition",
        "icon": Icons.inventory_2_outlined,
      },
      {
        "page": NewExpeditionScreen(),
        "title": "Detail Expedition",
        "icon": Icons.info_outline_rounded,
      },
      {
        "page": SettingsScreen(),
        "title": "Paramètres",
        "icon": Icons.settings,
      },

      // {
      //   "page": NewExpeditionScreen(),
      //   "title": "Aide",
      //   "icon": Icons.help_center_outlined,
      // },
      // {
      //   "page": SignInScreen(),
      //   "title": "Déconnexion",
      //   "icon": Icons.logout_outlined,
      // },
    ];
    super.initState();
  }

  //Flutter automatically give sus the index of the selected tab
  void _selectPage(int index) {
    setState(() {
      //to switch the page whenever the selected index changes
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _pages.length,
      child: Scaffold(
        backgroundColor: darkBgColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: bgColor,
          bottom: TabBar(
            onTap: _selectPage,

            // isScrollable: true,
            tabs: _pages.map<Widget>((Map<String, Object> page) {
              return Tab(
                text: (MediaQuery.of(context).size.width >= 775)
                    ? page['title']
                    : null,
                icon: Icon(page['icon']),
              );
            }).toList(),
          ),
        ),
        body: _pages[_selectedPageIndex]["page"],
      ),
    );
  }
}
