import 'package:campro/app_module/camera_settings/camera_setting_controller.dart';
import 'package:campro/app_module/camera_settings/wireless_chime.dart';
import 'package:campro/utils/custom_widget/my_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/Fonts/AppDimensions.dart';
import '../../utils/Paddings/AppPaddings.dart';
import '../../utils/Widgets/AppText.dart';
import '../../utils/custom_widget/strings.dart';


class RecordingManagementView extends StatelessWidget {
  RecordingManagementView({Key? key}) : super(key: key);

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
          text: MyStrings.recordingmanagement.tr,
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
            AppText(
              text: MyStrings.sdcardrecordingmode.tr,
              size: AppDimensions.FONT_SIZE_12,
              fontWeight: FontWeight.w500,
              color: MyColor.primaryColor,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                     // Get.to(() =>  WirelessChime());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          text: MyStrings.videoswitch.tr,
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
                  AppText(
                    text: MyStrings.eventecording.tr,
                    size: AppDimensions.FONT_SIZE_14,
                    fontWeight: FontWeight.w500,
                    color: MyColor.primaryColor,
                  ),
                  const SizedBox(height: 14),
                ],
              ),
            ),
            const SizedBox(height: 10),

            AppText(
              text: MyStrings.sdcardcapacity.tr,
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
                onTap: () {
                  //Get.to(() =>  WirelessChime());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: MyStrings.capacity.tr,
                      size: AppDimensions.FONT_SIZE_14,
                      fontWeight: FontWeight.w500,
                      color: MyColor.primaryColor,
                    ),
                    AppText(
                      text: MyStrings.nosdcard.tr,
                      size: AppDimensions.FONT_SIZE_12,
                      fontWeight: FontWeight.w500,
                      color: MyColor.hintTextColor,
                    ),                ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
