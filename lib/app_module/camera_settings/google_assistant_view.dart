import 'package:campro/app_module/camera_settings/camera_setting_controller.dart';
import 'package:campro/utils/Fonts/AppDimensions.dart';
import 'package:campro/utils/Images/my_images.dart';
import 'package:campro/utils/Paddings/AppPaddings.dart';
import 'package:campro/utils/Widgets/AppText.dart';
import 'package:campro/utils/custom_widget/my_color.dart';
import 'package:campro/utils/custom_widget/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


class GoogleAssistantView extends StatelessWidget {
  GoogleAssistantView({Key? key}) : super(key: key);

  final CameraSettingController c = Get.put(CameraSettingController());

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
          text: MyStrings.googleassistant.tr,
          size: AppDimensions.FONT_SIZE_16,
          fontWeight: FontWeight.w600,
          color: MyColor.primaryColor,
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: MyColor.transparentColor,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: AppPaddings.defaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment:  MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  MyImages.googleassistant,
                  height: 100,
                ),
              ],
            ),
            const SizedBox(height: 30),

            AppText(
              text: MyStrings.googleassistantcontent11.tr,
              size: AppDimensions.FONT_SIZE_16,
              fontWeight: FontWeight.w600,
              color: MyColor.primaryColor,
            ),
            const SizedBox(height: 30),
            AppText(
              text: MyStrings.googleassistantcontent1.tr,
              size: AppDimensions.FONT_SIZE_12,
              fontWeight: FontWeight.w500,
              color: MyColor.primaryColor,
            ),
            const SizedBox(height: 20),
            AppText(
              text: MyStrings.googleassistantcontent2.tr,
              size: AppDimensions.FONT_SIZE_12,
              fontWeight: FontWeight.w500,
              color: MyColor.secondaryColor,
            ),
            const SizedBox(height: 20),
            AppText(
              text: MyStrings.googleassistantcontent3.tr,
              size: AppDimensions.FONT_SIZE_12,
              fontWeight: FontWeight.w500,
              color: MyColor.primaryColor,
            ),
            const SizedBox(height: 20),
            AppText(
              text: MyStrings.googleassistantcontent4.tr,
              size: AppDimensions.FONT_SIZE_12,
              fontWeight: FontWeight.w500,
              color: MyColor.hintTextColor,
            ),
            const SizedBox(height: 20),
            Container(
              // margin: EdgeInsets.symmetric(horizontal: 40),
              padding: EdgeInsets.symmetric(vertical: 100),
              decoration: BoxDecoration(
                color: MyColor.lineColor,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            const SizedBox(height: 20),
            AppText(
              text: MyStrings.googleassistantcontent5.tr,
              size: AppDimensions.FONT_SIZE_12,
              fontWeight: FontWeight.w500,
              color: MyColor.hintTextColor,
            ),
            const SizedBox(height: 20),
            Container(
              // margin: EdgeInsets.symmetric(horizontal: 40),
              padding: EdgeInsets.symmetric(vertical: 100),
              decoration: BoxDecoration(
                color: MyColor.lineColor,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            const SizedBox(height: 20),
            AppText(
              text: MyStrings.googleassistantcontent6.tr,
              size: AppDimensions.FONT_SIZE_12,
              fontWeight: FontWeight.w500,
              color: MyColor.hintTextColor,
            ),
            const SizedBox(height: 20),
            Container(
              // margin: EdgeInsets.symmetric(horizontal: 40),
              padding: EdgeInsets.symmetric(vertical: 100),
              decoration: BoxDecoration(
                color: MyColor.lineColor,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            const SizedBox(height: 20),
            AppText(
              text: MyStrings.googleassistantcontent7.tr,
              size: AppDimensions.FONT_SIZE_12,
              fontWeight: FontWeight.w500,
              color: MyColor.hintTextColor,
            ),
            const SizedBox(height: 20),
            Container(
              // margin: EdgeInsets.symmetric(horizontal: 40),
              padding: EdgeInsets.symmetric(vertical: 100),
              decoration: BoxDecoration(
                color: MyColor.lineColor,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            const SizedBox(height: 20),
            AppText(
              text: MyStrings.googleassistantcontent8.tr,
              size: AppDimensions.FONT_SIZE_12,
              fontWeight: FontWeight.w500,
              color: MyColor.primaryColor,
            ),
            const SizedBox(height: 20),
            AppText(
              text: MyStrings.googleassistantcontent9.tr,
              size: AppDimensions.FONT_SIZE_12,
              fontWeight: FontWeight.w500,
              color: MyColor.hintTextColor,
            ),
            const SizedBox(height: 20),
            AppText(
              text: MyStrings.googleassistantcontent0.tr,
              size: AppDimensions.FONT_SIZE_12,
              fontWeight: FontWeight.w500,
              color: MyColor.secondaryColor,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }


}
