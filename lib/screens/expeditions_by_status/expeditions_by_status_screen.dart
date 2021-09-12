import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:trancentum_web_app/components/side_menu.dart';
import 'package:trancentum_web_app/controllers/MenuController.dart';

import '../../responsive.dart';
import 'components/body.dart';

class ExpeditionsByStatusScreen extends StatelessWidget {
  const ExpeditionsByStatusScreen({Key key}) : super(key: key);

 static String routeName = "/expeditions-by-status";
  @override
  Widget build(BuildContext context) {
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
              child: Body(),
            ),
          ],
        ),
      ),
    );
  }
}