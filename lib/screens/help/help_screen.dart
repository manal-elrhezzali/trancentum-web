import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:trancentum_web_app/components/side_menu.dart';
import 'package:trancentum_web_app/controllers/MenuController.dart';

import '../../responsive.dart';
import 'components/body.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key key}) : super(key: key);
  static String routeName = "/aide";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      drawer: SideMenu(),
      // backgroundColor: darkBgColor,
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
