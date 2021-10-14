import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trancentum_web_app/global_widgets/side_menu.dart';
import 'package:trancentum_web_app/services/expeditions.dart';
import 'package:trancentum_web_app/screens/no_result_found_404/no_result_found_screen.dart';

import '../../constants.dart';
import '../../responsive.dart';
import 'components/body.dart';

class ExpeditionDetailScreen extends StatelessWidget {
  static String routeName = "/expedition-detail";
  @override
  Widget build(BuildContext context) {
    final _expeditionCode = ModalRoute.of(context).settings.arguments as String;
    final _searchedExpedition = Provider.of<Expeditions>(
      context,
      listen: false,
    ).findById(_expeditionCode);
    if (_searchedExpedition != null && _expeditionCode != null) {
      Provider.of<Expeditions>(context, listen: false)
          .storeSearchedCodeExpedition(_expeditionCode);
    }
    return (_searchedExpedition == null)
        ? NoResultFoundScreen()
        : Scaffold(
            appBar: ((defaultTargetPlatform == TargetPlatform.iOS) ||
                    (defaultTargetPlatform == TargetPlatform.android) ||
                    (!Responsive.isDesktop(context)))
                ? AppBar(
                    title: Text("Expedition Details"),
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
                    flex: 5,
                    child: Body(searchedExpedition: _searchedExpedition),
                  ),
                ],
              ),
            ),
          );
  }
}
