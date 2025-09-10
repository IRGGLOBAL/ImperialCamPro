import 'package:campro/app_module/auth/view/reset_password_screen.dart';
import 'package:campro/app_module/auth/view/signup_screen.dart';
import 'package:campro/utils/Paddings/AppPaddings.dart';
import 'package:campro/utils/custom_widget/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../utils/Fonts/AppDimensions.dart';
import '../../../utils/Images/my_images.dart';
import '../../../utils/Widgets/AppButton.dart';
import '../../../utils/Widgets/AppText.dart';
import '../../../utils/custom_widget/my_color.dart';
import '../controller/auth_controller.dart';


class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {

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
                              text: MyStrings.verifyyouridentityusingyourauthenticatorapp.tr,
                              size: AppDimensions.FONT_SIZE_18,
                              fontWeight: FontWeight.w600,
                              color: MyColor.primaryColor,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 4),
                            AppText(
                              text: MyStrings.enterfourdigitcodeforautenticationapp.tr,
                              size: AppDimensions.FONT_SIZE_14,
                              color: MyColor.textcolorsubtitle,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),

                        const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: PinCodeTextField(
                            appContext: context,
                            length: 4, // Number of OTP digits
                            keyboardType: TextInputType.number,
                            animationType: AnimationType.none,
                            textStyle: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: MyColor.primaryColor
                            ),
                           // scrollPadding: EdgeInsets.symmetric(horizontal: 0),
                            cursorColor: MyColor.secondaryColor,
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.underline,
                              borderRadius: BorderRadius.zero,
                              fieldHeight: 60,
                              fieldWidth: 40,
                              activeColor: MyColor.shadowColor,
                              selectedColor: MyColor.secondaryColor,
                              inactiveColor: MyColor.shadowColor,
                            ),
                            onChanged: (value) {
                              print(value);
                            },
                          ),
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
                            Get.to(ResetPasswordScreen());
                          },
                          elevation: 0,
                          borderWidth: 0,
                          isCenter: true,
                        ),

                        SizedBox(height: 40),

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
                              onTap: () {
                                Get.to(SignUpScreen());
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





