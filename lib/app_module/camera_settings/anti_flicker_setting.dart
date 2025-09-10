import 'package:campro/app_module/camera_settings/camera_setting_controller.dart';
import 'package:campro/utils/custom_widget/my_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/Fonts/AppDimensions.dart';
import '../../utils/Paddings/AppPaddings.dart';
import '../../utils/Widgets/AppText.dart';
import '../../utils/custom_widget/strings.dart';
import '../qr_scanner/qr_scanner_view.dart';

class AntiFlickerSetting extends StatelessWidget {
  AntiFlickerSetting({Key? key}) : super(key: key);

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
          text: MyStrings.antiflickersetting.tr,
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
            AppText(
              text: MyStrings.antiflickerhzselection.tr,
              size: AppDimensions.FONT_SIZE_14,
              fontWeight: FontWeight.w500,
              color: MyColor.primaryColor,
            ),

            const SizedBox(height: 16),

            // Choose Mode card
            Container(
              padding: const EdgeInsets.all(10),
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

                  // Radio options with Obx
                  Column(
                    children: [

                      _buildRadioOption(
                        value: "",
                        title: "60 Hz",

                      ),
                      const Divider(),
                      _buildRadioOption(
                        value: "",
                        title: "50Hz",

                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            AppText(
              text: MyStrings.pleaseselectafrequencythat.tr,
              size: AppDimensions.FONT_SIZE_14,
              fontWeight: FontWeight.w500,
              color: MyColor.primaryColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRadioOption({
    required String value,
    required String title,
  }) {
    return InkWell(
      onTap: () {},
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
