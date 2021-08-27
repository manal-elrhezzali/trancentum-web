import 'package:flutter/material.dart';
import 'package:trancentum_web_app/responsive.dart';

import '../../../constants.dart';
import 'header.dart';
import 'sign_in_form.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/logo_trancentum_without_bg.png",
            width: 150,
            height: 150,
          ),
          SizedBox(height: defaultPadding * 3),
          SignInForm(),
          Spacer(),
        ],
      ),
      desktop: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Header(),
          Spacer(),
          SignInForm(),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}
