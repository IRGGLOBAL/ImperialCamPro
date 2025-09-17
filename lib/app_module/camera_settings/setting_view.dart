import 'package:campro/app_module/camera_settings/recording_management_view.dart';
import 'package:campro/app_module/camera_settings/sound_settings_view.dart';
import 'package:campro/app_module/camera_settings/video_encryption_view.dart';
import 'package:campro/utils/custom_widget/my_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/Fonts/AppDimensions.dart';
import '../../utils/Images/my_images.dart';
import '../../utils/Widgets/AppButton.dart';
import '../../utils/Widgets/AppText.dart';
import '../../utils/custom_widget/strings.dart';
import '../device_information/device_information.dart';
import 'advanced_settings.dart';
import 'ai_intelligent_analysis.dart';
import 'alarm_management_view.dart';
import 'chime_settings.dart';
import 'cloud_storage_setting.dart';
import 'device_share_view.dart';
import 'general_settings_view.dart';
import 'image_settings.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

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
          text: "${MyStrings.camerasettings.tr}",
          size: AppDimensions.FONT_SIZE_16,
          fontWeight: FontWeight.w600,
          color: MyColor.primaryColor,
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: MyColor.transparentColor,

        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Device Info Section
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: (){
               Get.to(DeviceInformation()) ;
              },
              child: Container(
                padding: const EdgeInsets.all(16),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        AppText(
                          text: "868 ${MyStrings.backdoor.tr} 2",
                          size: AppDimensions.FONT_SIZE_12, // or use 14 directly
                          fontWeight: FontWeight.w500,
                          color: MyColor.colorGrey,
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 2),
                        AppText(
                          text: "${MyStrings.signalstrength.tr} 67%",
                          size: AppDimensions.FONT_SIZE_12, // or use 14 directly
                          fontWeight: FontWeight.w500,
                          color: MyColor.colorGrey,
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 2),
                        Row(
                          children: [
                            AppText(
                              text: "${MyStrings.electricquantity.tr}",
                              size: AppDimensions.FONT_SIZE_12,
                              fontWeight: FontWeight.w500,
                              color: MyColor.colorGrey,
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(width: 5),
                            SvgPicture.asset(
                              MyImages.electricquantity,
                              height: 12,
                            ),
                          ],
                        ),
                        SizedBox(height: 2),
                        AppText(
                          text: "${MyStrings.timezone.tr} America/New_York",
                          size: AppDimensions.FONT_SIZE_12, // or use 14 directly
                          fontWeight: FontWeight.w500,
                          color: MyColor.colorGrey,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.red,
                        ),
                        Icon(Icons.chevron_right, color: MyColor.primaryColor),
                      ],
                    ),

                  ],
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Grid Options
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.9,
              children: [
                _gridItem(MyImages.cloudstorage, MyStrings.cloudstorageservice.tr,
                    onTap: () {
                      Get.to(CloudStorageSetting());
                    },
                ),
                _gridItem(MyImages.aiintelligent, MyStrings.aiintelligentanalysis.tr,
                  onTap: () {Get.to(AiIntelligentAnalysis());},),
                _gridItem(MyImages.alarmmanagement, MyStrings.alarmmanagement.tr,
                  onTap: () {Get.to(AlarmManagementView());},),
                _gridItem(MyImages.deviceshare, MyStrings.deviceshare.tr,
                  onTap: () {Get.to(DeviceShareView());},),
              ],
            ),

            const SizedBox(height: 10),

            // Settings List
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
              child: Column(
                children: [
                  _settingsTile(MyImages.imagesettings, MyStrings.imagesettings.tr,
                    onTap: () {Get.to(ImageSettings());},),
                  _settingsTile(MyImages.soundsettings, MyStrings.soundsettings.tr,
                    onTap: () {Get.to(SoundSettingsView());},),
                  _settingsTile(MyImages.chimesettings, MyStrings.chimesettings.tr,
                    onTap: () {Get.to(ChimeSettings());},),
                ],
              ),
            ),
            const SizedBox(height: 10),
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
              child: Column(
                children: [
                  _settingsTile(MyImages.voicemessage, MyStrings.voicemessage.tr,
                    onTap: () {},),
                  _settingsTile(MyImages.videoencryption, MyStrings.videoencryption.tr,
                    onTap: () {Get.to(VideoEncryptionView());},),
                  _settingsTile(MyImages.recordingmanagement, MyStrings.recordingmanagement.tr,
                    onTap: () {Get.to(RecordingManagementView());},),

                ],
              ),
            ),
            const SizedBox(height: 10),
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
              child: Column(
                children: [
                  _settingsTile(MyImages.generalsettings, MyStrings.generalsettings.tr,
                    onTap: () {Get.to(GeneralSettingsView());},),
                  _settingsTile(MyImages.advancedservice, MyStrings.advancedservice.tr,
                    onTap: () {Get.to(AdvancedSettings());},),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Buttons
            AppButton(
              buttonName: MyStrings.restartdevice.tr,
              buttonColor: Colors.grey,
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

            const SizedBox(height: 10),

            AppButton(
              buttonName: MyStrings.deletedevice.tr,
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
          ],
        ),
      ),
    );
  }

  // Reusable Grid Item
  static Widget _gridItem( String svgPath, String title,{VoidCallback? onTap}) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Container(
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              svgPath,
              width: 25,
            ),
            const SizedBox(height: 5),
            AppText(
              text:  title,
              size: AppDimensions.FONT_SIZE_12,
              fontWeight: FontWeight.w500,
              color: MyColor.colorGrey,
              overflow: TextOverflow.visible,
              //textAlign: TextAlign.center,
            ),

          ],
        ),
      ),
    );
  }

  // Reusable Settings Tile
  static Widget _settingsTile(String svgPath, String title,{VoidCallback? onTap}) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        child: Row(
          children: [
            // SVG Icon
            SvgPicture.asset(
              svgPath,
              width: 22,
                color: MyColor.primaryColor
            ),
            const SizedBox(width: 16), // Spacing between icon and text

            // Title text
            Expanded(
              child: AppText(
                text:   title,
                size: AppDimensions.FONT_SIZE_12, // or use 14 directly
                fontWeight: FontWeight.w500,
                color: MyColor.primaryColor,
               // textAlign: TextAlign.left,
              ),
            ),

            // Chevron icon
            Icon(Icons.chevron_right, color: MyColor.primaryColor),
          ],
        ),
      ),
    );
  }

}
