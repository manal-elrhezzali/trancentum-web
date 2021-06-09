import 'package:flutter/material.dart';
import 'package:trancentum_web_app/models/side_menu_choice.dart';

import '../constants.dart';

class MobileAndTabletTabBarMenu extends StatelessWidget {
  const MobileAndTabletTabBarMenu({
    Key key,
    @required this.body,
  }) : super(key: key);
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: choices.length,
      child: Scaffold(
        backgroundColor: darkBgColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: bgColor,
          bottom: TabBar(
            // isScrollable: true,
            tabs: choices.map<Widget>((SideMenuChoice choice) {
              return Tab(
                text: (MediaQuery.of(context).size.width >= 775)
                    ? choice.title
                    : null,
                icon: Icon(choice.icon),
              );
            }).toList(),
          ),
        ),
        // body: SafeArea(
        //   child: body,
        // ),
        body: body,
      ),
    );
  }
}
