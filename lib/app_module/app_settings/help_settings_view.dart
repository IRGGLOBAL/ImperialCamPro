import 'package:campro/app_module/app_settings/paid_subscription_view.dart';
import 'package:campro/app_module/app_settings/power_plugin_camera.dart';
import 'package:campro/utils/custom_widget/my_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../utils/Fonts/AppDimensions.dart';
import '../../utils/Images/my_images.dart';
import '../../utils/Widgets/AppText.dart';
import '../../utils/custom_widget/strings.dart';
import 'account_view.dart';
import 'app_function_experience.dart';
import 'app_setting_controller /app_setting_controller.dart';
import 'baby_monitor_view.dart';
import 'battery_camera_view.dart';
import 'doorbell_help_setting_view.dart';
import 'feedback_view.dart';
import 'four_g_camera_view.dart';


class HelpSettingsView extends StatelessWidget {
   HelpSettingsView({Key? key}) : super(key: key);

  final AppSettingController controller = Get.put(AppSettingController());

  @override
  Widget build(BuildContext context) {

    return
      Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title:
        AppText(
          text: "${MyStrings.selectdevice.tr}",
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
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => SizedBox(
              height: Get.height *0.13,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.items.length,
                itemBuilder: (context, index) {
                  final item = controller.items[index];
                  return GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () => controller.selectItem(index),
                    child: Container(
                      width: Get.width *0.22,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
                      decoration: BoxDecoration(
                        color:  MyColor.colorWhite,
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color:  MyColor.primaryColor.withOpacity(0.05) ,
                          width: 1.5,
                        ), ),

                      child:

                      Column(

                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          SvgPicture.asset(
                            item.svgAsset,
                            width: 32,
                            height: 32,
                          ),

                          const SizedBox(height: 8),

                          Center(
                            child: AppText(
                              text:  item.text,
                              size: AppDimensions.FONT_SIZE_10,
                              fontWeight: FontWeight.w500,
                              color: MyColor.primaryColor,
                              textAlign: TextAlign.center,
                              maxLines: 2,
                            ),
                          ),

                        ],
                      ),
                    ),
                  );
                },
              ),
            )),
            const SizedBox(height: 10),
            AppText(
              text: MyStrings.morequestions.tr,
              size: AppDimensions.FONT_SIZE_14,
              fontWeight: FontWeight.w500,
              color: MyColor.primaryColor,
            ),
            const SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
              decoration: BoxDecoration(
                color: MyColor.colorWhite,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                children: [
                  _settingsTile(MyImages.powerplugcamera, "${MyStrings.powerplugcamera.tr}",
                    onTap: () {Get.to(PowerPluginCamera());},),
                  _settingsTile(MyImages.doorbell, "${MyStrings.doorbell.tr}",
                    onTap: () {Get.to(DoorbellHelpSettingView());},),
                  _settingsTile(MyImages.batterycamera, "${MyStrings.batterycamera.tr}",
                    onTap: () {Get.to(BatteryCameraView());},),
                  _settingsTile(MyImages.fourgcamera, "${MyStrings.fourgcamera.tr}",
                    onTap: () {Get.to(FourGCameraView());},),
                  _settingsTile(MyImages.basbymonitor, "${MyStrings.babymonitor.tr}",
                    onTap: () {Get.to(BabyMonitorView());},),
                  _settingsTile(MyImages.appfunctionexperience, "${MyStrings.appfunctionexperience.tr}",
                    onTap: () {Get.to(AppFunctionExperience());},),
                  _settingsTile(MyImages.account, "${MyStrings.account.tr}",
                    onTap: () {Get.to(AccountView());},),
                  _settingsTile(MyImages.paidsubscription, "${MyStrings.paidsubscription.tr}",
                    onTap: () {Get.to(PaidSubscriptionView());},),
                ],
              ),
            ),
            const SizedBox(height: 10),
            AppText(
              text: MyStrings.feedbackrecord.tr,
              size: AppDimensions.FONT_SIZE_14,
              fontWeight: FontWeight.w500,
              color: MyColor.primaryColor,
            ),
            SizedBox(height: 10),
            Container(
                decoration: BoxDecoration(
                  color: MyColor.colorWhite,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: _settingsTile(MyImages.feedback, "${MyStrings.feedback.tr}",
                  onTap: () {Get.to(FeedbackView());},)),
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
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
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
