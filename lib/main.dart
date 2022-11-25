import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sesion9/preferences/preferences.dart';
import 'package:sesion9/providers/provider_login.dart';
import 'package:sesion9/providers/theme_provider.dart';
import 'package:sesion9/routes/route.dart';
import 'package:sesion9/screens/index.dart';
import 'package:sesion9/services/services_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => ThemeProvider(isDarkMode: Preferences.theme),
      ),
      ChangeNotifierProvider(
        create: (_) => ProviderLogin(),
      ),
      ChangeNotifierProvider(
        create: (_) => AuthService(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Provider.of<ThemeProvider>(context).currentTheme,
      onGenerateRoute: MyRoutes.generateRoute,
      initialRoute: MyRoutes.rLogin,
      //home: const HomeScreen(),
    );
  }
}
