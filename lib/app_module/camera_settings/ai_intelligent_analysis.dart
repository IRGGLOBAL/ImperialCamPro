import 'package:campro/utils/custom_widget/my_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../utils/Fonts/AppDimensions.dart';
import '../../utils/Images/my_images.dart';
import '../../utils/Widgets/AppText.dart';
import '../../utils/custom_widget/strings.dart';
import 'cloud_storage_setting.dart';

class AiIntelligentAnalysis extends StatefulWidget {
  const AiIntelligentAnalysis({Key? key}) : super(key: key);

  @override
  State<AiIntelligentAnalysis> createState() => _AiIntelligentAnalysisState();
}

class _AiIntelligentAnalysisState extends State<AiIntelligentAnalysis> {
  // State for toggles
  Map<String, bool> toggles = {
    "${MyStrings.people.tr}": true,
    "${MyStrings.pet.tr}": true,
    "${MyStrings.vehicles.tr}": true,
    "${MyStrings.package.tr}": true,
    "${MyStrings.wildanimals.tr}": true,
    "${MyStrings.birds.tr}": true,
  };

  Map<String, String> toggleIcons = {
    "${MyStrings.people.tr}": MyImages.people,
    "${MyStrings.pet.tr}": MyImages.pet,
    "${MyStrings.vehicles.tr}": MyImages.vehicle,
    "${MyStrings.package.tr}": MyImages.package,
    "${MyStrings.wildanimals.tr}": MyImages.wild_animal,
    "${MyStrings.birds.tr}": MyImages.bird,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: AppText(
          text: "${MyStrings.aiintelligentanalys.tr}",
          size: AppDimensions.FONT_SIZE_16,
          fontWeight: FontWeight.w600,
          color: MyColor.primaryColor,
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: MyColor.transparentColor,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric( vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Banner
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: MyColor.secondaryColor,
                //borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                children: [
                  Expanded(
                    child:
                    AppText(
                      text: MyStrings.youhaveactivatedaiintelligentservice.tr,
                      size: AppDimensions.FONT_SIZE_12,
                      fontWeight: FontWeight.w400,
                      color: MyColor.colorWhite,
                      //textAlign: TextAlign.center,
                    ),

                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Get.to(() => CloudStorageSetting());},
                    child:  Container(
                        padding: const EdgeInsets.symmetric( vertical: 2,horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                           Radius.circular(5),
                           ),
                          border: Border.all(color: MyColor.primaryColor.withValues(alpha: 0.1) , width: 1),

                        ),
                        child: AppText(
                          text: MyStrings.check.tr,
                          size: AppDimensions.FONT_SIZE_12,
                          fontWeight: FontWeight.w500,
                          color: MyColor.primaryColor,
                          textAlign: TextAlign.center,
                        ),
                        //Text("Check")
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16,),
              child: AppText(
                text:  MyStrings.imagedetection.tr,
                size: AppDimensions.FONT_SIZE_14,
                fontWeight: FontWeight.bold,
                color: MyColor.primaryColor,
              ),
            ),
            const SizedBox(height: 16),
            // Grid of toggles
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16,),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.5,
                children: toggles.keys.map((title) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              toggleIcons[title] ?? MyImages.album,
                              width: 24,
                              height: 24,
                            ),
                            // Switch
                            Transform.scale(
                              scale: 0.7, // Adjust this value to change size (0.5 = 50%, 1.0 = 100%)
                              child: Switch(
                                value: toggles[title]!,
                                onChanged: (val) {
                                  setState(() {
                                    toggles[title] = val;
                                  });
                                },
                                activeColor: MyColor.secondaryColor,
                                inactiveTrackColor: Colors.grey.shade400,
                                // Add any other decorations you want to keep:
                                activeTrackColor:  MyColor.secondaryColor, // Example additional decoration
                                thumbColor: MaterialStateProperty.all(Colors.white), // Example
                                trackOutlineColor: MaterialStateProperty.all(Colors.transparent), // Example
                              ),
                            ),
                          ],
                        ),
                         SizedBox(height: 10),
                        // Text
                        Expanded(
                          child:
                          AppText(
                            text:  title,
                            size: AppDimensions.FONT_SIZE_14,
                            fontWeight: FontWeight.w500,
                            color: MyColor.primaryColor,
                            //textAlign: TextAlign.center,
                          ),

                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
           // const SizedBox(height: 20),
            // Bottom text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  AppText(
                    text:  MyStrings.mattersneedattention.tr,
                    size: AppDimensions.FONT_SIZE_14,
                    fontWeight: FontWeight.bold,
                    color: MyColor.primaryColor,
                    //textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 6),
                  AppText(
                    text:  MyStrings.mattersneedattentiondetail.tr,
                    size: AppDimensions.FONT_SIZE_13,
                    fontWeight: FontWeight.w400,
                    color: MyColor.primaryColor,
                   // height: 1.4,
                    //textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
