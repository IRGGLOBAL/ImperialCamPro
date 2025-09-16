import 'package:campro/utils/custom_widget/my_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/Fonts/AppDimensions.dart';
import '../../utils/Images/my_images.dart';
import '../../utils/Widgets/AppText.dart';
import '../../utils/custom_widget/custom_text_field.dart';
import '../../utils/custom_widget/strings.dart';
import '../auth/controller/auth_controller.dart';
import 'member_information_view.dart';


class FamilySettings extends StatelessWidget {
   FamilySettings({Key? key}) : super(key: key);

  final AuthController controller = Get.put(AuthController());

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
          text: "${MyStrings.familysettings.tr}",
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
                                  controller: controller.passwordController,
                                  animatedLabel: false,
                                  needOutlineBorder: true,
                                  autofillHints: [AutofillHints.email],
                                  fillColor: MyColor.fillcolor,
                                  hintText:  MyStrings.emailhinttext.tr ,
                                  hintTextStyle: TextStyle(color: MyColor.hinttext),
                                  textInputType: TextInputType.emailAddress,
                                  radius: 15,
                                  inputAction: TextInputAction.next,
                                  suffixSvgIcon: MyImages.close,
                                  suffixSvgColor: MyColor.rideBorderColor,
                                  clearTextOnSuffixTap: true,
                                  suffixSvgSize: 5,
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
                                  controller: controller.emailController,
                                  animatedLabel: false,
                                  needOutlineBorder: true,
                                  autofillHints: [AutofillHints.email],
                                  fillColor: MyColor.fillcolor,
                                 // hintText:  MyStrings.emailhinttext.tr ,
                                  hintTextStyle: TextStyle(color: MyColor.hinttext),
                                  textInputType: TextInputType.emailAddress,
                                  radius: 15,
                                  inputAction: TextInputAction.next,
                                  suffixSvgIcon: MyImages.close,
                                  clearTextOnSuffixTap: true,
                                  suffixSvgColor: MyColor.rideBorderColor,
                                  suffixSvgSize: 8,
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
            const SizedBox(height: 10),

            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: (){
                Get.to(MemberInformationView());
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: "${MyStrings.familymember.tr} (1)",
                      size: AppDimensions.FONT_SIZE_14,
                      fontWeight: FontWeight.w500,
                      color: MyColor.primaryColor,
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Container(
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
                        const SizedBox(width: 12),
                        Expanded(
                          child:  Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  AppText(
                                    text: MyStrings.name.tr,
                                    size: AppDimensions.FONT_SIZE_16,
                                    fontWeight: FontWeight.w600,
                                    color: MyColor.primaryColor,
                                  ),
                                  Row(
                                    children: [
                                      AppText(
                                        text: MyStrings.familyowner.tr,
                                        size: AppDimensions.FONT_SIZE_10,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                      SizedBox(width: 5,),
                                      const Icon(Icons.chevron_right, color: Colors.black,size: 16,),

                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              AppText(
                                text: MyStrings.email.tr,
                                size: AppDimensions.FONT_SIZE_14,
                                fontWeight: FontWeight.w500,
                                color: MyColor.primaryColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 10,),

            AppText(
              text: MyStrings.myfamily.tr,
              size: AppDimensions.FONT_SIZE_14,
              fontWeight: FontWeight.w500,
              color: MyColor.primaryColor,
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

}
