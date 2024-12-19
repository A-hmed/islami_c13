import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c13_sun/ui/model/hadeth.dart';
import 'package:islami_c13_sun/ui/screens/hadeth_details/hadeth_details.dart';
import 'package:islami_c13_sun/ui/utils/app_colors.dart';
import 'package:islami_c13_sun/ui/utils/app_styles.dart';
import 'package:islami_c13_sun/ui/utils/asset_manager.dart';

class AhadethTab extends StatefulWidget {
  const AhadethTab({super.key});

  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<Hadeth> ahadeth = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readHadethFile();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AssetsManager.ahadethBackground),
              fit: BoxFit.fill)),
      child: Column(
        children: [
          Image.asset(AssetsManager.islamiLogo),
          Expanded(
              child: ahadeth.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : CarouselSlider.builder(
                      itemCount: ahadeth.length,
                      itemBuilder: (context, index, _) {
                        return buildHadethWidget(index);
                      },
                      options: CarouselOptions(
                        enlargeCenterPage: true,
                        height: double.infinity,
                      )))
        ],
      ),
    );
  }

  Widget buildHadethWidget(int index) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, HadethDetails.routeName,
            arguments: ahadeth[index]);
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(bottom: 20),
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.primary, borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      AssetsManager.titleLeftBg,
                      color: Colors.black,
                    ),
                    Image.asset(
                      AssetsManager.titleRightBg,
                      color: Colors.black,
                    ),
                  ],
                ),
                Text(
                  ahadeth[index].title,
                  style: AppStyles.blackBold24,
                ),
              ],
            ),
            Expanded(
              child: Text(
                ahadeth[index].content,
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: AppStyles.blackBold16,
              ),
            )
          ],
        ),
      ),
    );
  }

  void readHadethFile() async {
    String hadethFileContent =
        await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> ahadethAsStrings = hadethFileContent.split("#\r\n");
    for (int i = 0; i < ahadethAsStrings.length; i++) {
      String hadethString = ahadethAsStrings[i];
      List<String> hadethLines = hadethString.split("\n");
      String title = hadethLines[0];

      ///Title
      hadethLines.removeAt(0);

      ///Remove title from hadeth
      String content = hadethLines.join();

      /// Rest of the hadeth lines is the content
      var hadeth = Hadeth(title, content);
      ahadeth.add(hadeth);
    }
    setState(() {});
  }
}
