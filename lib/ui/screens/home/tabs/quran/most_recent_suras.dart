import 'package:flutter/material.dart';
import 'package:islami_c13_sun/ui/utils/app_colors.dart';
import 'package:islami_c13_sun/ui/utils/app_styles.dart';
import 'package:islami_c13_sun/ui/utils/asset_manager.dart';

class MostRecentSuras extends StatelessWidget {
  const MostRecentSuras({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Most recently",
            textAlign: TextAlign.start,
            style: AppStyles.whiteBold16,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width * .7,
                    height: MediaQuery.of(context).size.height * .5,
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Name en",
                                style: AppStyles.blackBold24,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Name ar",
                                style: AppStyles.blackBold24,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "11 verses",
                                style: AppStyles.blackBold14,
                              )
                            ],
                          ),
                        ),
                        Image.asset(AssetsManager.recentSuraImage)
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
