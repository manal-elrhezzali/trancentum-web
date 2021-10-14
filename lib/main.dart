import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:trancentum_web_app/screens/dashboard/dashboard_screen.dart';
import 'package:trancentum_web_app/screens/sign_in/sign_in_screen.dart';

import 'global_widgets/waiting_screen.dart';
import 'constants.dart';
import 'controllers/MenuController.dart';
import 'services/auth.dart';
import 'services/expeditions.dart';
import 'routes.dart';
import 'screens/unknown_route/unknown_route_screen.dart';

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
          create: (ctx) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Expeditions>(
          create: (ctx) => null,
          update: (ctx, auth, previousExpeditions) => Expeditions(
            auth.token,
            auth.userId,
            previousExpeditions == null ? [] : previousExpeditions.items,
          ),
        ),
        // ChangeNotifierProvider(
        //   create: (ctx) => Villes(),
        // ),
        // ChangeNotifierProvider(
        //   create: (ctx) => Banques(),
        // ),
        // ChangeNotifierProvider(
        //   create: (ctx) => Marchandises(),
        // ),
        ChangeNotifierProvider(
          create: (context) => MenuController(),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'TranCENTUM',
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: darkBgColor,
            textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
                .apply(bodyColor: Colors.white),
            canvasColor: bgColor,
          ),
          home: auth.isAuth
              ? DashboardScreen()
              : FutureBuilder(
                  future: auth.tryAutoLogin(),
                  builder: (ctx, authResultSnapshot) =>
                      authResultSnapshot.connectionState ==
                              ConnectionState.waiting
                          ? WaitingScreen(text: "Loading....")
                          : SignInScreen(),
                ),
          routes: routes,
          onUnknownRoute: (settings) {
            return MaterialPageRoute(builder: (ctx) => UnknownRouteScreen());
          },
        ),
      ),
    );
  }
}


