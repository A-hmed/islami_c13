import 'package:flutter/material.dart';
import 'package:islami_c13_sun/ui/model/sura.dart';
import 'package:islami_c13_sun/ui/screens/hadeth_details/hadeth_details.dart';
import 'package:islami_c13_sun/ui/screens/home/home.dart';
import 'package:islami_c13_sun/ui/screens/splash/splash.dart';
import 'package:islami_c13_sun/ui/screens/sura_details_screen/sura_details.dart';
import 'package:islami_c13_sun/ui/utils/constants.dart';
import 'package:islami_c13_sun/ui/utils/shared_prefs_utils.dart';
import 'package:provider/provider.dart';

void main() {
  Set<int> nums = {1, 2};
  nums.add(1);
  ["1", "1"];
  for (int i = 0; i < 114; i++) {
    Constants.suras.add(Sura(Constants.englishQuranSurahs[i],
        Constants.suraNames[i], Constants.versesNumber[i], "${i + 1}.txt", i));
  }
  runApp(ChangeNotifierProvider(
      create: (_) => RecentSurasProvider(), child: const MyApp()));
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
        HadethDetails.routeName: (_) => const HadethDetails(),
      },
      initialRoute: Splash.routeName,
    );
  }
}
