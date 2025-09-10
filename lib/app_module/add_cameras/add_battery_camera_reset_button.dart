import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:campro/utils/custom_widget/my_color.dart';
import 'package:campro/utils/Fonts/AppDimensions.dart';
import 'package:campro/utils/Paddings/AppPaddings.dart';
import 'package:campro/utils/Widgets/AppText.dart';
import 'package:campro/utils/Widgets/AppButton.dart';
import 'package:campro/utils/custom_widget/strings.dart';

import '../manually_enter_camera/manual_entry_controller.dart';
import 'add_battery_camera.dart';
import 'add_battery_camera_power_screen.dart';

class AddBatteryCameraResetButton extends StatelessWidget {
  final String category;
  final int screenIndex;
   AddBatteryCameraResetButton({super.key,
     required this.category,
     required this.screenIndex
     // this.index1=0,
     // this.index2=0
   });


  final ManualEntryController manualEntryController = Get.find<ManualEntryController>();
  //ManualEntryController manualEntryController=Get.find<ManualEntryController>();

 // int index1=0;
 // int index2=0;
  @override
  Widget build(BuildContext context) {

    // Get the screen data for this category
    final screenData = manualEntryController.screensData[category];
    //final screenKey = "screen$screenIndex"; // e.g., "screen2"
    final screenKey = "screen$screenIndex";
    final texts = screenData?[screenKey] ?? ["Title not found", "Subtitle not found"];
    final hasNextScreen = manualEntryController.hasNextScreen(category, screenIndex);


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: MyColor.transparentColor,
        title: AppText(
          text: MyStrings.addbatterycamera.tr,
          size: AppDimensions.FONT_SIZE_16,
          fontWeight: FontWeight.w600,
          color: MyColor.primaryColor,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon:  Icon(Icons.volume_up, color: Colors.black),
          ),
        ],
      ),

      body: Padding(
        padding: AppPaddings.defaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            /// Grey Box (Image placeholder)
            Container(
              height: 180,
              width: double.infinity,
              color: Colors.grey.shade300,
            ),

            const SizedBox(height: 24),

            /// Bold Title
            AppText(
              text: texts[0],
             // text: "${manualEntryController.screensData.toList()[index1][index2]!["screen2"][1]}",
              size: AppDimensions.FONT_SIZE_16,
              fontWeight: FontWeight.w600,
              color: MyColor.primaryColor,
              textAlign: TextAlign.start,
            ),

            const SizedBox(height: 12),

            /// Sub Text
            AppText(
              text: texts[1],
             // text: "${manualEntryController.screensData.toList()[index1][index2]!["screen2"][0]}",
              size: AppDimensions.FONT_SIZE_12,
              fontWeight: FontWeight.w500,
              color: MyColor.primaryColor,
              textAlign: TextAlign.start,
            ),

            const Spacer(),

            /// Next Button
            AppButton(
              buttonName: MyStrings.next.tr,
              buttonColor: MyColor.secondaryColor,
              textColor: Colors.white,
              textSize: 16,
              fontWeight: FontWeight.w500,
              hasShadow: false,
              onTap: () {
                if (manualEntryController.hasNextScreen(category, screenIndex)) {
                  // Check if we need to go to AddBatteryCameraPowerScreen or AddBatteryCameraResetButton
                  if (screenIndex % 2 == 0) {
                    // Even screen index (0, 2, 4...) - go to PowerScreen
                    Get.to(AddBatteryCameraPowerScreen(
                      category: category,
                      screenIndex: screenIndex + 1,
                    ));
                  } else {
                    // Odd screen index (1, 3, 5...) - go to ResetButton
                    Get.to(AddBatteryCameraResetButton(
                      category: category,
                      screenIndex: screenIndex + 1,
                    ));
                  }
                } else {
                  // If this is the last screen, go to final setup
                  Get.to(AddBatteryCamera());
                }
                // if (screenIndex < 2) {
                //   // If there's a next screen for this category
                //   Get.to(AddBatteryCameraResetButton(
                //     category: category,
                //     screenIndex: screenIndex + 1,
                //   ));
                // } else {
                //   // If this is the last screen, go to final setup
                //   Get.to(AddBatteryCamera());
                // }
               // Get.to(AddBatteryCamera());
              },
              elevation: 0,
              borderWidth: 0,
              isCenter: true,
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
