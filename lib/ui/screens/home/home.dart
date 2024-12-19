import 'package:flutter/material.dart';
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
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (index) {
          currentTabIndex = index;

          /// Update bottom navigation when user changes page in page view
          setState(() {});
        },
        controller: controller,
        children: tabs,
      ),
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
              controller.animateToPage(currentTabIndex,
                  curve: Curves.bounceIn,
                  duration: Duration(milliseconds: 500));

              ///Connect user click with page view
              setState(() {});
            },
            currentIndex: currentTabIndex,
            items: const [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(AssetsManager.icQuran)),
                  label: "Quran"),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(AssetsManager.icAhadeth)),
                  label: "Ahadeth"),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(AssetsManager.icRadio)),
                  label: "Radio"),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(AssetsManager.icSebha)),
                  label: "Sebha"),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(AssetsManager.icPrayTimes)),
                  label: "Times"),
            ]),
      );
}
