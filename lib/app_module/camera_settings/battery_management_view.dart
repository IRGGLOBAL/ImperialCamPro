import 'package:campro/app_module/camera_settings/camera_setting_controller.dart';
import 'package:campro/app_module/camera_settings/electricity_usage_statistics.dart';
import 'package:campro/app_module/camera_settings/wireless_chime.dart';
import 'package:campro/utils/custom_widget/my_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/Fonts/AppDimensions.dart';
import '../../utils/Paddings/AppPaddings.dart';
import '../../utils/Widgets/AppText.dart';
import '../../utils/custom_widget/strings.dart';
import 'charging_scheme_view.dart';


class BatteryManagementView extends StatelessWidget {
  BatteryManagementView({Key? key}) : super(key: key);

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
          text: MyStrings.enteraccount.tr,
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

            const SizedBox(height: 10),
            // Anti-flicker tile
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
                          text: MyStrings.powersupply.tr,
                          size: AppDimensions.FONT_SIZE_14,
                          fontWeight: FontWeight.w500,
                          color: MyColor.primaryColor,
                        ),
                        AppText(
                          text: MyStrings.batterypowered.tr,
                          size: AppDimensions.FONT_SIZE_12,
                          fontWeight: FontWeight.w500,
                          color: MyColor.hintTextColor,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        text: MyStrings.electricquantity.tr,
                        size: AppDimensions.FONT_SIZE_14,
                        fontWeight: FontWeight.w500,
                        color: MyColor.primaryColor,
                      ),
                      AppText(
                        text: "4%",
                        size: AppDimensions.FONT_SIZE_12,
                        fontWeight: FontWeight.w500,
                        color: MyColor.hintTextColor,
                      ),
                    ],
                  ),
                ],
              ),
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
              child:  Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() =>  ChargingSchemeView());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                            text: MyStrings.schematicofcharging.tr,
                            size: AppDimensions.FONT_SIZE_14,
                            fontWeight: FontWeight.w500,
                            color: MyColor.primaryColor,
                          ),
                          Icon(Icons.chevron_right, color: MyColor.hintTextColor),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: () {
                        Get.to(() =>  ElectricityUsageStatistics());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                            text: MyStrings.electricityUsageStatistics.tr,
                            size: AppDimensions.FONT_SIZE_14,
                            fontWeight: FontWeight.w500,
                            color: MyColor.primaryColor,
                          ),
                          Icon(Icons.chevron_right, color: MyColor.hintTextColor),
                        ],
                      ),
                    ),
                  ],
                ),

            ),
          ],
        ),
      ),
    );
  }


}
