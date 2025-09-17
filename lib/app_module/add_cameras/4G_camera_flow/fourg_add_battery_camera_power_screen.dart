import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:campro/utils/custom_widget/my_color.dart';
import 'package:campro/utils/Fonts/AppDimensions.dart';
import 'package:campro/utils/Paddings/AppPaddings.dart';
import 'package:campro/utils/Widgets/AppText.dart';
import 'package:campro/utils/Widgets/AppButton.dart';
import 'package:campro/utils/custom_widget/strings.dart';
import '../../manually_enter_camera/manual_entry_controller.dart';


class FourgAddBatteryUnifiedScreen extends StatelessWidget {
  FourgAddBatteryUnifiedScreen({super.key});

  final ManualEntryController controller = Get.put(ManualEntryController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final currentScreen = controller.screens[controller.currentIndex.value];

      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          surfaceTintColor: MyColor.transparentColor,
          title: AppText(
            text: currentScreen['title'],
            size: AppDimensions.FONT_SIZE_16,
            fontWeight: FontWeight.w600,
            color: MyColor.primaryColor,
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => controller.goToPreviousScreen(),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.volume_up, color: Colors.black),
            ),
          ],
        ),
        body: Padding(
          padding: AppPaddings.defaultPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // Image placeholder
              Container(
                height: currentScreen['imageHeight'],
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),

              const SizedBox(height: 24),

              // Scrollable content area
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Main title (if exists)
                      if (currentScreen['mainText'] != null && currentScreen['mainText'].isNotEmpty)
                        AppText(
                          text: currentScreen['mainText'],
                          size: AppDimensions.FONT_SIZE_16,
                          fontWeight: FontWeight.w600,
                          color: MyColor.primaryColor,
                          textAlign: TextAlign.center,
                        ),

                      if (currentScreen['mainText'] != null && currentScreen['mainText'].isNotEmpty)
                        const SizedBox(height: 12),

                      // Sub text or bullet points
                      if (currentScreen['showBullets'] && currentScreen['bullets'] != null)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (var bullet in currentScreen['bullets'])
                              Padding(
                                padding: const EdgeInsets.only(bottom: 6),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("• ",
                                        style: TextStyle(fontSize: 16, color: MyColor.primaryColor)),
                                    Expanded(
                                      child: Text(
                                        bullet,
                                        style: const TextStyle(fontSize: 14, color: Colors.black87),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        )
                      else if (currentScreen['subText'] != null && currentScreen['subText'].isNotEmpty)
                        AppText(
                          text: currentScreen['subText'],
                          size: AppDimensions.FONT_SIZE_12,
                          fontWeight: FontWeight.w500,
                          color: MyColor.primaryColor,
                          textAlign: TextAlign.start,
                        ),

                      // Help text with icon
                      if (currentScreen['showHelpText'] && currentScreen['helpText'] != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                currentScreen['helpText'],
                                style: TextStyle(
                                  color: MyColor.secondaryColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Icon(Icons.help_outline, color: MyColor.secondaryColor, size: 18),
                            ],
                          ),
                        ),


                    ],
                  ),
                ),
              ),

              // Radio option
              if (currentScreen['showRadio'] && currentScreen['radioText'] != null)
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Row(
                    children: [
                      Radio(
                        value: true,
                        groupValue: true,
                        onChanged: (val) {},
                        activeColor: MyColor.secondaryColor,
                      ),
                      Expanded(
                        child: Text(
                          currentScreen['radioText'],
                          style: const TextStyle(fontSize: 14, color: Colors.black87),
                        ),
                      )
                    ],
                  ),
                ),
              // Next Button (stays at bottom)
              AppButton(
                buttonName: MyStrings.next.tr,
                buttonColor: MyColor.secondaryColor,
                textColor: Colors.white,
                textSize: 16,
                fontWeight: FontWeight.w500,
                hasShadow: false,
                onTap: () {
                  if (currentScreen['nextScreen'] != null) {
                    currentScreen['nextScreen']();
                  } else {
                    controller.goToNextScreen();
                  }
                },
                elevation: 0,
                borderWidth: 0,
                isCenter: true,
              ),

              const SizedBox(height: 20),
            ],
          ),
        )
      );
    });
  }
}

// class FourgAddBatteryCameraPowerScreen extends StatelessWidget {
//   FourgAddBatteryCameraPowerScreen({super.key,
//    });
//
//   final ManualEntryController manualEntryController = Get.find<ManualEntryController>();
//
//    @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         surfaceTintColor: MyColor.transparentColor,
//         title: AppText(
//           text: MyStrings.addbatterycamera.tr,
//           size: AppDimensions.FONT_SIZE_16,
//           fontWeight: FontWeight.w600,
//           color: MyColor.primaryColor,
//         ),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
//           onPressed: () => Get.back(),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon:  Icon(Icons.volume_up, color: Colors.black),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: AppPaddings.defaultPadding,
//         child: Column(
//           children: [
//             const SizedBox(height: 20),
//             /// Grey Box (Image placeholder)
//             Container(
//               height: 180,
//               width: double.infinity,
//               color: Colors.grey.shade300,
//             ),
//
//             const SizedBox(height: 24),
//
//             /// Bold Title
//             AppText(
//               text: MyStrings.fourgcameratitle.tr,
//               size: AppDimensions.FONT_SIZE_16,
//               fontWeight: FontWeight.w600,
//               color: MyColor.primaryColor,
//               textAlign: TextAlign.center,
//             ),
//
//             const SizedBox(height: 12),
//
//             /// Sub Text
//             AppText(
//               text: MyStrings.fourgcamerasubtitle.tr,
//               //text: texts[1],
//               size: AppDimensions.FONT_SIZE_12,
//               fontWeight: FontWeight.w500,
//               color: MyColor.primaryColor,
//               textAlign: TextAlign.start,
//             ),
//
//             const Spacer(),
//
//             /// Next Button
//             AppButton(
//               buttonName: MyStrings.next.tr,
//               buttonColor: MyColor.secondaryColor,
//               textColor: Colors.white,
//               textSize: 16,
//               fontWeight: FontWeight.w500,
//               hasShadow: false,
//               onTap: () {
//                 Get.to(FourgAddBatteryCameraStartDeviceScreen());
//
//
//                 },
//               elevation: 0,
//               borderWidth: 0,
//               isCenter: true,
//             ),
//
//             const SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }
//
//
// }
