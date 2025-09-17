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
import 'forgot_password.dart';


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

                        const SizedBox(height: 20),
                        // Logo & Title
                        Column(
                          children: [
                            const SizedBox(height: 10),
                            AppText(
                              text: MyStrings.logintoaccount.tr,
                              size: AppDimensions.FONT_SIZE_22,
                              fontWeight: FontWeight.w500,
                              color: MyColor.primaryColor,
                            ),
                            const SizedBox(height: 4),
                            AppText(
                              text: MyStrings.welcomebackpleaselogintocontinue.tr,
                              size: AppDimensions.FONT_SIZE_14,
                              color: MyColor.textcolorsubtitle,
                            ),
                          ],
                        ),

                        const SizedBox(height: 30),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            AppText(
                              text: MyStrings.userid.tr,
                              size: AppDimensions.FONT_SIZE_14,
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
                          autofillHints: [AutofillHints.email],
                          fillColor: MyColor.fillcolor,
                          hintText: MyStrings.enteruserid.tr,
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

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            AppText(
                              text: MyStrings.password.tr,
                              size: AppDimensions.FONT_SIZE_14,
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
                          autofillHints: [AutofillHints.email],
                          radius: 15,
                          fillColor: MyColor.fillcolor,
                          hintText: MyStrings.passwordhinttext.tr,
                          hintTextStyle: TextStyle(color: MyColor.hinttext),
                          controller: controller.passwordController,
                          focusNode: controller.passwordFocusNode,
                          isPassword: true,
                          isShowSuffixIcon: true,
                          textInputType: TextInputType.emailAddress,
                          inputAction: TextInputAction.next,
                          prefixIcon: Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            child: Icon(
                              Icons.lock,
                              color: MyColor.primaryColor,
                              size: 18,
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
                              side: MaterialStateBorderSide.resolveWith(
                                    (states) => BorderSide(
                                  width: 2,
                                  color: states.contains(MaterialState.selected)
                                      ? MyColor.secondaryColor
                                      : MyColor.checkboxborder,
                                ),
                              ),
                              checkColor: MyColor.colorWhite,
                              activeColor: MyColor.secondaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            Flexible(
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: MyStrings.remembermeandkeeplogin.tr,
                                      style: TextStyle(
                                          fontSize: 14, color: MyColor.hinttext),
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
                          buttonName: MyStrings.login.tr,
                          buttonColor: agreeToTerms
                              ? MyColor.secondaryColor
                              : Colors.grey,
                          textColor: Colors.white,
                          textSize: 16,
                          fontWeight: FontWeight.w500,
                          hasShadow: false,
                          buttonWidth: double.infinity,
                          onTap: agreeToTerms
                              ? () {
                            // Navigate or call sign up logic
                          }
                              : () {},
                          elevation: 0,
                          borderWidth: 0,
                          isCenter: true,
                        ),
                        const SizedBox(height: 14),

                        // Google Sign-In Button
                        AppButton(
                          buttonName: MyStrings.loginwithgoogle.tr,
                          onTap: () {
                            // Google sign in logic
                          },
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
                          textSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Work Sans",
                        ),

                        SizedBox(height: 20),
                        HyperTxt(
                          text: MyStrings.forgottenpassword.tr,
                          size: AppDimensions.FONT_SIZE_14,
                          fontWeight: FontWeight.bold,
                          color: MyColor.secondaryColor,
                          onTap: (){
                            Get.to(() => ForgotPassword());
                          },
                        ),
                        // Login link
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppText(
                              text: MyStrings.donthaveanaccount.tr,
                              size: AppDimensions.FONT_SIZE_14,
                              fontWeight: FontWeight.w500,
                              color: MyColor.hinttext,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            HyperTxt(
                              text: MyStrings.signup.tr,
                              size: AppDimensions.FONT_SIZE_14,
                              fontWeight: FontWeight.bold,
                              color: MyColor.secondaryColor,
                              onTap: (){
                                Get.to(() => SignUpScreen());
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
  // Widget build(BuildContext context) {
  //
  //   return Scaffold(
  //     backgroundColor: Colors.white,
  //     body: SafeArea(
  //       child: SingleChildScrollView(
  //         padding: AppPaddings.defaultPadding,//16
  //         //padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //
  //             const SizedBox(height: 40),
  //             // Logo & Title
  //             Column(
  //               children: [
  //
  //                 const SizedBox(height: 10),
  //                 AppText(
  //                   text: MyStrings.logintoaccount.tr,
  //                   size: AppDimensions.FONT_SIZE_22, // or use 14 directly
  //                   fontWeight: FontWeight.w500,
  //                   color: MyColor.primaryColor,
  //                 ),
  //                 const SizedBox(height: 4),
  //                 AppText(
  //                   text: MyStrings.welcomebackpleaselogintocontinue.tr,
  //                   size: AppDimensions.FONT_SIZE_14, // or use 14 directly
  //                   color: MyColor.textcolorsubtitle,
  //                 ),
  //
  //               ],
  //             ),
  //
  //             const SizedBox(height: 30),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               children: [
  //                 AppText(
  //                   text: MyStrings.userid.tr,
  //                   size: AppDimensions.FONT_SIZE_14, // or use 14 directly
  //                   fontWeight: FontWeight.w500,
  //                   color: MyColor.primaryColor,
  //                   textAlign: TextAlign.left,
  //                 ),
  //               ],
  //             ),
  //             const SizedBox(height: 5),
  //             // Email Field
  //             CustomTextField(
  //               animatedLabel: false,
  //               needOutlineBorder: true,
  //               //labelText: "",
  //               autofillHints: [AutofillHints.email],
  //               fillColor: MyColor.fillcolor,
  //               hintText:  MyStrings.enteruserid.tr ,
  //               controller: controller.emailController,
  //               focusNode: controller.emailFocusNode,
  //               hintTextStyle: TextStyle(color: MyColor.hinttext),
  //               nextFocus: controller.passwordFocusNode,
  //               textInputType: TextInputType.emailAddress,
  //               radius: 15,
  //               inputAction: TextInputAction.next,
  //               validator: (value) {
  //                 if (value == null || value.trim().isEmpty) {
  //                   return null;
  //                 }
  //
  //                 // If not empty, check if it's a valid email
  //                 if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value.trim())) {
  //                   return MyStrings.emailvalidationtext.tr;
  //                 }
  //
  //                 return null;
  //               },
  //               onChanged: (value) {
  //                 return;
  //               },
  //             ),
  //             const SizedBox(height: 20),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               children: [
  //                 AppText(
  //                   text: MyStrings.password.tr,
  //                   size: AppDimensions.FONT_SIZE_14, // or use 14 directly
  //                   fontWeight: FontWeight.w500,
  //                   color: MyColor.primaryColor,
  //                   textAlign: TextAlign.left,
  //                 ),
  //               ],
  //             ),
  //
  //             const SizedBox(height: 5),
  //             // Password Field
  //             CustomTextField(
  //               animatedLabel: false,
  //               needOutlineBorder: true,
  //               //labelText: "",
  //               autofillHints: [AutofillHints.email],
  //               radius: 15,
  //               fillColor: MyColor.fillcolor,
  //               hintText:  MyStrings.passwordhinttext.tr ,
  //               hintTextStyle: TextStyle(color: MyColor.hinttext),
  //               controller: controller.passwordController,
  //               focusNode: controller.passwordFocusNode,
  //               isPassword: true, // Add this to enable password mode
  //               isShowSuffixIcon: true,
  //               //nextFocus: false,
  //               textInputType: TextInputType.emailAddress,
  //               inputAction: TextInputAction.next,
  //               validator: (value) {
  //                 if (value == null || value.trim().isEmpty) {
  //                   return null;
  //                 }
  //
  //                 // If not empty, check if it's a valid email
  //                 if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value.trim())) {
  //                   return MyStrings.emailvalidationtext.tr;
  //                 }
  //
  //                 return null;
  //               },
  //               onChanged: (value) {
  //                 return;
  //               },
  //             ),
  //             //const SizedBox(height: 5),
  //
  //             // Terms & Conditions Checkbox
  //             Row(
  //               children: [
  //                 Checkbox(
  //                   value: agreeToTerms,
  //                   onChanged: (val) {
  //                     setState(() {
  //                       agreeToTerms = val ?? false;
  //                     });
  //                   },
  //                   side: MaterialStateBorderSide.resolveWith(
  //                         (states) => BorderSide(
  //                       width: 2,
  //                       color: states.contains(MaterialState.selected)
  //                           ? MyColor.secondaryColor
  //                           : MyColor.checkboxborder, // Your custom inactive color
  //                     ),
  //                   ),
  //                   checkColor:  MyColor.colorWhite,
  //                   activeColor:  MyColor.secondaryColor,
  //                   shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(4),
  //                   ),
  //                 ),
  //                  Flexible(
  //                   child: Text.rich(
  //                     TextSpan(
  //                       children: [
  //                         TextSpan(
  //                           text: MyStrings.remembermeandkeeplogin.tr,
  //                           style: TextStyle(fontSize: 14,color: MyColor.hinttext),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             const SizedBox(height: 12),
  //             // Sign Up Button
  //             AppButton(
  //               buttonName: MyStrings.login.tr,
  //               buttonColor: agreeToTerms ? MyColor.secondaryColor: Colors.grey, // Handle disabled state
  //               textColor: Colors.white,
  //               textSize: 16,
  //               fontWeight: FontWeight.w500,
  //               hasShadow: false,
  //               buttonWidth: double.infinity, // Full width
  //               onTap: agreeToTerms ? () {
  //                 // Navigate or call sign up logic
  //               } : () {},
  //               elevation: 0, // Remove shadow to match RoundedButton's elevation: 0
  //               borderWidth: 0, // No border
  //               isCenter: true, // Center the text
  //             ),
  //             const SizedBox(height: 14),
  //
  //             // Google Sign-In Button
  //             AppButton(
  //               buttonName: MyStrings.loginwithgoogle.tr,
  //               onTap: () {
  //                 // Google sign in logic
  //               },
  //              // buttonWidth: double.infinity,
  //               buttonColor: Colors.transparent,
  //               textColor: Colors.black,
  //               borderColor: const Color(0xFFE0E0E0),
  //               borderWidth: 1,
  //               isCenter: true,
  //               hasShadow: false,
  //               isIcon: true,
  //               isSuffix: false,
  //               iconImage: MyImages.googleicon,
  //               iconSize: 20,
  //               textSize: 14, // Adjust based on your needs
  //               fontWeight: FontWeight.w500,
  //               fontFamily: "Work Sans", // Or your preferred font family
  //             ),
  //
  //              SizedBox(height: 20),
  //             AppText(
  //               text: MyStrings.forgottenpassword.tr,
  //               size: AppDimensions.FONT_SIZE_14,
  //               fontWeight: FontWeight.w500,
  //               color: MyColor.secondaryColor,
  //
  //             ),
  //             // Login link
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //
  //                 AppText(
  //                   text: MyStrings.donthaveanaccount.tr,
  //                   size: AppDimensions.FONT_SIZE_14,
  //                   fontWeight: FontWeight.w500,
  //                   color: MyColor.hinttext,
  //
  //                 ),
  //                 SizedBox(width: 5,),
  //                 GestureDetector(
  //                   onTap: () {
  //                     Get.to(SignUpScreen());
  //                   },
  //                   child:
  //                   AppText(
  //                     text: MyStrings.signup.tr,
  //                     size: AppDimensions.FONT_SIZE_14,
  //                     fontWeight: FontWeight.bold,
  //                     color: MyColor.secondaryColor,
  //
  //                   ),
  //                 )
  //               ],
  //             )
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

}





