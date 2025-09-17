import 'package:campro/app_module/auth/view/signup_screen.dart';
import 'package:campro/utils/Images/my_images.dart';
import 'package:campro/utils/Paddings/AppPaddings.dart';
import 'package:campro/utils/custom_widget/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../utils/Fonts/AppDimensions.dart';
import '../../../utils/Widgets/AppButton.dart';
import '../../../utils/Widgets/AppText.dart';
import '../../../utils/custom_widget/dimensions.dart';
import '../../../utils/custom_widget/my_color.dart';


class OnboardController extends GetxController {
  final RxInt currentPage = 0.obs;
  final PageController pageController = PageController();

  void updatePage(int page) {
    currentPage.value = page;
  }

  void nextPage() {
    if (currentPage.value < 3) { // Assuming 4 slides (0-3)
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void previousPage() {
    if (currentPage.value > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}

class OnboardImage extends StatefulWidget {
  const OnboardImage({super.key});

  @override
  State<OnboardImage> createState() => _OnboardImageState();
}

class _OnboardImageState extends State<OnboardImage> {
  bool agreeToTerms = false;
  final OnboardController controller = Get.put(OnboardController());

  // List of text content for each slide
  final List<Map<String, String>> slideContent = [
    {
      'title': MyStrings.smartecuritycamerahomeapplication.tr,
      'subtitle': MyStrings.cuttingedgeprotectionalwaysconnected.tr,
    },
    {
      'title': MyStrings.realtimemonitoring.tr,
      'subtitle': MyStrings.monitoryourofficefromanywhere.tr,
    },
    {
      'title': MyStrings.aithreatdetection.tr,
      'subtitle': MyStrings.advancedaiidentifiespotentialthreats.tr,
    },
    {
      'title': MyStrings.easyinstallation.tr,
      'subtitle': MyStrings.setupyoursecuritysystem.tr,
    },
  ];

  @override
  void initState() {
    super.initState();
    controller.pageController.addListener(() {
      controller.updatePage(controller.pageController.page?.round() ?? 0);
    });
  }

  @override
  void dispose() {
    Get.delete<OnboardController>();
    super.dispose();
  }

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
            // Bottom Sheet Content
            DraggableScrollableSheet(
              initialChildSize: 0.65,
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
                    padding: AppPaddings.defaultPadding,
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
                        // Logo
                        SvgPicture.asset(
                          MyImages.appLogo,
                          height: 60,
                        ),
                        const SizedBox(height: 10),

                        // Text Content with Slider
                        SizedBox(
                          height: 150,
                          child: PageView.builder(
                            controller: controller.pageController,
                            itemCount: slideContent.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AppText(
                                      text: slideContent[index]['title']!,
                                      size: AppDimensions.FONT_SIZE_22,
                                      fontWeight: FontWeight.w500,
                                      color: MyColor.primaryColor,
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 8),
                                    AppText(
                                      text: slideContent[index]['subtitle']!,
                                      size: AppDimensions.FONT_SIZE_14,
                                      color: MyColor.textcolorsubtitle,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        Obx(() => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            slideContent.length,
                                (index) => Container(
                              width: 12,
                              height: 5,
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                //shape: BoxShape.circle,
                                borderRadius: BorderRadius.circular(Dimensions.space5),
                                color: controller.currentPage.value == index
                                    ? MyColor.primaryColor
                                    : Colors.grey[300],
                              ),
                            ),
                          ),
                        )),
                        const SizedBox(height: 20),
                        // Navigation Buttons with Obx

                            AppButton(
                              buttonWidth: double.infinity,
                              buttonName:  MyStrings.getstarted.tr,
                              buttonColor: MyColor.secondaryColor,
                              textColor: Colors.white,
                              textSize: 16,
                              fontWeight: FontWeight.w500,
                              hasShadow: false,
                              onTap: () {
                                  Get.to(() =>  SignUpScreen());
                              },
                              elevation: 0,
                              borderWidth: 0,
                              isCenter: true,
                            ),

                        // Slider Indicators with Obx

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






