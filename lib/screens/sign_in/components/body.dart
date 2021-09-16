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
      mobile: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: Image.asset(
                "assets/images/logo_trancentum_without_bg.png",
                width: 150,
                height: 150,
              ),
            ),
            SizedBox(height: defaultPadding * 3),
            Flexible(
              fit: FlexFit.loose,
              child: SignInForm(),
            ),
          ],
        ),
      ),
      desktop: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: Header(),
            ),
            SizedBox(height: defaultPadding * 3),
            Flexible(
              fit: FlexFit.loose,
              child: SignInForm(),
            ),
          ],
        ),
      ),
    );
  }
}
