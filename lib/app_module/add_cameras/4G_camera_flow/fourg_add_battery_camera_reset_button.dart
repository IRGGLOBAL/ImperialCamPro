import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:campro/utils/custom_widget/my_color.dart';
import 'package:campro/utils/Fonts/AppDimensions.dart';
import 'package:campro/utils/Paddings/AppPaddings.dart';
import 'package:campro/utils/Widgets/AppText.dart';
import 'package:campro/utils/Widgets/AppButton.dart';
import 'package:campro/utils/custom_widget/strings.dart';
import '../../manually_enter_camera/manual_entry_controller.dart';
import '../add_battery_camera.dart';
import 'fourg_add_battery_camera_scan_qrcode_screen.dart';


class FourgAddBatteryCameraResetButton extends StatelessWidget {

  FourgAddBatteryCameraResetButton({super.key,

   });


  final ManualEntryController manualEntryController = Get.find<ManualEntryController>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: MyColor.transparentColor,
        title: AppText(
          text: MyStrings.addbatterycamera.tr,
          size: AppDimensions.FONT_SIZE_16,
          fontWeight: FontWeight.w600,
          color: MyColor.primaryColor,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon:  Icon(Icons.volume_up, color: Colors.black),
          ),
        ],
      ),

      body: Padding(
        padding: AppPaddings.defaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            /// Grey Box (Image placeholder)
            Container(
              height: 180,
              width: double.infinity,
              color: Colors.grey.shade300,
            ),

            const SizedBox(height: 24),

            // /// Bold Title
            // AppText(
            //   text: MyStrings.fourgcameranexttitle.tr,
            //   size: AppDimensions.FONT_SIZE_16,
            //   fontWeight: FontWeight.w600,
            //   color: MyColor.primaryColor,
            //   textAlign: TextAlign.start,
            // ),
            //
            // const SizedBox(height: 12),

            /// Sub Text
            AppText(
              text:  MyStrings.fourgcamerathirdtitle.tr,
              size: AppDimensions.FONT_SIZE_12,
              fontWeight: FontWeight.w500,
              color: MyColor.primaryColor,
              textAlign: TextAlign.start,
            ),

            const Spacer(),

            /// Next Button
            AppButton(
              buttonName: MyStrings.next.tr,
              buttonColor: MyColor.secondaryColor,
              textColor: Colors.white,
              textSize: 16,
              fontWeight: FontWeight.w500,
              hasShadow: false,
              onTap: () {
                Get.to(FourgAddBatteryCameraScanQrcodeScreen());
                //Get.to(FourgAddBatteryCameraScanQrcodeScreen());
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
