import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_c13_sun/ui/model/sura.dart';
import 'package:islami_c13_sun/ui/screens/home/tabs/quran/sura_name_row.dart';
import 'package:islami_c13_sun/ui/utils/app_colors.dart';
import 'package:islami_c13_sun/ui/utils/app_styles.dart';
import 'package:islami_c13_sun/ui/utils/asset_manager.dart';
import 'package:islami_c13_sun/ui/utils/constants.dart';

import 'most_recent_suras.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  String userText = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage(
          AssetsManager.mainBackground,
        ),
        fit: BoxFit.fill,
      )),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AssetsManager.islamiLogo),
            buildSearchTextField(),
            const SizedBox(
              height: 10,
            ),
            MostRecentSuras(),
            const Text(
              "Sura List",
              textAlign: TextAlign.start,
              style: AppStyles.whiteBold16,
            ),
            buildSurasListView()
          ],
        ),
      ),
    );
  }

  Widget buildSurasListView() {
    List<Sura> filteredSuras = [];
    filteredSuras = Constants.suras.where((sura) {
      return sura.nameAr.contains(userText) ||
          sura.nameEn.toLowerCase().contains(userText.toLowerCase());
    }).toList();
    print("user text: $userText");
    return Expanded(
      child: ListView.separated(
        itemCount: filteredSuras.length,
        itemBuilder: (context, index) {
          return SuraNameRow(
            index: index,
            sura: filteredSuras[index],
          );
        },
        separatorBuilder: (context, index) => Divider(),
      ),
    );
  }

  Widget buildSearchTextField() {
    OutlineInputBorder border = OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.primary, width: 2),
        borderRadius: BorderRadius.circular(10));
    return TextField(
      decoration: InputDecoration(
          border: border,
          enabledBorder: border,
          focusedBorder: border,
          labelText: "Sura name",
          labelStyle: const TextStyle(color: Colors.white, fontSize: 16),
          prefixIcon: Container(
              margin: const EdgeInsets.symmetric(vertical: 14),
              child: SvgPicture.asset(AssetsManager.icQuran))),
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.white, fontSize: 16),
      onChanged: (string) {
        userText = string;
        setState(() {});
      },
    );
  }
}
