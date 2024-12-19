import 'package:flutter/material.dart';
import 'package:islami_c13_sun/ui/model/sura.dart';
import 'package:islami_c13_sun/ui/utils/app_colors.dart';
import 'package:islami_c13_sun/ui/utils/app_styles.dart';
import 'package:islami_c13_sun/ui/utils/asset_manager.dart';
import 'package:islami_c13_sun/ui/utils/shared_prefs_utils.dart';
import 'package:provider/provider.dart';

class MostRecentSuras extends StatefulWidget {
  const MostRecentSuras({super.key});

  @override
  State<MostRecentSuras> createState() => _MostRecentSurasState();
}

class _MostRecentSurasState extends State<MostRecentSuras> {
  late RecentSurasProvider provider;

  @override
  void initState() {
    super.initState();

    ///This is block of code is called once BEFORE build finishes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ///This is block of code is called once After build finishes
      getMostRecentSuras();
    });
  }

  Future<void> getMostRecentSuras() async {
    await provider.refreshMostRecentSuras();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    print("37- build");
    return provider.mostRecentSuras.isEmpty
        ? Container()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Most recently",
                textAlign: TextAlign.start,
                style: AppStyles.whiteBold16,
              ),
              Container(
                height: MediaQuery.of(context).size.height * .25,
                child: ListView.builder(
                    itemCount: provider.mostRecentSuras.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return buildMostRecentSuraWidget(
                          provider.mostRecentSuras[index]);
                    }),
              )
            ],
          );
  }

  Widget buildMostRecentSuraWidget(Sura sura) {
    return Container(
      width: MediaQuery.of(context).size.width * .7,
      height: MediaQuery.of(context).size.height * .5,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
          color: AppColors.primary, borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sura.nameEn,
                  style: AppStyles.blackBold24,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  sura.nameAr,
                  style: AppStyles.blackBold24,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "${sura.verses} verses",
                  style: AppStyles.blackBold14,
                )
              ],
            ),
          ),
          Image.asset(AssetsManager.recentSuraImage)
        ],
      ),
    );
  }
}
