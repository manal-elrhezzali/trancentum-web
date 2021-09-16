import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/src/provider.dart';
import 'package:trancentum_web_app/components/side_menu.dart';
import 'package:trancentum_web_app/controllers/MenuController.dart';
import 'package:trancentum_web_app/screens/sign_in/sign_in_screen.dart';

import '../../constants.dart';
import '../../responsive.dart';

class MailErrorScreen extends StatelessWidget {
  static String routeName = "/mail_error";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                child: SideMenu(),
              ),
            Responsive.isDesktop(context)
                ? Expanded(
                    flex: 2,
                    child: SvgPicture.asset(
                      "assets/icons/email not sent.svg",
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
                    Flexible(
                      fit: FlexFit.loose,
                      child: Row(
                        children: [
                          if (!Responsive.isDesktop(context))
                            IconButton(
                              icon: Icon(Icons.menu),
                              onPressed:
                                  context.read<MenuController>().controlMenu,
                            ),
                        ],
                      ),
                    ),
                    SizedBox(height: 4 * defaultPadding),
                    Flexible(
                      fit: FlexFit.loose,
                      child: Container(
                        padding: EdgeInsets.all(2 * defaultPadding),
                        child: Text(
                          "Ooops! Something went wrong",
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
                        width: double.infinity,
                        child: Text(
                          "Please Try Again Later ",
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
                    SizedBox(height: defaultPadding * 4),
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
                                  SignInScreen
                                      .routeName);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: redColor,
                            child: Text(
                              "Go to Sign In",
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
