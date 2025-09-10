import 'package:campro/utils/custom_widget/my_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../utils/Fonts/AppDimensions.dart';
import '../../utils/Images/my_images.dart';
import '../../utils/Paddings/AppPaddings.dart';
import '../../utils/Widgets/AppButton.dart';
import '../../utils/Widgets/AppText.dart';
import '../../utils/custom_widget/custom_text_field.dart';
import '../../utils/custom_widget/strings.dart';
import '../qr_scanner/qr_scanner_view.dart';
import 'motion_detection_view.dart';

class AddDeviceEnterAccount extends StatelessWidget {
  const AddDeviceEnterAccount({Key? key}) : super(key: key);

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
          text: "${MyStrings.enteraccount.tr}",
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
                children: [
                  CustomTextField(
                    animatedLabel: false,
                    needOutlineBorder: true,
                    //labelText: "",
                    autofillHints: [AutofillHints.email],
                    fillColor: MyColor.fillcolor,
                    hintText:  MyStrings.pleaseentertheotherpartysaccount.tr ,
                    //controller: controller.emailController,
                    //focusNode: controller.emailFocusNode,
                    hintTextStyle: TextStyle(color: MyColor.hinttext,fontSize: 12),
                    //nextFocus: controller.passwordFocusNode,
                    textInputType: TextInputType.emailAddress,
                    radius: 15,
                    inputAction: TextInputAction.next,
                    prefixIcon: Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      child: Icon(
                        Icons.account_balance_wallet_rounded,
                        color: MyColor.secondaryColor,
                        size: 20,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return null;
                      }

                      // If not empty, check if it's a valid email
                      if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value.trim())) {
                        return MyStrings.emailvalidationtext.tr;
                      }

                      return null;
                    },
                    onChanged: (value) {
                      return;
                    },
                  ),
                ],
              ),
            ),
          ),

          // Centered "No contacts" text
          Expanded(
            child: Center(
              child: AppText(
                text: MyStrings.nodata.tr,
                size: AppDimensions.FONT_SIZE_16,
                fontWeight: FontWeight.w400,
                color: MyColor.hintTextColor,
              ),
            ),
          ),

          Padding(
            padding: AppPaddings.defaultPadding,
            child: AppButton(
              buttonName: MyStrings.search.tr,
              onTap: () {
                // Google sign in logic
              },
              buttonColor: MyColor.secondaryColor,
              textColor: MyColor.colorWhite,
              borderColor: const Color(0xFFE0E0E0),
              borderWidth: 1,
              isCenter: true,
              hasShadow: false,
              isSuffix: false,
              iconSize: 20,
              textSize: 14, // Adjust based on your needs
              fontWeight: FontWeight.w500,
              fontFamily: "Work Sans", // Or your preferred font family
            ),
          ),
          SizedBox(height: 40,),
        ],
      ),
    );
  }
}
