import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';
import '../../../responsive_widget.dart';
import 'otp_form.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(2 * defaultPadding),
        child: Row(
          children: [
            ResponsiveWidget.isDesktop(context)
                ? Expanded(
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
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
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
                  SizedBox(height: defaultPadding),
                  Container(
                    width: double.infinity,
                    child: Text(
                      "We sent a 4-digit code to +212 676 175 *** ",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: whiteColor),
                    ),
                  ),
                  SizedBox(height: defaultPadding),
                  buildTimer(context),
                  Spacer(),
                  OtpForm(),
                  Spacer(flex: 2),
                ],
              ),
            ),
          ],
        ),
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
            begin: 30.0,
            end: 0,
          ),
          duration: Duration(
            seconds: 30,
          ),
          builder: (context, value, child) => Text(
            "00:${value.toInt()}",
            style:
                Theme.of(context).textTheme.headline6.copyWith(color: redColor),
          ),
          onEnd: () {
            // Navigator.of(context).pushNamed(ForgotPasswordScreen.routeName);
          },
        ),
      ],
    );
  }
}
