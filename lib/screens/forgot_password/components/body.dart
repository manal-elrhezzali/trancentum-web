import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';
import '../../../responsive.dart';
import 'forgot_password_form.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2 * defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Responsive.isDesktop(context)
              ? Expanded(
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
            child: Column(
              children: [
                Container(
                  width: double.infinity,
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
                SizedBox(height: defaultPadding),
                Container(
                  width: double.infinity,
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
                Spacer(),
                ForgotPasswordForm(),
                Spacer(flex: 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
