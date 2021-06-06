import 'package:flutter/material.dart';
import 'package:trancentum_web_app/components/side_menu.dart';

import '../../constants.dart';
import 'components/body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = "/forgot_password";
  const ForgotPasswordScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBgColor,
      body: SafeArea(
        child: Body()
      ),
    );
  }
}
