import 'package:campro/utils/custom_widget/my_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../utils/Fonts/AppDimensions.dart';
import '../../utils/Widgets/AppButton.dart';
import '../../utils/Widgets/AppText.dart';
import '../../utils/custom_widget/strings.dart';
import 'add_device_share.dart';
import 'motion_detection_add_time_period.dart';


class MotionDetectionAlertPlan extends StatelessWidget {
  const MotionDetectionAlertPlan({Key? key}) : super(key: key);

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          height: MediaQuery.of(context).size.height - 140,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Expanded(
                child: Center(
                  child: AppText(
                    text: "${MyStrings.thisdevicehasnotbeensharedwithanyone.tr}",
                    size: AppDimensions.FONT_SIZE_16,
                    fontWeight: FontWeight.w400,
                    color: MyColor.hintTextColor,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              AppButton(
                buttonName: MyStrings.add.tr,
                buttonColor: MyColor.secondaryColor,
                textColor: MyColor.colorWhite,
                textSize: 16,
                fontWeight: FontWeight.w500,
                hasShadow: false,
                buttonWidth: double.infinity,
                onTap: () {
                  Get.to(MotionDetectionAddTimePeriod());
                },
                elevation: 0,
                borderWidth: 0,
                isIcon: true,
                icon: Icons.add,
                iconSize: 20,
                paddingButton: 8,
                isSuffix: false,
              )
            ],
          ),
        ),
      ),
    );
  }

}
