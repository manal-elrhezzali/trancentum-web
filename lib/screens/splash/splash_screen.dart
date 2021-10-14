import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:trancentum_web_app/global_widgets/waiting_screen.dart';

import '../../responsive.dart';
import './components/body.dart';
import '../../size_config.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    if (Responsive.isMobile(context) && ((defaultTargetPlatform == TargetPlatform.iOS) ||
              (defaultTargetPlatform == TargetPlatform.android))) {
        return Scaffold(
          body: Body(),
        );
      } else {   
        return WaitingScreen();
      }
  
  }
}
