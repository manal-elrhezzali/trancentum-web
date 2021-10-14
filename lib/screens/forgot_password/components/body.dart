import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';
import '../../../responsive.dart';
import 'forgot_password_form.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2 * defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Responsive.isDesktop(context)
              ? Expanded(
                  flex: 2,
                  child: SvgPicture.asset(
                    "assets/icons/Forgot Password.svg",
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
                    child: Container(
                      padding: EdgeInsets.all(2 * defaultPadding),
                      child: Text(
                        "Mot de passe oublié ?",
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
                        "Veuillez entrer votre email et nous \n vous enverrons un code OTP par mail ",
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
                    child: ForgotPasswordForm(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
