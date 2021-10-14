import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trancentum_web_app/global_widgets/side_menu.dart';
import 'package:trancentum_web_app/screens/dashboard/dashboard_screen.dart';

import '../../constants.dart';
import '../../responsive.dart';

class NoResultFoundScreen extends StatelessWidget {
  static String routeName = "/no_result_found";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: context.read<MenuController>().scaffoldKey,
      appBar: ((defaultTargetPlatform == TargetPlatform.iOS) ||
              (defaultTargetPlatform == TargetPlatform.android) || (!Responsive.isDesktop(context)))
          ? AppBar(
              title: null,
              backgroundColor: bgColor,
            )
          : null,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                child: SideMenu(),
              ),
            Responsive.isDesktop(context)
                ? Expanded(
                    flex: 2,
                    child: SvgPicture.asset(
                      "assets/icons/result_not_found_.svg",
                      width: double.infinity,
                    ),
                  )
                : SizedBox(
                    width: null,
                    height: null,
                  ),
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // SizedBox(height: 4 * defaultPadding),
                    Flexible(
                      fit: FlexFit.loose,
                      child: Container(
                        padding: EdgeInsets.all(2 * defaultPadding),
                        child: Text(
                          "Expedition non trouvée",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              .copyWith(color: reallyWhiteColor),
                        ),
                      ),
                    ),
                    SizedBox(height: defaultPadding),
                    Flexible(
                      fit: FlexFit.loose,
                      child: Container(
                        child: Text(
                          "Veuillez entrer un code d'expedition valide ",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          maxLines: 5,
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(color: whiteColor),
                        ),
                      ),
                    ),
                    SizedBox(height: 2 * defaultPadding),
                    Flexible(
                      fit: FlexFit.loose,
                      child: Padding(
                        padding: const EdgeInsets.all(defaultPadding),
                        child: SizedBox(
                          height: 50,
                          width: 500,
                          child: FlatButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacementNamed(
                                  DashboardScreen
                                      .routeName); 
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: redColor,
                            child: Text(
                              "Go to Dashboard",
                              style: TextStyle(
                                fontSize: 20,
                                color: whiteColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
