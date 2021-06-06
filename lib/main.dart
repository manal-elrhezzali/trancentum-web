import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trancentum_web_app/screens/forgot_password/forgot_pasword_screen.dart';

import 'package:trancentum_web_app/theme.dart';
import 'routes.dart';
import 'screens/home/home_screen.dart';
import 'screens/sign_in/sign_in_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TranCENTUM',
      theme: theme(),
      // home:  MultiProvider(
      //   providers: [
      //     ChangeNotifierProvider(
      //       create: (context) => MenuController(),
      //     ),
      //   ],
      //   child: HomeScreen(),
      // ),
      home: ForgotPasswordScreen(),
      routes: routes,
    );
  }
}
