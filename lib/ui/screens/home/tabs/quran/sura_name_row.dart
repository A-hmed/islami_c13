import 'package:flutter/material.dart';
import 'package:islami_c13_sun/ui/utils/constants.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/asset_manager.dart';

class SuraNameRow extends StatelessWidget {
  final int index;

  const SuraNameRow({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
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
                "todo next session",
                style: TextStyle(color: AppColors.white, fontSize: 20),
              ),
              Text(
                "${Constants.versesNumber[index]} verses",
                style: TextStyle(color: AppColors.white, fontSize: 14),
              ),
            ],
          ),
        ),
        Text(
          "${Constants.suraNames[index]}",
          style: TextStyle(color: AppColors.white, fontSize: 20),
        )
      ],
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
