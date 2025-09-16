import 'package:campro/app_module/camera_settings/camera_setting_controller.dart';
import 'package:campro/utils/custom_widget/my_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/Fonts/AppDimensions.dart';
import '../../utils/Paddings/AppPaddings.dart';
import '../../utils/Widgets/AppText.dart';
import '../../utils/custom_widget/strings.dart';
import 'battery_management_view.dart';
import 'installation_guide.dart';


class GeneralSettingsView extends StatelessWidget {
  GeneralSettingsView({Key? key}) : super(key: key);

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
          text: MyStrings.generalsettings.tr,
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
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
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Get.to(() =>  InstallationGuide());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: MyStrings.installationguide.tr,
                      size: AppDimensions.FONT_SIZE_14,
                      fontWeight: FontWeight.w500,
                      color: MyColor.primaryColor,
                    ),
                    Icon(Icons.chevron_right, color: MyColor.primaryColor),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Anti-flicker tile
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, ),
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
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                    onTap: () {
                      // Get.to(() =>  WirelessChime());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          text: MyStrings.previewtimeoutpopupreminder.tr,
                          size: AppDimensions.FONT_SIZE_14,
                          fontWeight: FontWeight.w500,
                          color: MyColor.primaryColor,
                        ),
                        Obx(() => Transform.scale(
                          scale: 0.7,
                          child: Switch(
                            value: c.receiveAlarmNotifications.value,
                            onChanged: (val) {
                              c.toggleNotification(val);
                            },
                            activeColor: MyColor.secondaryColor,
                            inactiveTrackColor: Colors.grey.shade400,
                            activeTrackColor: MyColor.secondaryColor,
                            thumbColor: MaterialStateProperty.all(Colors.white),
                            trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
                          ),
                        )),                      ],
                    ),
                  ),
            ),
            const SizedBox(height: 10),
            AppText(
              text: MyStrings.popupwindowreminderwhenlivestreaming.tr,
              size: AppDimensions.FONT_SIZE_12,
              fontWeight: FontWeight.w500,
              color: MyColor.primaryColor,
            ),
            const SizedBox(height: 10),
            Container(
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
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Get.to(() =>  BatteryManagementView());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: MyStrings.batterymanagement.tr,
                      size: AppDimensions.FONT_SIZE_14,
                      fontWeight: FontWeight.w500,
                      color: MyColor.primaryColor,
                    ),
                    Icon(Icons.chevron_right, color: MyColor.primaryColor),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            AppText(
              text: MyStrings.timesetting.tr,
              size: AppDimensions.FONT_SIZE_12,
              fontWeight: FontWeight.w500,
              color: MyColor.primaryColor,
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, ),
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
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  // Get.to(() =>  WirelessChime());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: MyStrings.hourclock.tr,
                      size: AppDimensions.FONT_SIZE_14,
                      fontWeight: FontWeight.w500,
                      color: MyColor.primaryColor,
                    ),
                    Obx(() => Transform.scale(
                      scale: 0.7,
                      child: Switch(
                        value: c.receiveAlarmNotifications.value,
                        onChanged: (val) {
                          c.toggleNotification(val);
                        },
                        activeColor: MyColor.secondaryColor,
                        inactiveTrackColor: Colors.grey.shade400,
                        activeTrackColor: MyColor.secondaryColor,
                        thumbColor: MaterialStateProperty.all(Colors.white),
                        trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                    )),                      ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
