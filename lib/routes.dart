import 'package:flutter/material.dart';
import 'package:trancentum_web_app/screens/new_expedition/new_expedition_screen.dart';
import 'package:trancentum_web_app/screens/no_result_found/no_result_found_screen.dart';
import 'package:trancentum_web_app/screens/otp/otp_screen.dart';

import 'screens/dashboard/dashboard_screen.dart';
import 'screens/expedition_detail/expedition_detail_screen.dart';
import 'screens/forgot_password/forgot_pasword_screen.dart';
import 'screens/settings/settings_screen.dart';
import 'screens/sign_in/sign_in_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  DashboardScreen.routeName: (context) => DashboardScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  NewExpeditionScreen.routeName: (context) => NewExpeditionScreen(),
  SettingsScreen.routeName: (context) => SettingsScreen(),
  ExpeditionDetailScreen.routeName: (context) => ExpeditionDetailScreen(),
  NoResultFoundScreen.routeName: (context) => NoResultFoundScreen(),


};
