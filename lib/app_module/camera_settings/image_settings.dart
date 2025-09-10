import 'package:campro/app_module/camera_settings/camera_setting_controller.dart';
import 'package:campro/utils/custom_widget/my_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/Fonts/AppDimensions.dart';
import '../../utils/Paddings/AppPaddings.dart';
import '../../utils/Widgets/AppText.dart';
import '../../utils/custom_widget/strings.dart';
import '../qr_scanner/qr_scanner_view.dart';
import 'anti_flicker_setting.dart';

class ImageSettings extends StatelessWidget {
  ImageSettings({Key? key}) : super(key: key);

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
        title: AppText(
          text: MyStrings.imagesettings.tr,
          size: AppDimensions.FONT_SIZE_16,
          fontWeight: FontWeight.w600,
          color: MyColor.primaryColor,
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: MyColor.transparentColor,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: AppPaddings.defaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Anti-flicker tile
            GestureDetector(
              onTap: () {
                Get.to(() =>  AntiFlickerSetting());
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                decoration: BoxDecoration(
                  color: MyColor.colorWhite,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 2,
                      offset: const Offset(2, 2),
                    ),
                  ],
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: MyStrings.antiflickersetting.tr,
                      size: AppDimensions.FONT_SIZE_14,
                      fontWeight: FontWeight.w500,
                      color: MyColor.primaryColor,
                    ),
                    Icon(Icons.chevron_right, color: MyColor.primaryColor),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Choose Mode card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: MyColor.colorWhite,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 2,
                    offset: const Offset(2, 2),
                  ),
                ],
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: MyStrings.choosemode.tr,
                    size: AppDimensions.FONT_SIZE_14,
                    fontWeight: FontWeight.w500,
                    color: MyColor.primaryColor,
                  ),
                  const SizedBox(height: 16),

                  // Radio options with Obx
                Column(
                    children: [
                      _buildRadioOption(
                        value: "automatic",
                        title: "Automatic: Automatically switch Day/Night Mode",
                        description:
                        "Automatic - Allow the camera to control the infrared filter based on the amount of light in the scene.",
                      ),
                      const Divider(),
                      _buildRadioOption(
                        value: "day",
                        title: "Day Mode: Stream only in color",
                        description:
                        "Day Mode - The camera will only stream in color. This mode is not suitable for use at night without lighting.",
                      ),
                      const Divider(),
                      _buildRadioOption(
                        value: "night",
                        title: "Night Mode: Stream in black and white",
                        description:
                        "Night Mode - The camera will only stream in black and white. It is recommended for use during the day or in a well-lit environment.",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRadioOption({
    required String value,
    required String title,
    required String description,
  }) {
    return InkWell(
      onTap: () => c.changeMode(value),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Texts
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: title,
                  size: AppDimensions.FONT_SIZE_14,
                  fontWeight: FontWeight.w500,
                  color: MyColor.primaryColor,
                ),
                const SizedBox(height: 4),
                AppText(
                  text: description,
                  size: AppDimensions.FONT_SIZE_12,
                  fontWeight: FontWeight.w400,
                  color: MyColor.primaryColor,
                ),
              ],
            ),
          ),
          // check button
          Obx(() => Checkbox(
            value: c.selectedMode.value == value, // Compare with current selected mode
            onChanged: (val) {
              if (val != null && val) {
                c.changeMode(value); // Only change mode when checked (val is true)
              }
            },
            shape: const CircleBorder(),
            side: const BorderSide(
              color: Colors.grey,
              width: 1.5,
            ),
            activeColor: MyColor.primaryColor, // Use your app's primary color
            checkColor: Colors.white,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          )),

        ],
      ),
    );
  }
}
