import 'package:flutter/material.dart';
import 'package:islami_c13_sun/ui/screens/home/home.dart';
import 'package:islami_c13_sun/ui/screens/splash/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Home.routeName: (_) => const Home(),
        Splash.routeName: (_) => const Splash()
      },
      initialRoute: Splash.routeName,
    );
  }
}
