import 'package:flutter/material.dart';
import 'package:trancentum_web_app/screens/help/help_screen.dart';
import 'package:trancentum_web_app/screens/new_expedition/new_expedition_screen.dart';
import 'package:trancentum_web_app/screens/no_result_found_404/no_result_found_screen.dart';
import 'package:trancentum_web_app/screens/otp/otp_screen.dart';

import 'screens/become_a_client/become_a_client_screen.dart';
import 'screens/dashboard/dashboard_screen.dart';
import 'screens/expedition_detail/expedition_detail_screen.dart';
import 'screens/expeditions_by_status/expeditions_by_status_screen.dart';
import 'screens/forbidden_error_403_401/forbidden_error_screen.dart';
import 'screens/forgot_password/forgot_pasword_screen.dart';
import 'screens/mail_error/mail_error_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/sign_in/sign_in_screen.dart';
import 'screens/sign_up/sign_up_screen.dart';
import 'screens/unknown_route/unknown_route_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SignInScreen.routeName: (context) => SignInScreen(), //scrollable
  SignUpScreen.routeName: (context) => SignUpScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),//scrollable
  DashboardScreen.routeName: (context) => DashboardScreen(),//scrollable
  NewExpeditionScreen.routeName: (context) => NewExpeditionScreen(),//scrollable
  HelpScreen.routeName: (context) => HelpScreen(),//scrollable
  ExpeditionDetailScreen.routeName: (context) => ExpeditionDetailScreen(),//scrollable
  ProfileScreen.routeName: (context) => ProfileScreen(),//scrollable
  ExpeditionsByStatusScreen.routeName: (context) => ExpeditionsByStatusScreen(),  
  OtpScreen.routeName: (context) => OtpScreen(),//scrollable
  BecomeAClientScreen.routeName: (context) => BecomeAClientScreen(),

  //error screens
  NoResultFoundScreen.routeName: (context) => NoResultFoundScreen(),//scrollable (when no search result is found for an expedition code)
  ForbiddenErrorScreen.routeName: (context) => ForbiddenErrorScreen(),//scrollable  //401-403 error
  MailErrorScreen.routeName: (context) => MailErrorScreen(),//scrollable (when after OTP validation the email is not send to user)
  UnknownRouteScreen.routeName: (context) => UnknownRouteScreen(),//scrollable (when flutter doesn't find a page to paint)



};
