import 'package:campro/app_module/camera_settings/camera_setting_controller.dart';
import 'package:campro/utils/custom_widget/my_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../utils/Fonts/AppDimensions.dart';
import '../../utils/Images/my_images.dart';
import '../../utils/Paddings/AppPaddings.dart';
import '../../utils/Widgets/AppButton.dart';
import '../../utils/Widgets/AppText.dart';
import '../../utils/custom_widget/strings.dart';


class LinkWithAlexa extends StatelessWidget {
  LinkWithAlexa({Key? key}) : super(key: key);

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
          text: MyStrings.linkwithalexa.tr,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              MyImages.alexa,
              height: 100,
            ),
            const SizedBox(height: 30),
            AppText(
              text: MyStrings.alexacontent.tr,
              size: AppDimensions.FONT_SIZE_12,
              fontWeight: FontWeight.w500,
              color: MyColor.primaryColor,
            ),
            const SizedBox(height: 200),
            AppButton(
              buttonName: MyStrings.allow.tr,
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
