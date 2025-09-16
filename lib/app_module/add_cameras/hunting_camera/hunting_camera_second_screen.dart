import 'package:campro/utils/custom_widget/my_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../utils/Fonts/AppDimensions.dart';
import '../../../utils/Images/my_images.dart';
import '../../../utils/Paddings/AppPaddings.dart';
import '../../../utils/Widgets/AppButton.dart';
import '../../../utils/Widgets/AppText.dart';
import '../../../utils/custom_widget/strings.dart';
import 'hunting_camera_bluetooth_distribution.dart';
import 'hunting_camera_qr_code.dart';

class HuntingCameraSecondScreen extends StatelessWidget {
  const HuntingCameraSecondScreen({Key? key}) : super(key: key);

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
          text: "${MyStrings.configuration.tr}",
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
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Get.to(() => HuntingCameraBluetoothDistribution());
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
                                MyImages.bluetoothicon,
                                height: 22,
                              ),
                              SizedBox(width: 10),
                              AppText(
                                text: MyStrings.bluetoothdistributionnetwork.tr,
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
                      Get.to(HuntingCameraQrCode());
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
                                MyImages.qrcodeicon,
                                height: 22,
                              ),
                              SizedBox(width: 10),
                              AppText(
                                text: MyStrings.qrcode.tr,
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

                  SizedBox(height: 120),
                  // Main title (if exists)
                  AppText(
                    text: MyStrings.huntingcameratitle.tr,
                    size: AppDimensions.FONT_SIZE_16,
                    fontWeight: FontWeight.w600,
                    color: MyColor.primaryColor,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 12),
                  AppText(
                    text: MyStrings.fourgcameranextsubtitle.tr,
                    size: AppDimensions.FONT_SIZE_12,
                    fontWeight: FontWeight.w500,
                    color: MyColor.primaryColor,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
          ),
          // bottom button
          Padding(
            padding: AppPaddings.defaultPadding,
            child: AppButton(
              buttonName: MyStrings.next.tr,
              buttonColor: MyColor.secondaryColor,
              textColor: Colors.white,
              textSize: 16,
              fontWeight: FontWeight.w500,
              hasShadow: false,
              onTap: () {
                //Get.to(HuntingCameraBluetoothDistribution());
              },
              elevation: 0,
              borderWidth: 0,
              isCenter: true,
            ),
          ),
        ],
      ),
    );
  }
}
