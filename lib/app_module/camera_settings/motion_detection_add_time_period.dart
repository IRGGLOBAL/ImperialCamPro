import 'package:campro/utils/custom_widget/my_color.dart';
import 'package:campro/utils/custom_widget/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/Widgets/AppButton.dart';
import 'motion_detection_controller.dart';

class MotionDetectionAddTimePeriod extends StatelessWidget {
  MotionDetectionAddTimePeriod({Key? key}) : super(key: key);

  final MotionDetectionController controller = Get.put(MotionDetectionController());

  final List<String> days = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  BackButton(color: MyColor.primaryColor),
        title:  Text(
          MyStrings.addtimeperiod.tr,
          style: TextStyle(fontWeight: FontWeight.w600, color: MyColor.primaryColor),
        ),
        centerTitle: true,
        backgroundColor: MyColor.colorWhite,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              MyStrings.setanalarmplanandthedevicewillonlytrigger.tr,
              style: TextStyle(color: MyColor.primaryColor),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Start & End Time

            Obx(() =>
                Container(
                  decoration: BoxDecoration(
                    color: MyColor.colorWhite,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 2,
                        offset: const Offset(2, 2),
                      ),
                    ],),
                  child:    Column(
                    children: [
                      ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        tileColor: Colors.transparent,
                        title:  Text(MyStrings.starttime.tr),
                        trailing: Text(controller.formatTime(controller.startTime.value),
                            style: const TextStyle(color: MyColor.primaryColor)),
                        onTap: () => controller.pickStartTime(context),
                      ),
                      ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        tileColor: MyColor.transparentColor,
                        title:  Text(MyStrings.endtime.tr),
                        trailing: Text(controller.formatTime(controller.endTime.value, isEnd: true),
                            style: const TextStyle(color: MyColor.primaryColor)),
                        onTap: () => controller.pickEndTime(context),
                      ),
                    ],
                  ),
                ),
             ),

            const SizedBox(height: 20),

             Text(MyStrings.repeat.tr,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),

            const SizedBox(height: 10),

            // Days selection with circular containers
            Obx(() =>  Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              decoration: BoxDecoration(
                color: MyColor.colorWhite,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 2,
                    offset: const Offset(2, 2),
                  ),
                ],),
              child: Center(
                child: Wrap(
                  spacing: 5,
                  runSpacing: 8,
                  children: List.generate(days.length, (index) {
                    final isSelected = controller.selectedDays.contains(index);

                    return GestureDetector(
                      onTap: () => controller.toggleDay(index),
                      child: Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          color: isSelected ? MyColor.secondaryColor : Colors.grey.shade200,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isSelected ?MyColor.secondaryColor : Colors.grey.shade300,
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            days[index],
                            style: TextStyle(
                              color: isSelected ? MyColor.colorWhite : MyColor.colorBlack,
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            )),

            const Spacer(),

            // Save button
            AppButton(
              buttonName: MyStrings.save.tr,
              onTap: () {
                // Google sign in logic
              },
              buttonColor: MyColor.secondaryColor,
              textColor: MyColor.colorWhite,
              borderColor: const Color(0xFFE0E0E0),
              borderWidth: 1,
              isCenter: true,
              hasShadow: false,
              isSuffix: false,
              iconSize: 20,
              textSize: 14, // Adjust based on your needs
              fontWeight: FontWeight.w500,
              fontFamily: "Work Sans", // Or your preferred font family
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey.shade100,
    );
  }
}