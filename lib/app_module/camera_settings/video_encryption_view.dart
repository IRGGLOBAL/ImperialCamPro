import 'package:campro/app_module/camera_settings/camera_setting_controller.dart';
import 'package:campro/utils/custom_widget/my_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../utils/Fonts/AppDimensions.dart';
import '../../utils/Images/my_images.dart';
import '../../utils/Widgets/AppText.dart';
import '../../utils/custom_widget/strings.dart';

class VideoEncryptionView extends StatelessWidget {
  VideoEncryptionView({Key? key}) : super(key: key);

  final CameraSettingController controller = Get.put(CameraSettingController());

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
          text: "${MyStrings.wirelesschime.tr}",
          size: AppDimensions.FONT_SIZE_16,
          fontWeight: FontWeight.w600,
          color: MyColor.primaryColor,
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: MyColor.transparentColor,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: MyColor.colorWhite,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 2,
                    spreadRadius: 0,
                    offset: Offset(2, 2),
                  ),
                ],
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: AppText(
                      text: MyStrings.chimereminder.tr,
                      size: AppDimensions.FONT_SIZE_14,
                      fontWeight: FontWeight.w500,
                      color: MyColor.primaryColor,
                    ),
                  ),
                  // Switch with Obx
                  Obx(() => Transform.scale(
                    scale: 0.7,
                    child: Switch(
                      value: controller.receiveAlarmNotifications.value,
                      onChanged: (val) {
                        controller.toggleNotification(val);
                      },
                      activeColor: MyColor.secondaryColor,
                      inactiveTrackColor: Colors.grey.shade400,
                      activeTrackColor: MyColor.secondaryColor,
                      thumbColor: MaterialStateProperty.all(Colors.white),
                      trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
                    ),
                  )),
                ],
              ),
            ),
            SizedBox(height: 10,),

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
                    text: MyStrings.erncryptionnotes.tr,
                    size: AppDimensions.FONT_SIZE_14,
                    fontWeight: FontWeight.w500,
                    color: MyColor.primaryColor,
                  ),
                  const SizedBox(height: 16),

                  // Radio options with Obx
                  Column(
                    children: [
                      _buildRadioOption(
                        title: MyStrings.toprevieworplaybackvideo.tr, // Only title remains
                        svgAssetPath: MyImages.preview, // Your SVG asset path
                      ),
                      const SizedBox(height: 10),
                      Divider(),
                      const SizedBox(height: 10),

                      _buildRadioOption(
                        title: MyStrings.tocheckencryptedalarmpictures.tr,
                        svgAssetPath: MyImages.alarmpicture,
                      ),
                      const SizedBox(height: 16),

                      AppText(
                        text: MyStrings.informrisk.tr,
                        size: AppDimensions.FONT_SIZE_14,
                        fontWeight: FontWeight.w500,
                        color: MyColor.primaryColor,
                      ),
                      const SizedBox(height: 16),

                      _buildRadioOption(
                        title: MyStrings.forthesecurityandreliability.tr,
                        svgAssetPath: MyImages.securityreliablity,
                      ),
                      const SizedBox(height: 16),
                      _buildRadioOption(
                        title: MyStrings.iflogoutoruninstalltheapp.tr,
                        svgAssetPath: MyImages.cleardata,
                      ),
                      const SizedBox(height: 16),
                      _buildRadioOption(
                        title: MyStrings.ifthedevicepasswordcannotberetrieved.tr,
                        svgAssetPath: MyImages.passwordlock,
                      )

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
    required String title,
    required String svgAssetPath,
  }) {
    return InkWell(
      onTap: () => controller.changeMode(title),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            svgAssetPath,
            width: 18,
            height: 18,
            // color: Colors.white, // Icon color when selected
          ),
          SizedBox(width: 12),
          // Text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: title,
                  size: AppDimensions.FONT_SIZE_12,
                  fontWeight: FontWeight.w500,
                  color: MyColor.primaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}