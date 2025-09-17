import 'package:campro/utils/custom_widget/my_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../utils/Fonts/AppDimensions.dart';
import '../../utils/Images/my_images.dart';
import '../../utils/Paddings/AppPaddings.dart';
import '../../utils/Widgets/AppText.dart';
import '../../utils/custom_widget/strings.dart';
import '../qr_scanner/qr_scanner_view.dart';
import 'add_device_enter_account.dart';
import 'motion_detection_view.dart';

class AddDeviceShare extends StatelessWidget {
  const AddDeviceShare({Key? key}) : super(key: key);

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
          text: "${MyStrings.deviseshare.tr}",
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
          // Top content (scrollable if needed)
          Expanded(
            child: SingleChildScrollView(
              padding: AppPaddings.defaultPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Get.to(() => QrScannerView());
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                MyImages.scanqrcode,
                                height: 22,
                              ),
                              SizedBox(width: 10),
                              AppText(
                                text: MyStrings.scanqrcode.tr,
                                size: AppDimensions.FONT_SIZE_14,
                                fontWeight: FontWeight.w500,
                                color: MyColor.primaryColor,
                              ),
                            ],
                          ),
                          Icon(Icons.chevron_right, color: MyColor.primaryColor),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Get.to(() => AddDeviceEnterAccount());
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                MyImages.enteraccount,
                                height: 22,
                              ),
                              SizedBox(width: 10),
                              AppText(
                                text: MyStrings.enteraccount.tr,
                                size: AppDimensions.FONT_SIZE_14,
                                fontWeight: FontWeight.w500,
                                color: MyColor.primaryColor,
                              ),
                            ],
                          ),
                          Icon(Icons.chevron_right, color: MyColor.primaryColor),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  AppText(
                    text: MyStrings.recentcontacts.tr,
                    size: AppDimensions.FONT_SIZE_14,
                    fontWeight: FontWeight.w400,
                    color: MyColor.primaryColor,
                  ),
                ],
              ),
            ),
          ),
          // Centered "No contacts" text
          Expanded(
            child: Center(
              child: AppText(
                text: MyStrings.nocontacts.tr,
                size: AppDimensions.FONT_SIZE_16,
                fontWeight: FontWeight.w400,
                color: MyColor.hintTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
