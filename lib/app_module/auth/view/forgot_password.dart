import 'package:campro/app_module/auth/view/signup_screen.dart';
import 'package:campro/utils/Paddings/AppPaddings.dart';
import 'package:campro/utils/custom_widget/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/Fonts/AppDimensions.dart';
import '../../../utils/Images/my_images.dart';
import '../../../utils/Widgets/AppButton.dart';
import '../../../utils/Widgets/AppText.dart';
import '../../../utils/custom_widget/custom_text_field.dart';
import '../../../utils/custom_widget/my_color.dart';
import '../controller/auth_controller.dart';
import 'email_verification_screen.dart';


class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool agreeToTerms = false;
  final AuthController controller = Get.put(AuthController());

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: Image.asset(
                MyImages.backgroundimage,
                fit: BoxFit.cover,
              ),
            ),
            // Back Button - Add this here
            Positioned(
              top: 16,
              left: 16,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Get.back();
                },
                child:  Icon(
                  Icons.arrow_back_ios,
                  color: MyColor.primaryColor,
                  size: 24,
                ),

              ),
            ),
            // Bottom Sheet Content
            DraggableScrollableSheet(
              initialChildSize: 0.7,
              minChildSize: 0.5,
              maxChildSize: 0.95,
              builder: (context, scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    padding: AppPaddings.defaultPadding, // 16
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Drag handle indicator
                        Container(
                          width: 40,
                          height: 5,
                          margin: EdgeInsets.only(top: 0, bottom: 12),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),

                        const SizedBox(height: 20),
                        // Logo & Title
                        Column(
                          children: [
                            const SizedBox(height: 10),
                            AppText(
                              text: MyStrings.forgotpassword.tr,
                              size: AppDimensions.FONT_SIZE_22,
                              fontWeight: FontWeight.bold,
                              color: MyColor.primaryColor,
                            ),
                            const SizedBox(height: 20),
                            AppText(
                              text: MyStrings.enteryouremailaddress.tr,
                              size: AppDimensions.FONT_SIZE_18,
                              fontWeight: FontWeight.w600,
                              color: MyColor.primaryColor,
                            ),
                            const SizedBox(height: 4),
                            AppText(
                              text: MyStrings.pleaseenteremailaddressforyourbackupaccount.tr,
                              size: AppDimensions.FONT_SIZE_14,
                              color: MyColor.textcolorsubtitle,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),

                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            AppText(
                              text: MyStrings.emailaddress.tr,
                              size: AppDimensions.FONT_SIZE_14,
                              fontWeight: FontWeight.w500,
                              color: MyColor.primaryColor,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        // Email Field
                        CustomTextField(
                          animatedLabel: false,
                          needOutlineBorder: true,
                          autofillHints: [AutofillHints.email],
                          fillColor: MyColor.fillcolor,
                          hintText: MyStrings.enteryouremailaddress.tr,
                          controller: controller.emailController,
                          focusNode: controller.emailFocusNode,
                          hintTextStyle: TextStyle(color: MyColor.hinttext),
                          nextFocus: controller.passwordFocusNode,
                          textInputType: TextInputType.emailAddress,
                          radius: 15,
                          inputAction: TextInputAction.next,
                          prefixIcon: Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            child: Icon(
                              Icons.person,
                              color: MyColor.primaryColor,
                              size: 20,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return null;
                            }

                            // If not empty, check if it's a valid email
                            if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value.trim())) {
                              return MyStrings.emailvalidationtext.tr;
                            }

                            return null;
                          },
                          onChanged: (value) {
                            return;
                          },
                        ),
                        const SizedBox(height: 20),
                        // Sign Up Button
                        AppButton(
                          buttonName: MyStrings.continuetext.tr,
                          buttonColor:  MyColor.secondaryColor,
                          textColor: Colors.white,
                          textSize: 16,
                          fontWeight: FontWeight.w500,
                          hasShadow: false,
                          buttonWidth: double.infinity,
                          onTap:  () {
                            Get.to(() => EmailVerificationScreen());
                          },
                          elevation: 0,
                          borderWidth: 0,
                          isCenter: true,
                        ),

                        SizedBox(height: 20),

                        // Login link
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppText(
                              text: MyStrings.stillneedhelp.tr,
                              size: AppDimensions.FONT_SIZE_14,
                              fontWeight: FontWeight.w500,
                              color: MyColor.hinttext,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                Get.to(() => SignUpScreen());
                              },
                              child: AppText(
                                text: MyStrings.contactus.tr,
                                size: AppDimensions.FONT_SIZE_14,
                                fontWeight: FontWeight.bold,
                                color: MyColor.secondaryColor,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).padding.bottom + 20),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }


}





