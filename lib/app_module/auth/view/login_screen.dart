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
import '../../../utils/custom_widget/round_button.dart';
import '../controller/auth_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool agreeToTerms = false;
  final AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: AppPaddings.defaultPadding,//16
          //padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              const SizedBox(height: 40),
              // Logo & Title
              Column(
                children: [
                  SvgPicture.asset(
                    MyImages.appLogo,
                    height: 60,
                        ),
                  const SizedBox(height: 10),
                  AppText(
                    text: MyStrings.signupnow.tr,
                    size: AppDimensions.FONT_SIZE_22, // or use 14 directly
                    fontWeight: FontWeight.w500,
                    color: MyColor.primaryColor,
                  ),
                  const SizedBox(height: 4),
                  AppText(
                    text: MyStrings.beginyourjourneytoday.tr,
                    size: AppDimensions.FONT_SIZE_14, // or use 14 directly
                    color: MyColor.textcolorsubtitle,
                  ),

                ],
              ),

              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppText(
                    text: MyStrings.emailuserid.tr,
                    size: AppDimensions.FONT_SIZE_14, // or use 14 directly
                    fontWeight: FontWeight.w500,
                    color: MyColor.primaryColor,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              const SizedBox(height: 5),
              // Email Field
              CustomTextField(
                animatedLabel: false,
                needOutlineBorder: true,
                //labelText: "",
                autofillHints: [AutofillHints.email],
                hintText:  MyStrings.emailhinttext.tr ,
                controller: controller.emailController,
                focusNode: controller.emailFocusNode,
                hintTextStyle: TextStyle(color: MyColor.hinttext),
                nextFocus: controller.passwordFocusNode,
                textInputType: TextInputType.emailAddress,
                radius: 15,
                inputAction: TextInputAction.next,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppText(
                    text: MyStrings.password.tr,
                    size: AppDimensions.FONT_SIZE_14, // or use 14 directly
                    fontWeight: FontWeight.w500,
                    color: MyColor.primaryColor,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),

              const SizedBox(height: 5),
              // Password Field
              CustomTextField(
                animatedLabel: false,
                needOutlineBorder: true,
                //labelText: "",
                autofillHints: [AutofillHints.email],
                radius: 15,
                hintText:  MyStrings.passwordhinttext.tr ,
                hintTextStyle: TextStyle(color: MyColor.hinttext),
                controller: controller.passwordController,
                focusNode: controller.passwordFocusNode,
                //nextFocus: false,
                textInputType: TextInputType.emailAddress,
                inputAction: TextInputAction.next,
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
              //const SizedBox(height: 5),

              // Terms & Conditions Checkbox
              Row(
                children: [
                  Checkbox(
                    value: agreeToTerms,
                    onChanged: (val) {
                      setState(() {
                        agreeToTerms = val ?? false;
                      });
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                   Flexible(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: MyStrings.agreeto.tr,
                            style: TextStyle(fontSize: 14),
                          ),
                          TextSpan(
                            text: MyStrings.termsandconditions.tr,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // Sign Up Button
              AppButton(
                buttonName: MyStrings.signup.tr,
                buttonColor: agreeToTerms ? Colors.red : Colors.grey, // Handle disabled state
                textColor: Colors.white,
                textSize: 16,
                fontWeight: FontWeight.w500,
                hasShadow: false,
                buttonWidth: double.infinity, // Full width
                onTap: agreeToTerms ? () {
                  // Navigate or call sign up logic
                } : () {},
                elevation: 0, // Remove shadow to match RoundedButton's elevation: 0
                borderWidth: 0, // No border
                isCenter: true, // Center the text
              ),
              const SizedBox(height: 14),

              // Google Sign-In Button
              AppButton(
                buttonName: MyStrings.signupwithgoogle.tr,
                onTap: () {
                  // Google sign in logic
                },
               // buttonWidth: double.infinity,
                buttonColor: Colors.transparent,
                textColor: Colors.black,
                borderColor: const Color(0xFFE0E0E0),
                borderWidth: 1,
                isCenter: true,
                hasShadow: false,
                isIcon: true,
                isSuffix: false,
                iconImage: MyImages.googleicon,
                iconSize: 20,
                textSize: 14, // Adjust based on your needs
                fontWeight: FontWeight.w500,
                fontFamily: "Work Sans", // Or your preferred font family
              ),
              // RoundedButton(
              //   text: MyStrings.signupwithgoogle.tr,
              //   press: () {
              //     // Google sign in logic
              //   },
              //   isOutlined: true,
              //   borderColor: const Color(0xFFE0E0E0),
              //   color: Colors.transparent,
              //   textColor: Colors.black,
              //   // horizontalPadding: 0,
              //   // verticalPadding: 16,
              //   // cornerRadius: 30,
              //   textStyle: TextStyle(
              //     fontWeight: FontWeight.w500,
              //     color: Colors.black,
              //   ),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       SvgPicture.asset(
              //         MyImages.googleicon,
              //         height: 20,
              //       ),
              //       const SizedBox(width: 8), // Add some spacing between icon and text
              //       Text(
              //         MyStrings.signupwithgoogle.tr,
              //         style: TextStyle(
              //           fontWeight: FontWeight.w500,
              //           color: Colors.black,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

               SizedBox(height: 20),

              // Login link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text(
                    MyStrings.alreadyhaveaccount.tr,
                    style: TextStyle(color: Colors.black54),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigate to login
                    },
                    child:  Text(
                      MyStrings.login.tr,
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}





