import 'package:campro/utils/custom_widget/my_color.dart';
import 'package:campro/utils/custom_widget/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/Fonts/AppDimensions.dart';
import '../../utils/Widgets/AppButton.dart';
import '../../utils/Widgets/AppText.dart';
import 'camera_setting_controller.dart';


class InstallationGuide extends StatelessWidget {
  const InstallationGuide({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final CameraSettingController controller = Get.put(CameraSettingController());

   // final controller = Get.put(InstallationGuideController());

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
          text: MyStrings.installationguide.tr ,
          size: AppDimensions.FONT_SIZE_16,
          fontWeight: FontWeight.w600,
          color: MyColor.primaryColor,
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: MyColor.transparentColor,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // PageView
            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                itemCount: controller.guideSteps.length,
                onPageChanged: controller.onPageChanged,
                itemBuilder: (context, index) {
                  final step = controller.guideSteps[index];
                  return Column(
                    children: [
                      Container(
                        height: Get.height *0.5,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      const SizedBox(height: 10),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          step["note"]!,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          step["instruction"]!,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // Dots indicator
            Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                controller.guideSteps.length,
                    (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: 12,
                      height: 5,
                  decoration: BoxDecoration(
                    color: controller.currentPage.value == index
                        ? Colors.red
                        : Colors.grey.shade400,
                   // shape: BoxShape.circle,
                  ),
                ),
              ),
            )),

            const SizedBox(height: 20),

            // Next button
            AppButton(
              buttonName: MyStrings.next.tr,
              buttonColor: MyColor.secondaryColor,
              textColor: MyColor.colorWhite,
              textSize: 16,
              fontWeight: FontWeight.w500,
              hasShadow: false,
              buttonWidth: double.infinity,
              onTap:  () {},
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
