// import 'dart:html';
// import 'dart:io';

// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:trancentum_web_app/components/side_menu.dart';
import 'package:trancentum_web_app/controllers/MenuController.dart';

import '../../responsive.dart';
import 'components/dashboard_content.dart';

class DashboardScreen extends StatelessWidget {
  static String routeName = "/dashboard";
  @override
  Widget build(BuildContext context) {
    // if ((defaultTargetPlatform == TargetPlatform.iOS) ||
    //     (defaultTargetPlatform == TargetPlatform.android)) {
    //   print("I am a phone");
    // } else if ((defaultTargetPlatform == TargetPlatform.linux) ||
    //     (defaultTargetPlatform == TargetPlatform.macOS) ||
    //     (defaultTargetPlatform == TargetPlatform.windows)) {
    //   print("I am a desktop");
    // } else {
    //   print("I am a web");
    // }

    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                child: SideMenu(),
              ),
            Expanded(
              flex: 5, //takes 5/6 of the screen
              child: DashboardContent(),
            ),
          ],
        ),
      ),
    );
  }
}
