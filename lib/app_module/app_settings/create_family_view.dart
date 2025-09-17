import 'package:campro/utils/custom_widget/my_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/Fonts/AppDimensions.dart';
import '../../utils/Widgets/AppButton.dart';
import '../../utils/Widgets/AppText.dart';
import '../../utils/custom_widget/custom_text_field.dart';
import '../../utils/custom_widget/strings.dart';
import 'member_information_view.dart';


class CreateFamilyView extends StatelessWidget {
  const CreateFamilyView({Key? key}) : super(key: key);

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
          text: "${MyStrings.createfamily.tr}",
          size: AppDimensions.FONT_SIZE_16,
          fontWeight: FontWeight.w600,
          color: MyColor.primaryColor,
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: MyColor.transparentColor,

        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Scrollable content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
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
                      child:  Column(
                        children: [
                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              Get.dialog(
                                Dialog(
                                  backgroundColor: MyColor.colorWhite,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        // Title
                                        AppText(
                                          text: MyStrings.familyname.tr,
                                          size: AppDimensions.FONT_SIZE_16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                        const SizedBox(height: 16),

                                        // TextField with clear button
                                        CustomTextField(
                                          animatedLabel: false,
                                          needOutlineBorder: true,
                                          autofillHints: [AutofillHints.email],
                                          fillColor: MyColor.fillcolor,
                                          hintText:  MyStrings.emailhinttext.tr ,
                                          hintTextStyle: TextStyle(color: MyColor.hinttext),
                                          textInputType: TextInputType.emailAddress,
                                          radius: 15,
                                          inputAction: TextInputAction.next,
                                          // suffixSvgIcon: MyImages.close,
                                          // suffixSvgColor: MyColor.rideBorderColor,
                                          // clearTextOnSuffixTap: true,
                                          // suffixSvgSize: 5,
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

                                        const SizedBox(height: 20),
                                        const Divider(height: 1, thickness: 1),

                                        // Action buttons
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            TextButton(
                                              onPressed: () => Get.back(),
                                              child:  Text(
                                                MyStrings.cancel.tr,
                                                style: TextStyle(color: Colors.black),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                // confirm logic
                                                Get.back();
                                              },
                                              child:  Text(
                                                MyStrings.ok.tr,

                                                style: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppText(
                                  text: MyStrings.familyname.tr,
                                  size: AppDimensions.FONT_SIZE_14,
                                  fontWeight: FontWeight.w500,
                                  color: MyColor.primaryColor,
                                ),
                                Icon(Icons.chevron_right, color: MyColor.hintTextColor),
                              ],
                            ),
                          ),

                          SizedBox(height: 10,),
                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              Get.dialog(
                                Dialog(
                                  backgroundColor: MyColor.colorWhite,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        // Title
                                        AppText(
                                          text: MyStrings.familylocation.tr,
                                          size: AppDimensions.FONT_SIZE_16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                        const SizedBox(height: 16),

                                        // TextField with clear button
                                        CustomTextField(
                                          animatedLabel: false,
                                          needOutlineBorder: true,
                                          autofillHints: [AutofillHints.email],
                                          fillColor: MyColor.fillcolor,
                                          // hintText:  MyStrings.emailhinttext.tr ,
                                          hintTextStyle: TextStyle(color: MyColor.hinttext),
                                          textInputType: TextInputType.emailAddress,
                                          radius: 15,
                                          inputAction: TextInputAction.next,
                                          // suffixSvgIcon: MyImages.close,
                                          // clearTextOnSuffixTap: true,
                                          // suffixSvgColor: MyColor.rideBorderColor,
                                          // suffixSvgSize: 8,
                                          validator: (value) {
                                            if (value == null || value.trim().isEmpty) {
                                              return null;
                                            }
                                            if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value.trim())) {
                                              return MyStrings.emailvalidationtext.tr;
                                            }

                                            return null;
                                          },
                                          onChanged: (value) {
                                            return;
                                          },
                                        ),

                                        const SizedBox(height: 20),
                                        const Divider(height: 1, thickness: 1),

                                        // Action buttons
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            TextButton(
                                              onPressed: () => Get.back(),
                                              child:  Text(
                                                MyStrings.cancel.tr,
                                                style: TextStyle(color: Colors.black),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                // confirm logic
                                                Get.back();
                                              },
                                              child:  Text(
                                                MyStrings.ok.tr,

                                                style: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppText(
                                  text: MyStrings.familylocation.tr,
                                  size: AppDimensions.FONT_SIZE_14,
                                  fontWeight: FontWeight.w500,
                                  color: MyColor.primaryColor,
                                ),
                                Icon(Icons.chevron_right, color: MyColor.hintTextColor),
                              ],
                            ),
                          ),

                        ],
                      ),

                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),

            // Fixed bottom button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: AppButton(
                buttonName: MyStrings.save.tr,
                onTap: () {
                  // Search logic
                },
                buttonColor: MyColor.secondaryColor,
                textColor: MyColor.colorWhite,
                borderColor: const Color(0xFFE0E0E0),
                borderWidth: 1,
                isCenter: true,
                hasShadow: false,
                isSuffix: false,
                iconSize: 20,
                textSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: "Work Sans",
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

}

