import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:campro/utils/custom_widget/my_color.dart';
import 'package:campro/utils/Fonts/AppDimensions.dart';
import 'package:campro/utils/Paddings/AppPaddings.dart';
import 'package:campro/utils/Widgets/AppText.dart';
import 'package:campro/utils/Widgets/AppButton.dart';
import 'package:campro/utils/custom_widget/strings.dart';
import '../../manually_enter_camera/manual_entry_controller.dart';
import '../4G_camera_flow/fourg_search_nearby_devices.dart';
import 'hunting_camera_second_screen.dart';

class HuntingCameraBluetoothDistribution extends StatelessWidget {
  HuntingCameraBluetoothDistribution({super.key});

  final ManualEntryController controller = Get.find<ManualEntryController>();

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
          text: MyStrings.bluetoothdistributionnetwork.tr,
          size: AppDimensions.FONT_SIZE_16,
          fontWeight: FontWeight.w600,
          color: MyColor.primaryColor,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => controller.camerakitgoToPreviousScreen(),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.volume_up, color: Colors.black),
          ),
        ],
      ),
      body: Padding(
        padding: AppPaddings.defaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 20),

            // Image placeholder
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(8),
              ),
            ),

            const SizedBox(height: 24),

            // Main title (if exists)
            AppText(
              text: MyStrings.turnonbluetooth.tr,
              size: AppDimensions.FONT_SIZE_16,
              fontWeight: FontWeight.w600,
              color: MyColor.primaryColor,
              textAlign: TextAlign.start,
            ),

            const SizedBox(height: 12),



            // Sub text or bullet points
            BulletText(
              items: [
               MyStrings.turnonbluetoothone.tr,
                MyStrings.turnonbluetoothfour.tr,
              ],
              fontSize: AppDimensions.FONT_SIZE_12,
              fontWeight: FontWeight.w500,
              color: MyColor.primaryColor,
            ),

            const Spacer(),

            // Next Button
            AppButton(
              buttonName: MyStrings.next.tr,
              buttonColor: MyColor.secondaryColor,
              textColor: Colors.white,
              textSize: 16,
              fontWeight: FontWeight.w500,
              hasShadow: false,
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



class BulletText extends StatelessWidget {
  final List<String> items;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  const BulletText({
    super.key,
    required this.items,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w400,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((text) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("•  ",
                style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                    color: color)),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                    color: color),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
