import 'package:campro/utils/Images/my_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:campro/utils/Widgets/AppText.dart';
import 'package:campro/utils/Widgets/AppButton.dart';
import 'package:campro/utils/Fonts/AppDimensions.dart';
import 'package:campro/utils/custom_widget/strings.dart';
import '../../../utils/custom_widget/my_color.dart';
import '../../manually_enter_camera/manual_entry_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FourgSearchNearbyDevices extends StatelessWidget {
  FourgSearchNearbyDevices({super.key});

  final ManualEntryController c =
  Get.find<ManualEntryController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.colorWhite,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: MyColor.colorWhite,
        surfaceTintColor: Colors.transparent,
        title: AppText(
          text: MyStrings.addbatterycamera.tr,
          size: AppDimensions.FONT_SIZE_16,
          fontWeight: FontWeight.w600,
          color: MyColor.primaryColor,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: MyColor.primaryColor,),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.volume_up, color: MyColor.primaryColor,),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

             Text(
              MyStrings.searchingnearbydevices.tr ,
              style: TextStyle(color: Colors.black54, fontSize: 14),
            ),

            const SizedBox(height: 30),
            /// Red Search Icon
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                c.startSearch();
              },
              child: CircleAvatar(
                radius: 40,
                backgroundColor: MyColor.secondaryColor,
                child: const Icon(Icons.search, size: 40, color: MyColor.colorWhite,),
              ),
            ),

            const SizedBox(height: 20),

            /// Timer OR Instruction
            Obx(() {
              if (c.isSearching.value) {
                return Text(
                  c.timerText,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: MyColor.primaryColor,
                  ),
                );
              } else {
                return
                  AppText(
                    text:MyStrings.camerakit.tr,
                    size: AppDimensions.FONT_SIZE_14,
                    fontWeight: FontWeight.w400,
                    color: MyColor.primaryColor,
                    textAlign: TextAlign.start,
                  );
              }
            }),

            const SizedBox(height: 30),
            Obx(() {
              if (!c.isSearching.value) {
                return SizedBox();
              } else {
                return  AppText(
                  text: MyStrings.thesearchprocessmaytake.tr,
                  size: AppDimensions.FONT_SIZE_14,
                  fontWeight: FontWeight.w400,
                  color: MyColor.primaryColor,
                  textAlign: TextAlign.center,
                );
              }
            }),



            const Spacer(),

            /// Step Progress Circles
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StepCircle(isActive: true, assetPath: MyImages.searchicon),

                  // Red Line between Search → Power
                  Expanded(
                    child: Container(
                      height: 1.5,
                      color: MyColor.secondaryColor,
                    ),
                  ),

                  StepCircle(isActive: false, assetPath:  MyImages.cloudicon),

                  // Red Line between Power → Check
                  Expanded(
                    child: Container(
                      height: 1.5,
                      color: MyColor.secondaryColor,
                    ),
                  ),

                  StepCircle(isActive: false, assetPath:  MyImages.reseticon),
                ],
              ),
            ),



            const SizedBox(height: 16),
            AppText(
              text:MyStrings.help.tr,
              size: AppDimensions.FONT_SIZE_14,
              fontWeight: FontWeight.w400,
              color: MyColor.secondaryColor,
              textAlign: TextAlign.center,
            ),


            const SizedBox(height: 20),

            AppButton(
              buttonName: MyStrings.next.tr ,
              buttonColor: MyColor.secondaryColor,
              textColor: MyColor.colorWhite,
              textSize: 16,
              fontWeight: FontWeight.w500,
              hasShadow: false,
              onTap: () {
                //Get.to(AddBatteryCamera());
              },
              elevation: 0,
              borderWidth: 0,
              isCenter: true,
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class StepCircle extends StatelessWidget {
  final bool isActive;
  final String assetPath;

  const StepCircle({
    super.key,
    required this.isActive,
    required this.assetPath,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 18,
      backgroundColor: isActive ? MyColor.secondaryColor : Colors.grey.shade300,
      child: SvgPicture.asset(
        assetPath,
        width: 18,
        height: 18,
        color: isActive ? MyColor.colorWhite : Colors.black54,
      ),
    );
  }
}

