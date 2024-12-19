import 'package:flutter/material.dart';
import 'package:islami_c13_sun/ui/model/sura.dart';
import 'package:islami_c13_sun/ui/model/sura_details_args.dart';
import 'package:islami_c13_sun/ui/screens/sura_details_screen/sura_details.dart';
import 'package:islami_c13_sun/ui/utils/shared_prefs_utils.dart';
import 'package:provider/provider.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/asset_manager.dart';

class SuraNameRow extends StatelessWidget {
  final Sura sura;
  late RecentSurasProvider provider;

  SuraNameRow({super.key, required this.sura});

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return InkWell(
      onTap: () async {
        provider.addSuraIndex(sura.index);
        await Navigator.pushNamed(context, SuraDetails.routeName,
            arguments: SuraDetailsArgs(
                nameAr: sura.nameAr,
                nameEn: sura.nameEn,
                fileName: sura.fileName));

        /// This block of code will be done after user closes SuraDetails
      },
      child: Row(
        children: [
          buildSuraNumberWithBackground(),
          SizedBox(
            width: 24,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sura.nameEn,
                  style: TextStyle(color: AppColors.white, fontSize: 20),
                ),
                Text(
                  "${sura.verses} verses",
                  style: TextStyle(color: AppColors.white, fontSize: 14),
                ),
              ],
            ),
          ),
          Text(
            "${sura.nameAr}",
            style: TextStyle(color: AppColors.white, fontSize: 20),
          )
        ],
      ),
    );
  }

  Container buildSuraNumberWithBackground() {
    return Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AssetsManager.islamicNumbersBg),
                fit: BoxFit.fill)),
        child: Center(
          child: Text(
            "${sura.index + 1}",
            style: TextStyle(
                color: AppColors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ));
  }
}
