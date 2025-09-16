import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/Fonts/AppDimensions.dart';
import '../../utils/Paddings/AppPaddings.dart';
import '../../utils/Widgets/AppText.dart';
import '../../utils/custom_widget/my_color.dart';
import '../../utils/custom_widget/strings.dart';
import 'package:campro/app_module/camera_settings/camera_setting_controller.dart';

class IpAddressSettings extends StatelessWidget {
  IpAddressSettings({Key? key}) : super(key: key);

  final CameraSettingController c = Get.put(CameraSettingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading:
        IconButton(icon: const Icon(Icons.arrow_back_ios, color: Colors.black), onPressed: () => Get.back()),
        title: AppText(
          text: MyStrings.ipaddresssettings.tr,
          size: AppDimensions.FONT_SIZE_16,
          fontWeight: FontWeight.w600,
          color: MyColor.primaryColor,
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: MyColor.transparentColor,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          /// Segmented control (Network / Bluetooth)
          Padding(
            padding: AppPaddings.defaultPadding,
            child: Obx(() {
              final isNetwork = c.selectedTab.value == 0;
              return Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => c.selectedTab.value = 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: isNetwork ? Colors.white : Colors.transparent,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: Center(
                            child: AppText(
                              text: MyStrings.networkconnection.tr,
                              size: AppDimensions.FONT_SIZE_12,
                              fontWeight: FontWeight.w500,
                              color: isNetwork ? Colors.black : Colors.grey.shade700,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => _showBluetoothTip(context),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: !isNetwork ? Colors.white : Colors.transparent,
                            borderRadius: const BorderRadius.all(
                             Radius.circular(5),
                            ),
                          ),
                          child: Center(
                            child: AppText(
                              text: MyStrings.bluetoothconnection.tr,
                              size: AppDimensions.FONT_SIZE_12,
                              fontWeight: FontWeight.w500,
                              color: !isNetwork ? Colors.black : Colors.grey.shade700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),

          /// Content area
          Expanded(
            child: Obx(() {
              if (c.selectedTab.value == 0) {
                /// Network content (placeholder)
                return _networkContent();
              } else {
                /// Bluetooth content (placeholder)
                return _bluetoothContent();
              }
            }),
          ),

          /// Bottom fixed bar that changes depending on tab
          Obx(() {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: Colors.grey.shade200)),
              ),
              child: c.selectedTab.value == 0 ? _networkBottomBar() : _bluetoothBottomBar(),
            );
          }),
        ],
      ),
    );
  }

  ///  CONTENT PLACEHOLDERS
  Widget _networkContent() {
    return Padding(
      padding: AppPaddings.defaultPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Put your actual list or cards here
          const SizedBox(height: 8),
          Center(child: AppText(text: MyStrings.networkdeviceslist.tr,
              size: AppDimensions.FONT_SIZE_12,
              fontWeight: FontWeight.w500,
              color: Colors.black54)),
        ],
      ),
    );
  }

  Widget _bluetoothContent() {
    return Padding(
      padding: AppPaddings.defaultPadding,
      child: Column(
        children: [
          const SizedBox(height: 8),
          Center(child: AppText(text: MyStrings.bluetoothdeviceslist.tr,
              size: AppDimensions.FONT_SIZE_12,
              fontWeight: FontWeight.w500,
              color: Colors.black54)),
        ],
      ),
    );
  }

  ///  BOTTOM BARS
  Widget _networkBottomBar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(text: "${MyStrings.selected.tr} 0",
            size: AppDimensions.FONT_SIZE_14,
            fontWeight: FontWeight.w500,
            color: MyColor.primaryColor),

        const SizedBox(height: 10),

        Row(
          children: [
            /// Select All small outlined button
            SizedBox(
              height: 36,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: MyColor.secondaryColor),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                ),
                onPressed: () {
                  /// handle select all
                },
                child: AppText(text: MyStrings.selectall.tr,
                    size: AppDimensions.FONT_SIZE_12,
                    fontWeight: FontWeight.w500,
                    color: MyColor.secondaryColor),
              ),
            ),

            const SizedBox(width: 12),

            /// Go Settings big red button
            Expanded(
              child: SizedBox(
                height: 44,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MyColor.secondaryColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
                    elevation: 0,
                  ),
                  onPressed: () {
                    /// Go Settings action
                  },
                  child: AppText(text: MyStrings.gosettings.tr,
                      size: AppDimensions.FONT_SIZE_14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

      ],
    );
  }

  Widget _bluetoothBottomBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 180,
          height: 44,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: MyColor.secondaryColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
              elevation: 0,
            ),
            onPressed: () {
              /// Go Settings for bluetooth
            },
            child: AppText(text: MyStrings.gosettings.tr,
                size: AppDimensions.FONT_SIZE_14,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
        ),
      ],
    );
  }

  ///  BLUETOOTH TIP DIALOG
  void _showBluetoothTip(BuildContext context) {
    /// show dialog first; when user taps I See -> switch tab
    Get.dialog(
      Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: MyColor.colorWhite,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 12)],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppText(
                text: MyStrings.tips.tr,
                size: AppDimensions.FONT_SIZE_16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 14),
              AppText(
                text: MyStrings.ipaddresssettingalert.tr,
                size: AppDimensions.FONT_SIZE_12,
                fontWeight: FontWeight.w400,
                color: Colors.black54,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 18),
              SizedBox(
                width: 100,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    side: BorderSide(color: Colors.transparent),
                  ),
                  onPressed: () {
                    Get.back();
                    c.selectedTab.value = 1; /// finally switch to Bluetooth tab
                  },
                  child: AppText(text: MyStrings.isee.tr, size: AppDimensions.FONT_SIZE_14, fontWeight: FontWeight.w600, color: MyColor.secondaryColor),
                ),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: true,
    );
  }
}



