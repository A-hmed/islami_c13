import 'package:flutter/material.dart';
import 'package:islami_c13_sun/ui/model/hadeth.dart';
import 'package:islami_c13_sun/ui/utils/app_colors.dart';
import 'package:islami_c13_sun/ui/utils/app_styles.dart';
import 'package:islami_c13_sun/ui/utils/asset_manager.dart';

class HadethDetails extends StatefulWidget {
  static const routeName = "hadeth_details";

  const HadethDetails({super.key});

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Hadeth;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(AssetsManager.titleLeftBg),
                    Image.asset(AssetsManager.titleRightBg),
                  ],
                ),
                Text(
                  args.title,
                  style: AppStyles.primaryBold24,
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Text(
                    args.content,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    style: AppStyles.primaryBold20,
                  ),
                ),
              ),
            ),
            Image.asset(AssetsManager.suraContentBg)
          ],
        ),
      ),
    );
  }
}
