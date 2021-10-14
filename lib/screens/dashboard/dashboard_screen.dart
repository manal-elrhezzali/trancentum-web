// import 'dart:html';
// import 'dart:io';

// import 'package:flutter/foundation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trancentum_web_app/global_widgets/side_menu.dart';
import 'package:trancentum_web_app/services/expeditions.dart';

import '../../constants.dart';
import '../../responsive.dart';
import 'components/dashboard_content.dart';

class DashboardScreen extends StatelessWidget {
  static String routeName = "/dashboard";
  
  Future<void> _refreshExpeditions(BuildContext context) async {
    await Provider.of<Expeditions>(context, listen: false).fetchAndSetExpeditions();
  }
  // @override
  // void initState() {
  //     Provider.of<Client>(context, listen: false).getClient();
  //   //   Future.delayed(Duration.zero).then((_) {
  //   //   Provider.of<Client>(context, listen: false).getClient();
  //   // });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // List data =  Provider.of<Client>(context).listOfClients;

    // if (data.isEmpty) {
    //   return BecomeAClientScreen();
    // }
    // print(data);
    // // if ((defaultTargetPlatform == TargetPlatform.iOS) ||
    // //     (defaultTargetPlatform == TargetPlatform.android)) {
    // //   print("I am a phone");
    // // } else if ((defaultTargetPlatform == TargetPlatform.linux) ||
    // //     (defaultTargetPlatform == TargetPlatform.macOS) ||
    // //     (defaultTargetPlatform == TargetPlatform.windows)) {
    // //   print("I am a desktop");
    // // } else {
    // //   print("I am a web");
    // // }

    return Scaffold(
      appBar: ((defaultTargetPlatform == TargetPlatform.iOS) ||
              (defaultTargetPlatform == TargetPlatform.android) ||
              (!Responsive.isDesktop(context)))
          ? AppBar(
              title: Text("Dashboard"),
              backgroundColor: bgColor,
            )
          : null,
      drawer: SideMenu(),
      body: RefreshIndicator(
        onRefresh: () => _refreshExpeditions(context),
        child: SafeArea(
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
      ),
    );
  }
}
