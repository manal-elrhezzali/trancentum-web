import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';
import '../../../responsive_widget.dart';
import 'forgot_password_form.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2 * defaultPadding),
      child: ResponsiveWidget(
        mobile: Container(
          //mobile
          child: Text("OOps i am mobile design"),
        ),
        desktop: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SvgPicture.asset(
                "assets/icons/Forgot Password.svg",
                width: double.infinity,
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(2 * defaultPadding),
                    child: Text(
                      "Mot de passe oublié ?",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      maxLines: 1,
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
                      "Veuillez entrer votre numéro de téléphone et nous \n vous enverrons votre mot de passe par message ",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: whiteColor),
                    ),
                  ),
                  Spacer(),
                  ForgotPasswordForm(),
                  Spacer(flex: 2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
