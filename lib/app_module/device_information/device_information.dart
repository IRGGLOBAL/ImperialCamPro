import 'package:campro/utils/custom_widget/my_color.dart';
import 'package:campro/utils/custom_widget/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/Fonts/AppDimensions.dart';
import '../../utils/Widgets/AppButton.dart';
import '../../utils/Widgets/AppText.dart';

class DeviceInformation extends StatelessWidget {
  const DeviceInformation({Key? key}) : super(key: key);

  Widget _infoTile(String title, String value,
      {bool copyable = false, Widget? trailing}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Title
          AppText(
            text: title,
            size: AppDimensions.FONT_SIZE_14,
            fontWeight: FontWeight.w500,
            color: MyColor.primaryColor,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),

          // Right side (value + icons)
          Flexible(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: AppText(
                    text: value,
                    size: AppDimensions.FONT_SIZE_14,
                    fontWeight: FontWeight.w400,
                    color: MyColor.primaryColor,
                    textAlign: TextAlign.right,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis, // cut text if too long
                  ),
                ),
                if (copyable) ...[
                  const SizedBox(width: 6),
                  const Icon(Icons.copy, size: 18, color: MyColor.primaryColor,),
                ],
                if (trailing != null) ...[
                  const SizedBox(width: 6),
                  trailing,
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

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
          text: MyStrings.deviceInformation.tr, // Using string constant
          size: AppDimensions.FONT_SIZE_16,
          fontWeight: FontWeight.w600,
          color: MyColor.primaryColor,
        ),
        surfaceTintColor: MyColor.transparentColor,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // First Card (Device Name, SN, Location)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: MyColor.colorWhite,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 2,
                    spreadRadius: 0,
                    offset: Offset(2, 2),
                  ),
                ],
                border: Border.all(color: Colors.grey.shade200),
              ),

              child: Column(
                children: [
                  _infoTile(
                    MyStrings.deviceName.tr, // Using string constant
                    MyStrings.deviceNameValue.tr, // Using string constant
                    trailing: Icon(Icons.chevron_right, color: MyColor.primaryColor),
                  ),
                  _infoTile(
                    MyStrings.sn.tr, // Using string constant
                    MyStrings.snValue.tr, // Using string constant
                    copyable: true,
                  ),
                  _infoTile(
                    MyStrings.locationManagement.tr, // Using string constant
                    MyStrings.locationValue.tr, // Using string constant
                    trailing: Icon(Icons.chevron_right, color: MyColor.primaryColor),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Second Card (Network, Signal, IP, etc.)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: MyColor.colorWhite,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 2,
                    spreadRadius: 0,
                    offset: Offset(2, 2),
                  ),
                ],
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                children: [
                  _infoTile(
                    MyStrings.network.tr, // Using string constant
                    MyStrings.networkValue.tr, // Using string constant
                  ),
                  _infoTile(
                    MyStrings.signalStrength.tr, // Using string constant
                    MyStrings.signalStrengthValue.tr, // Using string constant
                  ),
                  _infoTile(
                    MyStrings.ip.tr, // Using string constant
                    MyStrings.ipValue.tr, // Using string constant
                  ),
                  _infoTile(
                    MyStrings.macAddress.tr, // Using string constant
                    MyStrings.macAddressValue.tr, // Using string constant
                  ),
                  _infoTile(
                    MyStrings.timezones.tr, // Using string constant
                    MyStrings.timezoneValue.tr, // Using string constant
                  ),
                  _infoTile(
                    MyStrings.devicePlatform.tr, // Using string constant
                    MyStrings.devicePlatformValue.tr, // Using string constant
                  ),
                  _infoTile(
                    MyStrings.deviceVersion.tr, // Using string constant
                    MyStrings.deviceVersionValue.tr, // Using string constant
                    trailing: Icon(Icons.chevron_right, color: MyColor.primaryColor),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            AppButton(
              buttonName: MyStrings.next.tr,
              buttonColor: MyColor.secondaryColor,
              textColor: MyColor.colorWhite,
              textSize: 16,
              fontWeight: FontWeight.w500,
              hasShadow: false,
              buttonWidth: double.infinity,
              onTap:  () {},
              elevation: 0,
              borderWidth: 0,
              isCenter: true,
            ),
          ],
        ),
      ),
    );
  }
}