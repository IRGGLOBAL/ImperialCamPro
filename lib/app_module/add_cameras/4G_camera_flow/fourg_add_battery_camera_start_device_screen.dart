import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:campro/utils/custom_widget/my_color.dart';
import 'package:campro/utils/Fonts/AppDimensions.dart';
import 'package:campro/utils/Widgets/AppText.dart';
import 'package:campro/utils/Widgets/AppButton.dart';
import 'package:campro/utils/custom_widget/strings.dart';
import '../../manually_enter_camera/manual_entry_controller.dart';
import '../add_battery_camera.dart';
import 'fourg_add_battery_camera_reset_button.dart';

class FourgAddBatteryCameraStartDeviceScreen extends StatelessWidget {
  FourgAddBatteryCameraStartDeviceScreen({super.key});

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
              text: MyStrings.fourgcameranexttitle.tr,
              size: 16,
              fontWeight: FontWeight.w600,
              color: MyColor.primaryColor,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            /// Bullet instructions
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                InstructionText(MyStrings.fourgcameranextsubtitle.tr),
                InstructionText(MyStrings.fourgcameranextsubtitletwo.tr),
                InstructionText(MyStrings.fourgcameranextsubtitlethree.tr),
              ],
            ),
            const SizedBox(height: 12),
            /// Warning text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                Text(
                  MyStrings.bluelightisnotflashing.tr,
                  style: TextStyle(
                    color: MyColor.secondaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Icon(Icons.help_outline, color: MyColor.secondaryColor, size: 18),
              ],
            ),

            const SizedBox(height: 100),

            /// Checkbox option
            Row(
              children: [
                Radio(
                  value: true,
                  groupValue: true,
                  onChanged: (val) {},
                  activeColor: MyColor.secondaryColor,
                ),
                 Expanded(
                  child: Text(
                    MyStrings.theindicatorlighthasbeen.tr,
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                )
              ],
            ),

            const Spacer(),

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
                Get.to(FourgAddBatteryCameraResetButton());

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

class InstructionText extends StatelessWidget {
  final String text;
  const InstructionText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("• ",
              style: TextStyle(fontSize: 16, color: MyColor.primaryColor,)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
