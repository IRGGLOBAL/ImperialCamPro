import 'package:campro/utils/Images/my_images.dart';
import 'package:campro/utils/custom_widget/my_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../utils/Fonts/AppDimensions.dart';
import '../../utils/Paddings/AppPaddings.dart';
import '../../utils/Widgets/AppText.dart';
import '../../utils/custom_widget/strings.dart';
import '../bottom_bar/bottom_bar_controller.dart';
import '../bottom_bar/bottom_bar_view.dart';

class MyHomePage extends StatelessWidget {
  final BottomNavController controller = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            /// App Logo
            Row(
              children: [
                SvgPicture.asset(
                  MyImages.appLogo,
                  height: 60,
                ),
              ],
            ),

            /// Notification + Profile
            Row(
              children: [
                Container(
                  height: Get.height *0.06,
                  width: Get.width *0.12,
                  padding:  EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: MyColor.lineColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Icon(Icons.notifications_none, size: 25),
                      Positioned(
                        right: 0,
                        top: 2,
                        child: Container(
                          height: 8,
                          width: 8,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 14),
                Container(
                  height: Get.height *0.06,
                  width: Get.width *0.12,
                  padding:  EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: MyColor.hintTextColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        automaticallyImplyLeading: false,
        backgroundColor: MyColor.colorWhite,
        surfaceTintColor: MyColor.transparentColor,
        //centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding :AppPaddings.defaultPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              ///GREETING
              const SizedBox(height: 6),
              AppText(
                text: "${MyStrings.welcomeback.tr} Burair 👋",
                size: AppDimensions.FONT_SIZE_16, // or use 14 directly
                fontWeight: FontWeight.bold,
                color: MyColor.primaryColor,
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 10),

              AppText(
                text: "${MyStrings.currentlocation.tr} ",
                size: AppDimensions.FONT_SIZE_13,
                fontWeight: FontWeight.w500,
                color: MyColor.hinttext,
                textAlign: TextAlign.left,
              ),

              Row(
                children: [
                  DropdownButton<String>(
                    value: "home", // default selected value
                    underline: SizedBox(), // remove underline
                    icon: const Icon(Icons.arrow_drop_down, size: 20, color: Colors.black),
                    items: [
                      DropdownMenuItem(
                        value: "home",
                        child: AppText(
                          text: MyStrings.homeunkownhill.tr,
                          size: AppDimensions.FONT_SIZE_13,
                          fontWeight: FontWeight.bold,
                          color: MyColor.primaryColor,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      DropdownMenuItem(
                        value: "office",
                        child: AppText(
                          text: MyStrings.office.tr, // add office string in MyStrings
                          size: AppDimensions.FONT_SIZE_13,
                          fontWeight: FontWeight.bold,
                          color: MyColor.hinttext,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      DropdownMenuItem(
                        value: "villa",
                        child: AppText(
                          text: MyStrings.villa.tr, // add villa string in MyStrings
                          size: AppDimensions.FONT_SIZE_13,
                          fontWeight: FontWeight.bold,
                          color: MyColor.hinttext,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      // Handle change
                      print("Selected: $value");
                    },
                  ),
                ],
              ),


              ///DEVICES CONNECTED
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: Get.height *0.06,
                      width: Get.width *0.12,
                      padding:  EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: MyColor.lineColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                        border: Border.all(color: MyColor.primaryColor.withValues(alpha: 0.1) , width: 1),

                      ),
                      child: Row(
                        children: [
                          Icon(Icons.devices, color: Colors.green, size: 20),
                          const SizedBox(width: 8),
                          AppText(
                            text: "14 ${MyStrings.deviceconnected.tr} ",
                            size: AppDimensions.FONT_SIZE_13,
                            fontWeight: FontWeight.w400,
                            color: MyColor.primaryColor,
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),

                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: Get.height *0.06,
                      width: Get.width *0.12,
                      padding:  EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: MyColor.lineColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                        border: Border.all(color: MyColor.primaryColor.withValues(alpha: 0.1) , width: 1),
                      ),
                      child:  SvgPicture.asset(
                        MyImages.refresh,
                      ),

                      // const Icon(Icons.change_circle_outlined, color: MyColor.primaryColor,),
                    ),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: Get.height *0.06,
                      width: Get.width *0.12,
                      padding:  EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: MyColor.primaryColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),

                      child: const Icon(Icons.add, color: Colors.white),
                    ),
                  ),

                ],
              ),

              const SizedBox(height: 16),

              ///CAMERA LIST
              CameraCard(
                title: "${MyStrings.livingroomcamera.tr}",
                armed: true,
              ),
              CameraCard(
                title: "${MyStrings.lobbyroomcamera.tr}",
                armed: false,
              ),
              CameraCard(
                title: "${MyStrings.receptiopn.tr}",
                armed: true,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}

///CAMERA CARD
class CameraCard extends StatelessWidget {
  final String title;
  final bool armed;

  const CameraCard({super.key, required this.title, required this.armed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Preview area (grey background for now)
          Container(
            height: 160,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: const BorderRadius.all( Radius.circular(12)),
            ),
            child: Stack(
              children: [
                /// Example: icons overlay on preview
                Positioned(
                  top: 10,
                  right: 10,
                  child: Row(
                    children: [
                      Container(
                        height: Get.height *0.04,
                        width: Get.width *0.15,
                        padding:  EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: MyColor.lineColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.format_list_numbered, color: MyColor.primaryColor, size: 10),
                           // Spacer(),
                            AppText(
                              text: "1/2",
                              size: AppDimensions.FONT_SIZE_10,
                              fontWeight: FontWeight.w400,
                              color: MyColor.primaryColor,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        height: Get.height *0.04,
                        width: Get.width *0.1,
                        padding:  EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: MyColor.primaryColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child:  SvgPicture.asset(
                          MyImages.fullscreen,
                        ),
                        //Icon(Icons.videocam_outlined, color: MyColor.colorWhite, size: 16),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        height: Get.height *0.04,
                        width: Get.width *0.1,
                        padding:  EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: MyColor.lineColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: Icon(Icons.more_vert, color: MyColor.primaryColor, size: 16),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Row(
                    children: [
                      Container(
                        height: Get.height *0.04,
                        width: Get.width *0.15,
                        padding:  EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: MyColor.lineColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.circle, color: MyColor.greenP, size: 10),
                            Icon(Icons.wifi, color: MyColor.primaryColor, size: 10),
                            Icon(Icons.directions_walk_outlined, color: MyColor.primaryColor, size: 10),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 70,
                  right: 0,
                  child: Row(
                    children: [
                      Container(
                        height: Get.height *0.04,
                        width: Get.width *0.08,
                        padding:  EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: MyColor.lineColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                          ),
                        ),
                        child: Icon(Icons.arrow_forward, color: MyColor.primaryColor, size: 14),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 70,
                  left: 0,
                  child: Row(
                    children: [
                      Container(
                        height: Get.height *0.04,
                        width: Get.width *0.08,
                        padding:  EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: MyColor.lineColor,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                          ),
                        ),
                        child: Icon(Icons.arrow_back, color: MyColor.primaryColor, size: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          /// Camera Info
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: title,
                          style: TextStyle(fontSize: 14,
                            color: MyColor.primaryColor, fontWeight: FontWeight.w600,),
                        ),
                        TextSpan(
                          text:   armed ? "  Armed" : "  Offline",
                          style: TextStyle(
                            fontSize: 13,
                            color: armed ? MyColor.hintTextColor : MyColor.secondaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: Get.height *0.06,
                    width: Get.width *0.12,
                    padding:  EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: armed ? MyColor.primaryColor.withValues(alpha: 0.05) : MyColor.secondaryColor.withValues(alpha: 0.05),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      border: Border.all(color: armed ? MyColor.primaryColor.withValues(alpha: 0.1) : MyColor.secondaryColor.withValues(alpha: 0.5), width: 1),
                    ),
                    child:  Icon(
                      armed ? Icons.mic : Icons.mic_off_outlined,
                      color: armed ? MyColor.primaryColor : MyColor.secondaryColor,
                      size: 22,),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }


}
