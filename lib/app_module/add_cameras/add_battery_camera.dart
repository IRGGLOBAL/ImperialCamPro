import 'package:campro/app_module/camera_settings/camera_setting_controller.dart';
import 'package:campro/utils/custom_widget/my_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../utils/Fonts/AppDimensions.dart';
import '../../utils/Images/my_images.dart';
import '../../utils/Widgets/AppButton.dart';
import '../../utils/Widgets/AppText.dart';
import '../../utils/custom_widget/custom_text_field.dart';
import '../../utils/custom_widget/strings.dart';
import '../camera_settings/common_router_setup.dart';
import '../manually_enter_camera/manual_entry.dart';

class AddBatteryCamera extends StatelessWidget {
  AddBatteryCamera({Key? key}) : super(key: key);
int index1=0;
int index2=0;
  final CameraSettingController controller = Get.put(CameraSettingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        title: AppText(
          text: MyStrings.addbatterycamera.tr,
          size: AppDimensions.FONT_SIZE_16,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),

      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              AppText(
                text: MyStrings.selectWifiInstruction,
                size: AppDimensions.FONT_SIZE_16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 0),

              /// Wi-Fi toggle SVGs (2.4 GHz / 5 GHz)
              Center(
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: SvgPicture.asset(
                    "assets/images/add_camera.svg",
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              const SizedBox(height: 40),
              AppText(
                text: MyStrings.deviceNotWorkWith5G,
                size: AppDimensions.FONT_SIZE_12,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                textAlign: TextAlign.start,
              ),

              const SizedBox(height: 10),

              /// Router setup
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Get.to(CommonRouterSetupScreen());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: MyStrings.commonRouterSetup,
                      size: AppDimensions.FONT_SIZE_16,
                      fontWeight: FontWeight.w500,
                      color: MyColor.primaryColor,
                    ),
                    Icon(Icons.chevron_right, color: Colors.grey),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// Wi-Fi name field
              CustomTextField(
                animatedLabel: false,
                needOutlineBorder: true,
                autofillHints: [AutofillHints.email],
                radius: 15,
                fillColor: MyColor.fillcolor,
                hintText: MyStrings.wifiNameHint,
                hintTextStyle: TextStyle(color: MyColor.hinttext, fontWeight: FontWeight.w400),
                controller: controller.wifiNameController,
                isPassword: false,
                isShowSuffixIcon: true,
                textInputType: TextInputType.emailAddress,
                inputAction: TextInputAction.next,
                isborderNone: false,
                suffixWidget: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    controller.openWifiSettings();
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0,14,20,14),
                    child: SizedBox(
                      width: 12,
                      height: 12,
                      child: SvgPicture.asset(
                        MyImages.switchnetwork,
                        color: MyColor.hinttext,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                onChanged: (value) {},
              ),

              const SizedBox(height: 12),

              /// Wi-Fi password field
              CustomTextField(
                animatedLabel: false,
                needOutlineBorder: true,
                autofillHints: [AutofillHints.email],
                radius: 15,
                fillColor: MyColor.fillcolor,
                hintText: MyStrings.wifiPasswordHint,
                hintTextStyle: TextStyle(color: MyColor.hinttext,fontWeight: FontWeight.w400),
                controller: controller.wifiPasswordController,
                textInputType: TextInputType.emailAddress,
                inputAction: TextInputAction.next,
                isborderNone: false,
                isPassword: true,
                isShowSuffixIcon: true,
                onChanged: (value) {},
              ),

              const SizedBox(height: 30),

              /// Next button
              AppButton(
                buttonName: MyStrings.next.tr,
                buttonColor: Colors.red,
                textColor: Colors.white,
                textSize: 16,
                fontWeight: FontWeight.w600,
                hasShadow: false,
                onTap: () {
                  Get.to(ManualEntry());
                },
                elevation: 0,
                borderWidth: 0,
                isCenter: true,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      // Padding(
      //   padding: const EdgeInsets.all(16),
      //   child: SingleChildScrollView(
      //    // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         const SizedBox(height: 10),
      //         AppText(
      //           text: "Select a 2.4GHz WIFI network and enter your password.",
      //           size: AppDimensions.FONT_SIZE_16,
      //           fontWeight: FontWeight.w500,
      //           color: Colors.black,
      //           textAlign: TextAlign.start,
      //         ),
      //         const SizedBox(height: 0),
      //
      //         /// Wi-Fi toggle SVGs (2.4 GHz / 5 GHz)
      //         Center(
      //           child: SvgPicture.asset(
      //             "assets/images/add_camera.svg", // your svg path
      //             height: 200,
      //           ),
      //         ),
      //
      //
      //         const SizedBox(height: 40),
      //         AppText(
      //           text: "This Device Does Not Work with 5G Wifi Networks",
      //           size: AppDimensions.FONT_SIZE_12,
      //           fontWeight: FontWeight.w500,
      //           color: Colors.black,
      //           textAlign: TextAlign.start,
      //
      //         ),
      //
      //         const SizedBox(height: 10),
      //
      //         /// Router setup
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             AppText(
      //               text: "Common Router Setup Methods",
      //               size: AppDimensions.FONT_SIZE_16,
      //               fontWeight: FontWeight.w500,
      //               color: MyColor.primaryColor,
      //               onTap: () {
      //                 Get.to(CommonRouterSetupScreen());
      //               },
      //             ),
      //             Icon(Icons.chevron_right, color: Colors.grey),
      //           ],
      //         ),
      //
      //         const SizedBox(height: 20),
      //
      //         /// Wi-Fi name field
      //         CustomTextField(
      //           animatedLabel: false,
      //           needOutlineBorder: true,
      //           autofillHints: [AutofillHints.email],
      //           radius: 15,
      //           fillColor: MyColor.fillcolor,
      //           hintText: "IRG Global",
      //           hintTextStyle: TextStyle(color: MyColor.hinttext, fontWeight: FontWeight.w400),
      //           controller: controller.wifiNameController,
      //           //focusNode: controller.passwordFocusNode,
      //           isPassword: false,
      //           isShowSuffixIcon: true,
      //           textInputType: TextInputType.emailAddress,
      //           inputAction: TextInputAction.next,
      //           isborderNone: false,
      //           suffixWidget: GestureDetector(
      //             onTap: () {
      //              controller. openWifiSettings();
      //             },
      //             child: Container(
      //               height: 10,
      //               width: 10,
      //               padding: EdgeInsets.fromLTRB(0,14,20,14),
      //               child: SvgPicture.asset(
      //                 MyImages.switchnetwork,
      //                 color: MyColor.hinttext,
      //               ),
      //             ),
      //           ),
      //           onChanged: (value) {
      //             // Handle text changes if needed
      //           },
      //         ),
      //
      //         const SizedBox(height: 12),
      //
      //         /// Wi-Fi password field
      //         CustomTextField(
      //           animatedLabel: false,
      //           needOutlineBorder: true,
      //           autofillHints: [AutofillHints.email],
      //           radius: 15,
      //           fillColor: MyColor.fillcolor,
      //           hintText: "Input Wi-Fi Password",
      //           hintTextStyle: TextStyle(color: MyColor.hinttext,fontWeight: FontWeight.w400),
      //           controller: controller.wifiNameController,
      //           //focusNode: controller.passwordFocusNode,
      //           textInputType: TextInputType.emailAddress,
      //           inputAction: TextInputAction.next,
      //           isborderNone: false, // Don't use no border
      //           isPassword: true,
      //           isShowSuffixIcon: true,
      //           onChanged: (value) {
      //             // Handle text changes if needed
      //           },
      //         ),
      //
      //
      //         const Spacer(),
      //
      //         /// Next button
      //         AppButton(
      //           buttonName: "Next",
      //           buttonColor: Colors.red,
      //           textColor: Colors.white,
      //           textSize: 16,
      //           fontWeight: FontWeight.w600,
      //           hasShadow: false,
      //           onTap: () {
      //             Get.to(ManualEntry());
      //           },
      //           elevation: 0,
      //           borderWidth: 0,
      //           isCenter: true,
      //         ),
      //         const SizedBox(height: 20),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
