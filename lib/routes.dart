import 'package:flutter/material.dart';
import 'package:trancentum_web_app/screens/otp/otp_screen.dart';

import 'screens/forgot_password/forgot_pasword_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/sign_in/sign_in_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
};
