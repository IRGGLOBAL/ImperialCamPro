import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:campro/utils/custom_widget/my_color.dart';
import 'package:campro/utils/Fonts/AppDimensions.dart';
import 'package:campro/utils/Paddings/AppPaddings.dart';
import 'package:campro/utils/Widgets/AppText.dart';
import 'package:campro/utils/Widgets/AppButton.dart';
import 'package:campro/utils/custom_widget/strings.dart';



class DeleteAccountGeneralSettings extends StatelessWidget {
  DeleteAccountGeneralSettings({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: MyColor.transparentColor,

        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: AppText(
              text: MyStrings.cancel.tr,
              size: AppDimensions.FONT_SIZE_16,
              fontWeight: FontWeight.w500,
              color: MyColor.primaryColor,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: AppPaddings.defaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            const SizedBox(height: 20),

            // Main title (if exists)
            AppText(
              text: MyStrings.permanentlydisabledon.tr,
              size: AppDimensions.FONT_SIZE_16,
              fontWeight: FontWeight.w600,
              color: MyColor.primaryColor,
              textAlign: TextAlign.center,
            ),

            AppText(
              text: "2025-09-26 at 02:13:45",
              size: AppDimensions.FONT_SIZE_16,
              fontWeight: FontWeight.w600,
              color: MyColor.primaryColor,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),

            AppText(
              text: MyStrings.deleteaccountone.tr,
              size: AppDimensions.FONT_SIZE_12,
              fontWeight: FontWeight.w600,
              color: MyColor.primaryColor,
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 8),
            // Sub text or bullet points
            Center(
              child: BulletText(
                items: [
                 MyStrings.deleteaccounttwo.tr,
                  MyStrings.deleteaccountthree.tr,
                  MyStrings.deleteaccountfour.tr,
                  MyStrings.deleteaccountfive.tr,
                  MyStrings.deleteaccountsix.tr,
                  MyStrings.deleteaccountseven.tr,
                ],
                fontSize: AppDimensions.FONT_SIZE_12,
                fontWeight: FontWeight.w500,
                color: MyColor.primaryColor,
              ),
            ),

            const Spacer(),
            AppText(
              text: MyStrings.deleteaccounteight.tr,
              size: AppDimensions.FONT_SIZE_16,
              fontWeight: FontWeight.w600,
              color: MyColor.primaryColor,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            // Next Button
            AppButton(
              buttonName: MyStrings.deleteaccount.tr,
              buttonColor: MyColor.secondaryColor,
              textColor: Colors.white,
              textSize: 16,
              fontWeight: FontWeight.w500,
              hasShadow: false,
              onTap: () {

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



class BulletText extends StatelessWidget {
  final List<String> items;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  const BulletText({
    super.key,
    required this.items,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w400,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: items.map((text) {
        return Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("•  ",
                style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                    color: color,),
           // textAlign: TextAlign.center,
            ),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                    color: color),
                //textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
