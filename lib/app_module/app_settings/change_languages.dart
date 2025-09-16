import 'package:campro/app_module/camera_settings/camera_setting_controller.dart';
import 'package:campro/utils/custom_widget/my_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/Fonts/AppDimensions.dart';
import '../../utils/Paddings/AppPaddings.dart';
import '../../utils/Widgets/AppText.dart';
import '../../utils/custom_widget/strings.dart';


class ChangeLanguages extends StatelessWidget {
  ChangeLanguages({Key? key}) : super(key: key);

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
          text: MyStrings.language.tr,
          size: AppDimensions.FONT_SIZE_16,
          fontWeight: FontWeight.w600,
          color: MyColor.primaryColor,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: AppText(
              text: "${MyStrings.done.tr}",
              size: AppDimensions.FONT_SIZE_14,
              fontWeight: FontWeight.w500,
              color: MyColor.secondaryColor,
              onTap: (){
               // Get.to(MyOrders());
              },
            ),
          ),
        ],
        backgroundColor: Colors.white,
        surfaceTintColor: MyColor.transparentColor,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: AppPaddings.defaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 20),
            // Choose Mode card
            Container(
              padding: const EdgeInsets.all(16),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // AppText(
                  //   text: MyStrings.followthesystem.tr,
                  //   size: AppDimensions.FONT_SIZE_14,
                  //   fontWeight: FontWeight.w500,
                  //   color: MyColor.primaryColor,
                  // ),
                  // const SizedBox(height: 20),
                  // Divider(thickness: 0.5,color: MyColor.borderColor,),
                  // Radio options with Obx

                  Column(
                    children: [
                      _buildRadioOption(
                        title: MyStrings.followthesystem.tr,
                      ),
                      Divider(thickness: 0.5,color: MyColor.borderColor,),
                      _buildRadioOption(
                        title:  MyStrings.english.tr,
                      ),
                      Divider(thickness: 0.5,color: MyColor.borderColor,),
                      _buildRadioOption(
                        title:  MyStrings.chinese.tr,
                      ),
                      Divider(thickness: 0.5,color: MyColor.borderColor,),
                      _buildRadioOption(
                        title:  MyStrings.francais.tr,
                      ),
                      Divider(thickness: 0.5,color: MyColor.borderColor,),
                      _buildRadioOption(
                        title:  MyStrings.deutsch.tr,
                      ),
                      Divider(thickness: 0.5,color: MyColor.borderColor,),
                      _buildRadioOption(
                        title:  MyStrings.espanol.tr,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRadioOption({
    required String title,
  }) {
    return InkWell(
      onTap: () => c.changeMode(title),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Texts
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: title,
                  size: AppDimensions.FONT_SIZE_14,
                  fontWeight: FontWeight.w500,
                  color: MyColor.primaryColor,
                ),
                const SizedBox(height: 4),
              ],
            ),
          ),
          // check button
          Obx(() => Checkbox(
            value: c.selectedMode.value == title, // Compare with current selected mode
            onChanged: (val) {
              if (val != null && val) {
                c.changeMode(title); // Only change mode when checked (val is true)
              }
            },
            shape: const CircleBorder(),
            side: const BorderSide(
              color: Colors.grey,
              width: 1.5,
            ),
            activeColor: MyColor.primaryColor, // Use your app's primary color
            checkColor: Colors.white,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          )),

        ],
      ),
    );
  }
}
