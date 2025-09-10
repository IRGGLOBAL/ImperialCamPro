import 'package:campro/app_module/camera_settings/camera_setting_controller.dart';
import 'package:campro/utils/custom_widget/my_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../utils/Fonts/AppDimensions.dart';
import '../../utils/Images/my_images.dart';
import '../../utils/Paddings/AppPaddings.dart';
import '../../utils/Widgets/AppText.dart';
import '../../utils/custom_widget/strings.dart';


class MemberInformationView extends StatelessWidget {
  MemberInformationView({Key? key}) : super(key: key);

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
          text: MyStrings.memberinfo.tr,
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
            Container(
              height: Get.height*0.09,
              width: Get.width*0.2,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: MyColor.secondaryColor,
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 3,
                    spreadRadius: 0,
                    offset: const Offset(2, 2),
                  ),
                ],
                border: Border.all(color: Colors.grey.shade200),
              ),
            ),
            const SizedBox(height: 30),
            AppText(
              text: MyStrings.name.tr,
              size: AppDimensions.FONT_SIZE_16,
              fontWeight: FontWeight.w600,
              color: MyColor.primaryColor,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  text: MyStrings.account.tr,
                  size: AppDimensions.FONT_SIZE_14,
                  fontWeight: FontWeight.w600,
                  color: MyColor.primaryColor,
                ),
                //SizedBox(width: 5,),
                AppText(
                  text: MyStrings.email.tr,
                  size: AppDimensions.FONT_SIZE_12,
                  fontWeight: FontWeight.w500,
                  color: MyColor.primaryColor,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  text: MyStrings.familyidentity.tr,
                  size: AppDimensions.FONT_SIZE_14,
                  fontWeight: FontWeight.w600,
                  color: MyColor.primaryColor,
                ),
                //SizedBox(width: 5,),
                AppText(
                  text: MyStrings.familyowner.tr,
                  size: AppDimensions.FONT_SIZE_12,
                  fontWeight: FontWeight.w500,
                  color: MyColor.primaryColor,
                ),
              ],
            ),


          ],
        ),
      ),
    );
  }


}
