import 'package:campro/app_module/auth/view/signup_screen.dart';
import 'package:campro/utils/Images/my_images.dart';
import 'package:campro/utils/Paddings/AppPaddings.dart';
import 'package:campro/utils/custom_widget/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/Fonts/AppDimensions.dart';
import '../../../utils/Widgets/AppButton.dart';
import '../../../utils/Widgets/AppText.dart';
import '../../../utils/custom_widget/custom_text_field.dart';
import '../../../utils/custom_widget/my_color.dart';
import '../controller/auth_controller.dart';


class ResetPasswordConfirmationScreen extends StatefulWidget {
  const ResetPasswordConfirmationScreen({super.key});

  @override
  State<ResetPasswordConfirmationScreen> createState() => _ResetPasswordConfirmationScreenState();
}

class _ResetPasswordConfirmationScreenState extends State<ResetPasswordConfirmationScreen> {
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
              initialChildSize: 0.8, // Adjust this value as needed
              minChildSize: 0.5, // Minimum size when dragged up
              maxChildSize: 0.95, // Maximum size when dragged down
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

                        const SizedBox(height: 40),
                        // Logo & Title
                            Image.asset(
                              MyImages.confirmpassword,
                              height: 100,
                            ),
                            const SizedBox(height: 10),
                            AppText(
                              text: MyStrings.allsetdonegoodjob.tr,
                              size: AppDimensions.FONT_SIZE_22,
                              fontWeight: FontWeight.w500,
                              color: MyColor.primaryColor,
                            ),
                            const SizedBox(height: 4),
                            AppText(
                                text: MyStrings.backtohomeandloginyouraccount.tr,
                                size: AppDimensions.FONT_SIZE_14,
                                color: MyColor.textcolorsubtitle,
                                textAlign: TextAlign.center
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
                          onTap: () {},
                          elevation: 0,
                          borderWidth: 0,
                          isCenter: true,
                        ),
                        const SizedBox(height: 40),

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
                            HyperTxt(
                              text: MyStrings.contactus.tr,
                              size: AppDimensions.FONT_SIZE_14,
                              fontWeight: FontWeight.bold,
                              color: MyColor.secondaryColor,
                              onTap: (){
                                Get.to(SignUpScreen());
                              },
                            ),
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





