import 'package:campro/app_module/app_settings/family_management_view.dart';
import 'package:campro/app_module/app_settings/select_devices_view.dart';
import 'package:campro/app_module/app_settings/share_devices_view.dart';
import 'package:campro/utils/custom_widget/my_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../utils/Fonts/AppDimensions.dart';
import '../../utils/Images/my_images.dart';
import '../../utils/Widgets/AppText.dart';
import '../../utils/custom_widget/strings.dart';
import '../camera_settings/general_settings_view.dart';
import 'album_settings_view.dart';
import 'app_general_settings.dart';
import 'help_settings_view.dart';
import 'my_service_view.dart';

class AppSettings extends StatelessWidget {
  const AppSettings({Key? key}) : super(key: key);

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
          text: "${MyStrings.settings.tr}",
          size: AppDimensions.FONT_SIZE_16,
          fontWeight: FontWeight.w600,
          color: MyColor.primaryColor,
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: MyColor.transparentColor,

        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //const SizedBox(height: 20),

            // Profile Section
            Row(
              children: [
                const CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.red,
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: "M.Burair",
                      size: AppDimensions.FONT_SIZE_16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    const SizedBox(height: 4),
                    AppText(
                      text: MyStrings.email.tr,
                      size: AppDimensions.FONT_SIZE_12,
                      fontWeight: FontWeight.w400,
                      color: MyColor.colorGrey,
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Cloud Storage Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: MyColor.colorWhite,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 3,
                    spreadRadius: 0,
                    offset: const Offset(2, 2),
                  ),
                ],
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    MyImages.cloudsettings,
                    width: 32,
                    height: 32,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: "${MyStrings.cloudstorage.tr}",
                          size: AppDimensions.FONT_SIZE_14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                        const SizedBox(height: 4),
                        AppText(
                          text:
                          "${MyStrings.annualdaycyclestorage.tr}",
                          size: AppDimensions.FONT_SIZE_11,
                          fontWeight: FontWeight.w400,
                          color: MyColor.hinttext,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 6),
                        AppText(
                          text: "${MyStrings.canbind.tr} 3 ${MyStrings.devices.tr}",
                          size: AppDimensions.FONT_SIZE_11,
                          fontWeight: FontWeight.w500,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.chevron_right, color: Colors.black),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // List of Settings
            Container(
                decoration: BoxDecoration(
                  color: MyColor.colorWhite,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: _settingsTile(MyImages.aianalysis,"${MyStrings.aiintelligentanalys.tr}",
                  onTap: () {Get.to(SelectDevicesView());},)),

             SizedBox(height: 10),

            Container(
                decoration: BoxDecoration(
                  color: MyColor.colorWhite,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: _settingsTile(MyImages.fourgdata, "${MyStrings.fourgdataplan.tr}",
                  onTap: () {Get.to(SelectDevicesView());},)),

            SizedBox(height: 10),

            Container(
                decoration: BoxDecoration(
                  color: MyColor.colorWhite,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: _settingsTile(MyImages.familymanagement, "${MyStrings.myservice.tr}",
                  onTap: () {Get.to(MyServiceView());},)),

            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: MyColor.colorWhite,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                children: [
                  _settingsTile(MyImages.familymanagement, "${MyStrings.familymanagement.tr}",
                    onTap: () {Get.to(FamilyManagementView());},),
                  _settingsTile(MyImages.sharesettings, "${MyStrings.share.tr}",
                    onTap: () {Get.to(ShareDevicesView());},),
                  _settingsTile(MyImages.albumsettings, "${MyStrings.album.tr}",
                    onTap: () {Get.to(AlbumSettingsView());},),
                  _settingsTile(MyImages.helpsetting, "${MyStrings.help.tr}",
                    onTap: () {Get.to(HelpSettingsView());},),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
                decoration: BoxDecoration(
                  color: MyColor.colorWhite,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: _settingsTile(MyImages.generalsettings, "${MyStrings.settings.tr}",
                  onTap: () {Get.to(AppGeneralSettings());},)),
            SizedBox(height: 30),
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
