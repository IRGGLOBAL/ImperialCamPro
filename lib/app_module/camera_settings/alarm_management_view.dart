import 'package:campro/utils/custom_widget/my_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../utils/Fonts/AppDimensions.dart';
import '../../utils/Images/my_images.dart';
import '../../utils/Widgets/AppText.dart';
import '../../utils/custom_widget/strings.dart';
import 'cloud_storage_setting.dart';
import 'motion_detection_view.dart';

class AlarmManagementView extends StatefulWidget {
  const AlarmManagementView({Key? key}) : super(key: key);

  @override
  State<AlarmManagementView> createState() => _AlarmManagementViewState();
}

class _AlarmManagementViewState extends State<AlarmManagementView> {


  bool receiveAlarmNotifications = true;

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
          text: "${MyStrings.alarmmanagementy.tr}",
          size: AppDimensions.FONT_SIZE_16,
          fontWeight: FontWeight.w600,
          color: MyColor.primaryColor,
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: MyColor.transparentColor,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: MyColor.colorWhite,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 2,
                    spreadRadius: 0,
                    offset: Offset(2, 2),
                  ),
                ],
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child:
                    AppText(
                      text:  MyStrings.receivealarmnotifications.tr,
                      size: AppDimensions.FONT_SIZE_14,
                      fontWeight: FontWeight.w500,
                      color: MyColor.primaryColor,
                      //textAlign: TextAlign.center,
                    ),

                  ),
                  // Switch
                  Transform.scale(
                    scale: 0.7,
                    child: Switch(
                      value: receiveAlarmNotifications, // Use the state variable here
                      onChanged: (val) {
                        setState(() {
                          receiveAlarmNotifications = val; // Update the state variable
                        });
                      },
                      activeColor: MyColor.secondaryColor,
                      inactiveTrackColor: Colors.grey.shade400,
                      activeTrackColor: MyColor.secondaryColor,
                      thumbColor: MaterialStateProperty.all(Colors.white),
                      trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            AppText(
              text:  MyStrings.motionalarm.tr,
              size: AppDimensions.FONT_SIZE_14,
              fontWeight: FontWeight.w500,
              color: MyColor.primaryColor,
              //textAlign: TextAlign.center,
            ),
            SizedBox(height: 10,),
            GestureDetector(
              onTap: (){
                Get.to(MotionDetectionView());
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 12),
                decoration: BoxDecoration(
                  color: MyColor.colorWhite,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 2,
                      spreadRadius: 0,
                      offset: Offset(2, 2),
                    ),
                  ],
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child:
                      AppText(
                        text:  MyStrings.motiondetection.tr,
                        size: AppDimensions.FONT_SIZE_14,
                        fontWeight: FontWeight.w500,
                        color: MyColor.primaryColor,
                        //textAlign: TextAlign.center,
                      ),

                    ),
                    Icon(Icons.chevron_right, color: MyColor.primaryColor),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
