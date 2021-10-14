import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trancentum_web_app/screens/forgot_password/forgot_pasword_screen.dart';

import '../../../constants.dart';
import '../../../responsive.dart';
import 'otp_form.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(defaultPadding),
      child: Row(
        children: [
          Responsive.isDesktop(context)
              ? Expanded(
                  flex: 2,
                  child: SvgPicture.asset(
                    "assets/icons/Otp Icon.svg",
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
                      // width: double.infinity,
                      padding: EdgeInsets.all(2 * defaultPadding),
                      child: Text(
                        "Verification OTP",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        maxLines: 2,
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
                      // width: double.infinity,
                      child: Text(
                        "We sent a 6-digit code to your email",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(color: whiteColor),
                      ),
                    ),
                  ),
                  SizedBox(height: defaultPadding),
                  Flexible(
                    fit: FlexFit.loose,
                    child: buildTimer(context),
                  ),
                  SizedBox(height: 2 * defaultPadding),
                  Flexible(
                    fit: FlexFit.loose,
                    child: OtpForm(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row buildTimer(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Le code va expirer dans ",
          style: TextStyle(color: whiteColor, fontSize: 16),
        ),
        TweenAnimationBuilder(
          tween: Tween(
            begin: 50.0,
            end: 0,
          ),
          duration: Duration(
            seconds: 50,
          ),
          builder: (context, value, child) => Text(
            "00:${value.toInt()}",
            style:
                Theme.of(context).textTheme.headline6.copyWith(color: redColor),
          ),
          onEnd: () {
            Navigator.of(context)
                .pushReplacementNamed(ForgotPasswordScreen.routeName);
          },
        ),
      ],
    );
  }
}
