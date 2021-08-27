import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:trancentum_web_app/screens/sign_in/sign_in_screen.dart';
import 'constants.dart';
import 'controllers/MenuController.dart';
import 'providers/banques.dart';
import 'providers/expeditions.dart';
import 'providers/marchandises.dart';
import 'providers/notifications.dart';
import 'providers/retours_de_fonds.dart';
import 'providers/villes.dart';
import 'routes.dart';
import 'screens/dashboard/dashboard_screen.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Expeditions(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Villes(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => RetoursDeFonds(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Banques(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Marchandises(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Notifications(),
        ),
        ChangeNotifierProvider(
          create: (context) => MenuController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TranCENTUM',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: darkBgColor,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.white),
          canvasColor: bgColor,
        ),
        home: SignInScreen(),
        routes: routes,
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (ctx) => DashboardScreen());
        },
      ),
    );
  }
}
