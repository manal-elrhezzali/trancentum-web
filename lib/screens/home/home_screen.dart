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
