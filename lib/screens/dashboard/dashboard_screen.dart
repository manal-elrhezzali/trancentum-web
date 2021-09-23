// import 'dart:html';
// import 'dart:io';

// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:trancentum_web_app/components/side_menu.dart';
import 'package:trancentum_web_app/controllers/MenuController.dart';
import 'package:trancentum_web_app/providers/client.dart';
import 'package:trancentum_web_app/screens/become_a_client/become_a_client_screen.dart';

import '../../responsive.dart';
import 'components/dashboard_content.dart';

class DashboardScreen extends StatefulWidget {
  static String routeName = "/dashboard";

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
      Provider.of<Client>(context, listen: false).getClient();
    //   Future.delayed(Duration.zero).then((_) {
    //   Provider.of<Client>(context, listen: false).getClient();
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List data =  Provider.of<Client>(context).listOfClients;

    if (data.isEmpty) {
      return BecomeAClientScreen();
    }
    print(data);
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
