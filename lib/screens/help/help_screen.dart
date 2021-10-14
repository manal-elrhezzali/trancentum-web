import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:trancentum_web_app/global_widgets/side_menu.dart';

import '../../constants.dart';
import '../../responsive.dart';
import 'components/body.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key key}) : super(key: key);
  static String routeName = "/aide";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      appBar: ((defaultTargetPlatform == TargetPlatform.iOS) ||
              (defaultTargetPlatform == TargetPlatform.android) ||
              (!Responsive.isDesktop(context)))
          ? AppBar(
              title: Text("Help"),
              backgroundColor: bgColor,
            )
          : null,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                child: SideMenu(),
              ),
            //home body
            Expanded(
              flex: 5,
              child: Body(),
            ),
          ],
        ),
      ),
    );
  }
}
