import 'package:flutter/material.dart';
import 'package:islami_c13_sun/ui/model/sura.dart';
import 'package:islami_c13_sun/ui/screens/home/home.dart';
import 'package:islami_c13_sun/ui/screens/splash/splash.dart';
import 'package:islami_c13_sun/ui/screens/sura_details_screen/sura_details.dart';
import 'package:islami_c13_sun/ui/utils/constants.dart';

void main() {
  for (int i = 0; i < Constants.englishQuranSurahs.length; i++) {
    Constants.suras.add(Sura(Constants.englishQuranSurahs[i],
        Constants.suraNames[i], Constants.versesNumber[i], "${i + 1}.txt"));
  }
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
        Splash.routeName: (_) => const Splash(),
        SuraDetails.routeName: (_) => const SuraDetails(),
      },
      initialRoute: Splash.routeName,
    );
  }
}
