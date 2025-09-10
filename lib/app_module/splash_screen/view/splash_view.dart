import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../utils/Images/my_images.dart';
import '../../../utils/custom_widget/my_color.dart';
import 'onboard_image.dart';


class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    // Navigate after build is done
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 1), () {
        Get.off(() => const OnboardImage()); // Removes splash screen from navigation stack
      });
    });

    return SafeArea(
      child: Scaffold(
          backgroundColor: MyColor.colorWhite,
          body: Stack(
            children: [

              Positioned.fill(
                child: Image.asset(
                  MyImages.backgroundimage,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child:   Center(
                  child: SvgPicture.asset(
                    MyImages.appLogo,
                    height: 100,
                  ),
                ),
              ),

            ],
          ),
        ),

    );
    //   Scaffold(
    //   backgroundColor: MyColor.colorWhite,
    //   body: Container(
    //     width: Get.width,
    //     height: Get.height,
    //     child: Padding(
    //       padding: AppPaddings.defaultPadding,
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: [
    //          Text( "Splash Screen")
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
