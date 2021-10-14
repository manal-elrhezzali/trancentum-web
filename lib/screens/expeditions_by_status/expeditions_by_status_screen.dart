import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:trancentum_web_app/global_widgets/side_menu.dart';

import '../../constants.dart';
import '../../responsive.dart';
import 'components/body.dart';

class ExpeditionsByStatusScreen extends StatelessWidget {
  const ExpeditionsByStatusScreen({Key key}) : super(key: key);

  static String routeName = "/expeditions-by-status";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ((defaultTargetPlatform == TargetPlatform.iOS) ||
              (defaultTargetPlatform == TargetPlatform.android) ||
              (!Responsive.isDesktop(context)))
          ? AppBar(
              title: Text("Expeditions By status"),
              backgroundColor: bgColor,
            )
          : null,
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
              child: Body(),
            ),
          ],
        ),
      ),
    );
  }
}
