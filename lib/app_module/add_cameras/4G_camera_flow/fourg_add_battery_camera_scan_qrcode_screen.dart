import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:campro/utils/custom_widget/my_color.dart';
import 'package:campro/utils/Fonts/AppDimensions.dart';
import 'package:campro/utils/Widgets/AppText.dart';
import 'package:campro/utils/Widgets/AppButton.dart';
import 'package:campro/utils/custom_widget/strings.dart';
import '../../manually_enter_camera/manual_entry_controller.dart';
import 'fourg_add_battery_camera_reset_button.dart';
import 'fourg_search_nearby_devices.dart';

class FourgAddBatteryCameraScanQrcodeScreen extends StatelessWidget {
  FourgAddBatteryCameraScanQrcodeScreen({super.key});

  final ManualEntryController manualEntryController =
  Get.find<ManualEntryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        title: AppText(
          text: MyStrings.addbatterycamera.tr,
          size: AppDimensions.FONT_SIZE_16,
          fontWeight: FontWeight.w600,
          color: MyColor.primaryColor,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: MyColor.primaryColor,),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.volume_up, color: MyColor.primaryColor,),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Grey Box (Image placeholder)
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(8),
              ),
            ),

            const SizedBox(height: 24),

            /// Bold Title
            AppText(
              text: MyStrings.fourgcamerafourthtitle.tr,
              size: AppDimensions.FONT_SIZE_12,
              fontWeight: FontWeight.w500,
              color: MyColor.primaryColor,
              textAlign: TextAlign.start,
            ),

            const SizedBox(height: 16),


            const Spacer(),
            AppText(
              text: MyStrings.help.tr,
              size: AppDimensions.FONT_SIZE_12,
              fontWeight: FontWeight.w500,
              color: MyColor.secondaryColor,
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 20),
            /// Next Button
            AppButton(
              buttonName: MyStrings.next.tr,
              buttonColor:  MyColor.secondaryColor,
              textColor: Colors.white,
              textSize: 16,
              fontWeight: FontWeight.w500,
              hasShadow: false,
              //borderRadius: 30,
              onTap: () {
                Get.to(FourgSearchNearbyDevices());

              },
              elevation: 0,
              borderWidth: 0,
              isCenter: true,
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

