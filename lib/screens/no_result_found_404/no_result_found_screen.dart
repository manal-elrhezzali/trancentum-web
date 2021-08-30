import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/src/provider.dart';
import 'package:trancentum_web_app/components/side_menu.dart';
import 'package:trancentum_web_app/controllers/MenuController.dart';
import 'package:trancentum_web_app/screens/dashboard/dashboard_screen.dart';
import 'package:trancentum_web_app/screens/forbidden_error_403_401/forbidden_error_screen.dart';

import '../../constants.dart';
import '../../responsive.dart';

class NoResultFoundScreen extends StatelessWidget {
  static String routeName = "/no_result_found";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (Responsive.isDesktop(context))
                Expanded(
                  child: SideMenu(),
                ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        if (!Responsive.isDesktop(context))
                          IconButton(
                            icon: Icon(Icons.menu),
                            onPressed:
                                context.read<MenuController>().controlMenu,
                          ),
                      ],
                    ),
                    Spacer(
                      flex: 2,
                    ),
                    Container(
                      // width: double.infinity,
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
                    SizedBox(height: defaultPadding),
                    Container(
                      width: double.infinity,
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
                    Spacer(),
                    Center(
                      child: SizedBox(
                        height: 50,
                        width: 500,
                        child: FlatButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacementNamed(
                                ForbiddenErrorScreen.routeName);//use dashboard instead
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
                    Spacer(
                      flex: 2,
                    ),
                  ],
                ),
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
              SizedBox(
                width: defaultPadding,
              )
            ],
          ),
        ),
      ),
    );
  }
}
