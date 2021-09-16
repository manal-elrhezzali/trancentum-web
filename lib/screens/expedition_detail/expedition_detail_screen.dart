import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trancentum_web_app/components/side_menu.dart';
import 'package:trancentum_web_app/controllers/MenuController.dart';
import 'package:trancentum_web_app/providers/expeditions.dart';
import 'package:trancentum_web_app/screens/no_result_found_404/no_result_found_screen.dart';

import '../../responsive.dart';
import 'components/body.dart';

class ExpeditionDetailScreen extends StatelessWidget {
  static String routeName = "/expedition-detail";
  @override
  Widget build(BuildContext context) {
    final _expeditionCode = ModalRoute.of(context).settings.arguments as String;
    print(_expeditionCode);
    final _searchedExpedition = Provider.of<Expeditions>(
      context,
      listen: false,
    ).findById(_expeditionCode);
    return _searchedExpedition == null
        ? NoResultFoundScreen()
        : Scaffold(
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
                    child: Body(searchedExpedition: _searchedExpedition),
                  ),
                ],
              ),
            ),
          );
  }
}
