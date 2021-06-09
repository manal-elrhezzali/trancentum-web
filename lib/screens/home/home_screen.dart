import 'package:flutter/material.dart';
import 'package:trancentum_web_app/components/mobile_and_tablet_tab_bar_menu.dart';
import 'package:trancentum_web_app/components/side_menu.dart';
import 'package:trancentum_web_app/responsive_widget.dart';

import '../../constants.dart';
import 'components/desktop_body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isMobileOrTablet(context)
        ? MobileAndTabletTabBarMenu()
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
