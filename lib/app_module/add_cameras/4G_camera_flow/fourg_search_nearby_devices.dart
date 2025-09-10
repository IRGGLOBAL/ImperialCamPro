import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:campro/utils/Widgets/AppText.dart';
import 'package:campro/utils/Widgets/AppButton.dart';
import 'package:campro/utils/custom_widget/my_color.dart';
import 'package:campro/utils/Fonts/AppDimensions.dart';
import 'package:campro/utils/custom_widget/strings.dart';

import '../../manually_enter_camera/manual_entry_controller.dart';
import '../add_battery_camera.dart';

class FourgSearchNearbyDevices extends StatelessWidget {
  FourgSearchNearbyDevices({super.key});

  final ManualEntryController c =
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
          color: Colors.black,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.volume_up, color: Colors.black),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            const Text(
              "Searching nearby devices",
              style: TextStyle(color: Colors.black54, fontSize: 14),
            ),

            const SizedBox(height: 30),

            /// Red Search Icon
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.red,
              child: const Icon(Icons.search, size: 40, color: Colors.white),
            ),

            const SizedBox(height: 20),

            /// Timer (from Controller)
            Obx(() => Text(
              c.timerText,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            )),

            const SizedBox(height: 30),

            const Text(
              "The search process may take 2 minutes, please do not do anything else",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),

            const Spacer(),

            /// Step Progress Circles
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                StepCircle(isActive: true, icon: Icons.search),
                SizedBox(width: 40),
                StepCircle(isActive: false, icon: Icons.power_settings_new),
                SizedBox(width: 40),
                StepCircle(isActive: false, icon: Icons.check_circle_outline),
              ],
            ),

            const SizedBox(height: 16),

            const Text(
              "Help",
              style: TextStyle(color: Colors.red, fontSize: 14),
            ),

            const SizedBox(height: 20),

            AppButton(
              buttonName: "Next",
              buttonColor: Colors.red,
              textColor: Colors.white,
              textSize: 16,
              fontWeight: FontWeight.w500,
              hasShadow: false,
              onTap: () {
                //Get.to(AddBatteryCamera());
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

class StepCircle extends StatelessWidget {
  final bool isActive;
  final IconData icon;
  const StepCircle({super.key, required this.isActive, required this.icon});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 18,
      backgroundColor: isActive ? Colors.red : Colors.grey.shade300,
      child: Icon(
        icon,
        size: 18,
        color: isActive ? Colors.white : Colors.black54,
      ),
    );
  }
}
