import 'package:campro/utils/custom_widget/my_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/Fonts/AppDimensions.dart';
import '../../utils/Widgets/AppButton.dart';
import '../../utils/Widgets/AppText.dart';
import '../../utils/custom_widget/custom_slider.dart';
import '../../utils/custom_widget/strings.dart';
import 'motion_detection_alert_plan.dart';

class MotionDetectionView extends StatefulWidget {
  const MotionDetectionView({Key? key}) : super(key: key);

  @override
  State<MotionDetectionView> createState() => _MotionDetectionViewState();
}

class _MotionDetectionViewState extends State<MotionDetectionView> {

  double sliderValue = 5; // default value
  bool receiveAlarmNotifications = true;

  String _selectedMode = MyStrings.powersavingmode.tr;

  final List<String> modes = [
    MyStrings.powersavingmode.tr,
    MyStrings.performancemode.tr,
    MyStrings.custommode.tr
  ];

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

            SizedBox(height: 10,),
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

                    AppText(
                      text:  MyStrings.motiondetection.tr,
                      size: AppDimensions.FONT_SIZE_14,
                      fontWeight: FontWeight.w500,
                      color: MyColor.primaryColor,
                      //textAlign: TextAlign.center,


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
              text:  MyStrings.motionalarmcontentone.tr,
              size: AppDimensions.FONT_SIZE_12,
              fontWeight: FontWeight.w500,
              color: MyColor.primaryColor,
              //textAlign: TextAlign.center,
            ),
            SizedBox(height: 10,),
            Container(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child:
                      AppText(
                        text:  MyStrings.detectionsensitivity.tr,
                        size: AppDimensions.FONT_SIZE_14,
                        fontWeight: FontWeight.w500,
                        color: MyColor.primaryColor,
                       // textAlign: TextAlign.start,
                      ),

                  ),
                  // Slider without popup label
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.red,
                      inactiveTrackColor: Colors.grey,
                      trackHeight: 3,
                      thumbShape:  RedBorderThumbShape(thumbRadius: 10),
                    ),
                    child: Slider(
                      value: sliderValue,
                      min: 1.0,
                      max: 5.0,

                      //divisions: 0,
                      onChanged: (val) {
                        setState(() => sliderValue = val);
                      },
                    ),
                  ),
                  // Fixed number labels
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        5,
                            (index) => Text(
                          "${index + 1}",
                          style: TextStyle(
                            fontSize: AppDimensions.FONT_SIZE_12,
                            color: MyColor.primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Remove Expanded from here
                        AppText(
                          text: MyStrings.motiondetectioncontentone.tr,
                          size: AppDimensions.FONT_SIZE_12,
                          fontWeight: FontWeight.w500,
                          color: MyColor.primaryColor,
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                           AppText(
                                text: MyStrings.automaticsensitivitycorrection.tr,
                                size: AppDimensions.FONT_SIZE_14,
                                fontWeight: FontWeight.w500,
                                color: MyColor.primaryColor,
                              ),

                            Transform.scale(
                              scale: 0.7,
                              child: Switch(
                                value: receiveAlarmNotifications,
                                onChanged: (val) {
                                  setState(() {
                                    receiveAlarmNotifications = val;
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
                        SizedBox(height: 10,),
                        // Remove Expanded from here too
                        AppText(
                          text: MyStrings.motiondetectioncontenttwo.tr,
                          size: AppDimensions.FONT_SIZE_12,
                          fontWeight: FontWeight.w500,
                          color: MyColor.primaryColor,
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
            //SizedBox(height: 20,),

            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                          AppText(
                            text:  MyStrings.humanoiddetection.tr,
                            size: AppDimensions.FONT_SIZE_14,
                            fontWeight: FontWeight.w500,
                            color: MyColor.primaryColor,
                            // textAlign: TextAlign.start,
                          ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                         AppText(
                                text: MyStrings.dayhumanoiddetection.tr,
                                size: AppDimensions.FONT_SIZE_14,
                                fontWeight: FontWeight.w500,
                                color: MyColor.primaryColor,
                              ),

                            Transform.scale(
                              scale: 0.7,
                              child: Switch(
                                value: receiveAlarmNotifications,
                                onChanged: (val) {
                                  setState(() {
                                    receiveAlarmNotifications = val;
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                         AppText(
                                text: MyStrings.nighthumanoiddetection.tr,
                                size: AppDimensions.FONT_SIZE_14,
                                fontWeight: FontWeight.w500,
                                color: MyColor.primaryColor,
                              ),

                            Transform.scale(
                              scale: 0.7,
                              child: Switch(
                                value: receiveAlarmNotifications,
                                onChanged: (val) {
                                  setState(() {
                                    receiveAlarmNotifications = val;
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
                        SizedBox(height: 10,),
                        AppText(
                          text:  MyStrings.humanoiddetectionsensitivity.tr,
                          size: AppDimensions.FONT_SIZE_14,
                          fontWeight: FontWeight.w500,
                          color: MyColor.primaryColor,
                          // textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),

                  // Slider without popup label
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.red,
                      inactiveTrackColor: Colors.grey,
                      trackHeight: 3,
                      thumbShape: const RedBorderThumbShape(thumbRadius: 10),
                    ),
                    child: Slider(
                      value: sliderValue,
                      min: 1.0,
                      max: 5.0,

                      //divisions: 0,
                      onChanged: (val) {
                        setState(() => sliderValue = val);
                      },
                    ),
                  ),
                  // Fixed number labels
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        5,
                            (index) => Text(
                          "${index + 1}",
                          style: TextStyle(
                            fontSize: AppDimensions.FONT_SIZE_12,
                            color: MyColor.primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Remove Expanded from here
                        AppText(
                          text: MyStrings.motiondetectioncontentone.tr,
                          size: AppDimensions.FONT_SIZE_12,
                          fontWeight: FontWeight.w500,
                          color: MyColor.primaryColor,
                        ),


                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Remove Expanded from here too
            AppText(
              text: MyStrings.motiondetectioncontentthree.tr,
              size: AppDimensions.FONT_SIZE_12,
              fontWeight: FontWeight.w500,
              color: MyColor.primaryColor,
            ),
            SizedBox(height: 16,),
            Container(
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: modes.map((mode) {
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Row(
                        children: [
                          AppText(
                            text: mode,
                            size: AppDimensions.FONT_SIZE_14,
                            fontWeight: FontWeight.w500,
                            color: MyColor.primaryColor,
                          ),
                          const SizedBox(width: 5),

                          /// Show help icon only for power saving & performance
                          if (mode != MyStrings.custommode.tr)
                            GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                String title = '';
                                String message = '';

                                if (mode == MyStrings.powersavingmode.tr) {
                                  title = MyStrings.powersavingmode.tr;
                                  message = MyStrings.powersavingmodeinfo.tr; // <-- localized content
                                } else if (mode == MyStrings.performancemode.tr) {
                                  title = MyStrings.performancemode.tr;
                                  message = MyStrings.performancemodeinfo.tr; // <-- localized content
                                }

                                Get.dialog(
                                  AlertDialog(
                                    backgroundColor: MyColor.colorWhite,
                                    title:  AppText(
                                      text: (title),
                                      size: AppDimensions.FONT_SIZE_16,
                                      fontWeight: FontWeight.w600,
                                      color: MyColor.primaryColor,
                                      textAlign: TextAlign.center
                                    ),

                                    content:  AppText(
                                        text: (message),
                                        size: AppDimensions.FONT_SIZE_14,
                                        fontWeight: FontWeight.w400,
                                        color: MyColor.primaryColor,
                                        textAlign: TextAlign.start
                                    ),

                                    actions: [
                                      AppButton(
                                        buttonName: MyStrings.isee.tr,
                                        buttonColor: MyColor.secondaryColor,
                                        textColor: Colors.white,
                                        textSize: 16,
                                        fontWeight: FontWeight.w500,
                                        hasShadow: false,
                                        onTap: () => Get.back(),
                                        elevation: 0,
                                        borderWidth: 0,
                                        isCenter: true,
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: Icon(
                                Icons.help_outline,
                                color: MyColor.primaryColor,
                                size: 14,
                              ),
                            ),
                        ],
                      ),
                      trailing: Radio<String>(
                        value: mode,
                        groupValue: _selectedMode,
                        activeColor: Colors.red,
                        onChanged: (value) {
                          setState(() {
                            _selectedMode = value!;
                          });
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),

            SizedBox(height: 16,),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                Get.to(() =>  MotionDetectionAlertPlan());
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                decoration: BoxDecoration(
                  color: MyColor.colorWhite,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 2,
                      offset: const Offset(2, 2),
                    ),
                  ],
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: MyStrings.alertplan.tr,
                      size: AppDimensions.FONT_SIZE_14,
                      fontWeight: FontWeight.w500,
                      color: MyColor.primaryColor,
                    ),
                    Icon(Icons.chevron_right, color: MyColor.primaryColor),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16,),
            AppText(
              text: MyStrings.setthetimeperiodofthealarm.tr,
              size: AppDimensions.FONT_SIZE_12,
              fontWeight: FontWeight.w500,
              color: MyColor.primaryColor,
            ),
            SizedBox(height: 16,),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                // Get.to(() =>  AntiFlickerSetting());
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                decoration: BoxDecoration(
                  color: MyColor.colorWhite,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 2,
                      offset: const Offset(2, 2),
                    ),
                  ],
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: MyStrings.humanoidalarmarea.tr,
                      size: AppDimensions.FONT_SIZE_14,
                      fontWeight: FontWeight.w500,
                      color: MyColor.primaryColor,
                    ),
                    Icon(Icons.chevron_right, color: MyColor.primaryColor),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16,),
            AppText(
              text: MyStrings.tousethefunctionpleasemakesure.tr,
              size: AppDimensions.FONT_SIZE_12,
              fontWeight: FontWeight.w500,
              color: MyColor.primaryColor,
            ),
            SizedBox(height: 40,),
          ],
        ),
      ),
    );
  }
}
