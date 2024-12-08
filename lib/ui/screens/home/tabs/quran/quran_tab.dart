import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_c13_sun/ui/screens/home/tabs/quran/sura_name_row.dart';
import 'package:islami_c13_sun/ui/utils/app_colors.dart';
import 'package:islami_c13_sun/ui/utils/asset_manager.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

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
            const Text(
              "Sura List",
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white),
            ),
            buildSurasListView()
          ],
        ),
      ),
    );
  }

  Widget buildSurasListView() {
    return Expanded(
      child: ListView.separated(
        itemCount: 114,
        itemBuilder: (context, index) {
          return SuraNameRow(index: index);
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
    );
  }
}
