import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_c13_sun/ui/screens/home/tabs/ahadeth/ahadeth_tab.dart';
import 'package:islami_c13_sun/ui/screens/home/tabs/pray_times/pray_times_tab.dart';
import 'package:islami_c13_sun/ui/screens/home/tabs/quran/quran_tab.dart';
import 'package:islami_c13_sun/ui/screens/home/tabs/radio/radio_tab.dart';
import 'package:islami_c13_sun/ui/screens/home/tabs/sebha/sebha_tab.dart';
import 'package:islami_c13_sun/ui/utils/app_colors.dart';
import 'package:islami_c13_sun/ui/utils/asset_manager.dart';

class Home extends StatefulWidget {
  static const routeName = "home";

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTabIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    AhadethTab(),
    RadioTab(),
    SebhaTab(),
    PrayTimesTab()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentTabIndex],
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget buildBottomNavigationBar() => Theme(
        data: ThemeData(canvasColor: AppColors.primary),
        child: BottomNavigationBar(
            selectedItemColor: AppColors.white,
            unselectedItemColor: AppColors.black,
            onTap: (clickedTabIndex) {
              currentTabIndex = clickedTabIndex;
              setState(() {});
            },
            currentIndex: currentTabIndex,
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AssetsManager.icQuran,
                    colorFilter:
                        ColorFilter.mode(AppColors.white, BlendMode.clear),
                  ),
                  label: "Quran"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AssetsManager.icAhadeth,
                  ),
                  label: "Ahadeth"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AssetsManager.icRadio,
                  ),
                  label: "Radio"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AssetsManager.icSebha,
                  ),
                  label: "Sebha"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AssetsManager.icPrayTimes,
                  ),
                  label: "Times"),
            ]),
      );
}
