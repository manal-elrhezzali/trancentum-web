import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:trancentum_web_app/providers/client.dart';
import 'package:trancentum_web_app/screens/become_a_client/become_a_client_screen.dart';
import 'package:trancentum_web_app/screens/dashboard/dashboard_screen.dart';

import 'package:trancentum_web_app/screens/sign_in/sign_in_screen.dart';
import 'constants.dart';
import 'controllers/MenuController.dart';
import 'providers/auth.dart';
import 'providers/banques.dart';
import 'providers/expeditions.dart';
import 'providers/marchandises.dart';
import 'providers/notifications.dart';
import 'providers/retours_de_fonds.dart';
import 'providers/villes.dart';
import 'routes.dart';
import 'screens/forbidden_error_403_401/forbidden_error_screen.dart';
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
        ChangeNotifierProxyProvider<Auth, Client>(
          create: null,
          update: (ctx, auth, previousClients) => Client(
            auth.token,
            auth.userId
            // previousClients == null ? [] : previousClients.listOfClients,
          ),
        ),
        ChangeNotifierProxyProvider2<Auth, Client, Expeditions>(
          create: null,
          update: (ctx, auth, client, previousExpeditions) => Expeditions(
            auth.token,
            client.clientId,
            previousExpeditions == null ? [] : previousExpeditions.items,
          ),
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
          //(auth.isClient ? DashboardScreen() : ( (auth.userId != null) ? BecomeAClientScreen(userId : auth.userId): ForbiddenErrorScreen()))
          home: auth.isAuth ? DashboardScreen(): SignInScreen(),
          routes: routes,
          onUnknownRoute: (settings) {
            return MaterialPageRoute(builder: (ctx) => UnknownRouteScreen());
          },
        ),
      ),
    );
  }
}
