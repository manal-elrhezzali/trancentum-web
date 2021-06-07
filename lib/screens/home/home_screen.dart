import 'package:flutter/material.dart';
import 'package:trancentum_web_app/components/side_menu.dart';
import 'package:trancentum_web_app/models/side_menu_choice.dart';
import 'package:trancentum_web_app/responsive_widget.dart';

import '../../constants.dart';
import 'components/desktop_body.dart';
import 'components/mobile_body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isMobileOrTablet(context)
        ? DefaultTabController(
            length: choices.length,
            child: Scaffold(
              backgroundColor: darkBgColor,
              appBar: AppBar(
                backgroundColor: bgColor,
                bottom: TabBar(
                  tabs: choices.map<Widget>((SideMenuChoice choice) {
                    return 
                    Tab(
                      text: choice.title,
                      icon: Icon(choice.icon),
                    );
                  }).toList(),
                ),
              ),
              body: SafeArea(
                child: MobileBody(),
              ),
            ),
          )
        : Scaffold(
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
                    child: DesktopBody(),
                  ),
                ],
              ),
            ),
          );
  }
}

