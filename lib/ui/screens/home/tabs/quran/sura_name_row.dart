import 'package:flutter/material.dart';
import 'package:islami_c13_sun/ui/model/sura.dart';
import 'package:islami_c13_sun/ui/model/sura_details_args.dart';
import 'package:islami_c13_sun/ui/screens/sura_details_screen/sura_details.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/asset_manager.dart';

class SuraNameRow extends StatelessWidget {
  final Sura sura;
  final int index;

  const SuraNameRow({super.key, required this.index, required this.sura});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SuraDetails.routeName,
            arguments: SuraDetailsArgs(
                nameAr: sura.nameAr,
                nameEn: sura.nameEn,
                fileName: sura.fileName));
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
            "${index + 1}",
            style: TextStyle(
                color: AppColors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ));
  }
}
