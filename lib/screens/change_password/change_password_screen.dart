import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:trancentum_web_app/global_widgets/side_menu.dart';


import '../../constants.dart';
import '../../responsive.dart';
import 'components/body.dart';

class ChangePasswordScreen extends StatelessWidget {
  static String routeName = "/change-password";

  const ChangePasswordScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ((defaultTargetPlatform == TargetPlatform.iOS) ||
              (defaultTargetPlatform == TargetPlatform.android) || (!Responsive.isDesktop(context)))
          ? AppBar(
              title: Text("Change password"),
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