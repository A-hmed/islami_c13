import 'package:flutter/material.dart';
import 'package:islami_c13_sun/ui/model/sura.dart';
import 'package:islami_c13_sun/ui/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecentSurasProvider extends ChangeNotifier {
  List<Sura> mostRecentSuras = [];

  void addSuraIndex(int suraIndex) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> mostRecentSuras =
        prefs.getStringList("most_recent_suras") ?? [];

    if (mostRecentSuras.contains("$suraIndex")) {
      mostRecentSuras.remove("$suraIndex");
      mostRecentSuras.add("$suraIndex");
    } else {
      mostRecentSuras.add("$suraIndex");
    }

    prefs.setStringList("most_recent_suras", mostRecentSuras.toList());
  }

  Future<void> refreshMostRecentSuras() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Sura> newMostRecentSuras = [];

    List<String> mostRecentSurasAsString =
        (prefs.getStringList("most_recent_suras") ?? []).toList();

    for (int i = 0; i < mostRecentSurasAsString.length; i++) {
      var suraIndex = int.parse(mostRecentSurasAsString[i]);
      newMostRecentSuras.add(Constants.suras[suraIndex]);
    }

    mostRecentSuras = newMostRecentSuras.reversed.toList();
    notifyListeners(); //setState()
    print("el most recent list: ${mostRecentSuras}");
  }
}
