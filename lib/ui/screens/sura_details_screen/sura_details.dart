import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c13_sun/ui/model/sura_details_args.dart';
import 'package:islami_c13_sun/ui/utils/app_colors.dart';
import 'package:islami_c13_sun/ui/utils/app_styles.dart';
import 'package:islami_c13_sun/ui/utils/asset_manager.dart';
import 'package:islami_c13_sun/ui/utils/shared_prefs_utils.dart';
import 'package:provider/provider.dart';

class SuraDetails extends StatefulWidget {
  static const routeName = "sura_details";

  const SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  String suraContent = "";
  late RecentSurasProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context, listen: false);
    var args = ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs;
    if (suraContent.isEmpty) getSuraContent(args.fileName);
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        title: Text(
          args.nameEn,
          style: AppStyles.primaryBold20,
        ),
        backgroundColor: AppColors.black,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(
            args.nameAr,
            style: AppStyles.primaryBold24,
          ),
          suraContent.isEmpty
              ? Expanded(child: Center(child: CircularProgressIndicator()))
              : Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Text(
                        suraContent,
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
    );
  }

  Future getSuraContent(String fileName) async {
    //  "                   ahmed                ".trim() => "ahmed";
    Future<String> future = rootBundle.loadString("assets/files/$fileName");
    suraContent = await future;
    setState(() {});
    print(suraContent);
    List<String> suraLines = suraContent.trim().split("\n");
    for (int i = 0; i < suraLines.length; i++) {
      suraLines[i] += "[${i + 1}]";
    }
    suraContent = suraLines.join();
  }

  @override
  void dispose() {
    super.dispose();
    print(" _SuraDetailsState dispose");
    provider.refreshMostRecentSuras();
  }

  ///Dart is single thread language
  /// - Dart Isolates
}
