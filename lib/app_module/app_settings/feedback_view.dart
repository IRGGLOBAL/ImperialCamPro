import 'package:campro/app_module/camera_settings/camera_setting_controller.dart';
import 'package:campro/utils/custom_widget/my_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/Fonts/AppDimensions.dart';
import '../../utils/Paddings/AppPaddings.dart';
import '../../utils/Widgets/AppButton.dart';
import '../../utils/Widgets/AppText.dart';
import '../../utils/custom_widget/strings.dart';
import '../manually_enter_camera/manual_entry.dart';


class FeedbackView extends StatelessWidget {
  FeedbackView({Key? key}) : super(key: key);

  final CameraSettingController c = Get.put(CameraSettingController());

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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AppText(
              text: MyStrings.feedbackrecord.tr,
              size: AppDimensions.FONT_SIZE_16,
              fontWeight: FontWeight.w600,
              color: MyColor.primaryColor,
            ),

            AppText(
              text: MyStrings.processing.tr,
              size: AppDimensions.FONT_SIZE_12,
              fontWeight: FontWeight.w500,
              color: MyColor.secondaryColor,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: MyColor.transparentColor,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          // This will push the content to center
          const Spacer(),

          // Centered content
          SingleChildScrollView(
            padding: AppPaddings.defaultPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                AppText(
                  text: MyStrings.nofeedbackrecordedatthistime.tr,
                  size: AppDimensions.FONT_SIZE_14,
                  fontWeight: FontWeight.w500,
                  color: MyColor.primaryColor,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),

          // This will push the button to bottom
          const Spacer(),

          // Button at the bottom
          Padding(
            padding: const EdgeInsets.all(16),
            child: AppButton(
              buttonName: MyStrings.sendusfeedback.tr,
              buttonColor: MyColor.secondaryColor,
              textColor: Colors.white,
              textSize: 16,
              fontWeight: FontWeight.w500,
              hasShadow: false,
              onTap: () {
                Get.to(ManualEntry());
              },
              elevation: 0,
              borderWidth: 0,
              isCenter: true,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

}
