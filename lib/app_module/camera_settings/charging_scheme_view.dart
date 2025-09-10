import 'package:campro/utils/custom_widget/my_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../utils/Fonts/AppDimensions.dart';
import '../../utils/Widgets/AppButton.dart';
import '../../utils/Widgets/AppText.dart';
import '../../utils/custom_widget/strings.dart';
import 'add_device_share.dart';


class ChargingSchemeView extends StatelessWidget {
  const ChargingSchemeView({Key? key}) : super(key: key);

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
          text: "${MyStrings.schematicofcharging.tr}",
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
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.start,
            children: [

              AppText(
                  text: "${MyStrings.mattersneedattention.tr}",
                  size: AppDimensions.FONT_SIZE_14,
                  fontWeight: FontWeight.w500,
                  color: MyColor.primaryColor,
                  textAlign: TextAlign.center,
                ),
              SizedBox(height: 20,),
              AppText(
                text: "${MyStrings.batteryChargingInstructions.tr}",
                size: AppDimensions.FONT_SIZE_12,
                fontWeight: FontWeight.w500,
                color: MyColor.primaryColor,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 20,),
              Container(
               // margin: EdgeInsets.symmetric(horizontal: 40),
                padding: EdgeInsets.symmetric(vertical: 80),
                decoration: BoxDecoration(
                  color: MyColor.lineColor,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              // Container that will stay at bottom
            ],
          ),
        ),
      ),
    );
  }

}
