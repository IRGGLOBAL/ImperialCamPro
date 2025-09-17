import 'package:campro/app_module/app_settings/my_orders_view.dart';
import 'package:campro/utils/custom_widget/my_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../utils/Fonts/AppDimensions.dart';
import '../../utils/Images/my_images.dart';
import '../../utils/Widgets/AppText.dart';
import '../../utils/custom_widget/strings.dart';
import 'create_family_view.dart';
import 'family_settings.dart';
import 'join_family_view.dart';


class FamilyManagementView extends StatelessWidget {
  const FamilyManagementView({Key? key}) : super(key: key);

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
          text: "${MyStrings.familymanagement.tr}",
          size: AppDimensions.FONT_SIZE_16,
          fontWeight: FontWeight.w600,
          color: MyColor.primaryColor,
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: MyColor.transparentColor,

        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: MyStrings.myfamily.tr,
              size: AppDimensions.FONT_SIZE_14,
              fontWeight: FontWeight.w500,
              color: MyColor.primaryColor,
            ),
            const SizedBox(height: 10),
            // Anti-flicker tile
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                Get.to(() =>  FamilySettings());
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                decoration: BoxDecoration(
                  color: MyColor.colorWhite,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 2,
                      offset: const Offset(2, 2),
                    ),
                  ],
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: MyStrings.mburairhome.tr,
                      size: AppDimensions.FONT_SIZE_14,
                      fontWeight: FontWeight.w500,
                      color: MyColor.primaryColor,
                    ),
                    Icon(Icons.chevron_right, color: MyColor.primaryColor),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            AppText(
              text: MyStrings.createanewfamily.tr,
              size: AppDimensions.FONT_SIZE_14,
              fontWeight: FontWeight.w500,
              color: MyColor.primaryColor,
            ),
            const SizedBox(height: 10),
            // Cloud Storage Card
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: (){
                Get.to(CreateFamilyView());
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: MyColor.colorWhite,
                  borderRadius: BorderRadius.circular(12),
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
                child: Row(
                  children: [
                    SvgPicture.asset(
                      MyImages.createfamily,
                      width: 55,
                      height: 55,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: AppText(
                            text: MyStrings.createfamily.tr,
                            size: AppDimensions.FONT_SIZE_14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: (){
                Get.to(JoinFamilyView());
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: MyColor.colorWhite,
                  borderRadius: BorderRadius.circular(12),
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
                child: Row(
                  children: [
                    SvgPicture.asset(
                      MyImages.joinfamily,
                      width: 55,
                      height: 55,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: AppText(
                        text: MyStrings.joinfamily.tr,
                        size: AppDimensions.FONT_SIZE_14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

}
