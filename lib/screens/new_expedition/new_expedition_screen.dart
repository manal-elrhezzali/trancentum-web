import 'package:flutter/material.dart';

import 'package:trancentum_web_app/components/side_menu.dart';
import 'package:trancentum_web_app/responsive.dart';
import '../../constants.dart';
import 'components/body.dart';

class NewExpeditionScreen extends StatelessWidget {
  static String routeName = "/new-expedition";
  const NewExpeditionScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: SafeArea(child: Body(),),
      desktop: Scaffold(
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
                child: Body(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
