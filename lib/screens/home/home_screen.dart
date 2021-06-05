import 'package:flutter/material.dart';
import 'package:trancentum_web_app/components/side_menu.dart';

import '../../constants.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: SingleChildScrollView(child: Body()),
            ),
          ],
        ),
      ),
    );
  }
}
