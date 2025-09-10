import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Fonts/AppDimensions.dart';
import '../Widgets/AppText.dart';
import 'my_color.dart';

class CustomDropdownController extends GetxController {
  RxString selectedValue = 'Auto'.obs;

  final List<String> items = ['SD', 'FHD', 'Auto'];
}

class CustomDropdown extends StatelessWidget {
  final CustomDropdownController controller = Get.put(CustomDropdownController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      height: 35,
      width: Get.width * 0.21,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: MyColor.primaryColor, width: 0.5),
        borderRadius: BorderRadius.circular(50),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: controller.selectedValue.value,
          isExpanded: true,
          icon: Icon(Icons.arrow_drop_down, size: 20, color: MyColor.primaryColor,),
          style: TextStyle(color: Colors.grey.withOpacity(0.6), fontSize: 14),
          dropdownColor: Colors.white,
          items: controller.items
              .map((item) => DropdownMenuItem(
            value: item,
            child: Center(child: AppText(
              text: item,
              size: AppDimensions.FONT_SIZE_14,
              fontWeight: FontWeight.w500,
              color: MyColor.primaryColor,
            ),
            ),
          ))
              .toList(),
          onChanged: (val) {
            if (val != null) {
              controller.selectedValue.value = val;
              print("Selected mode: $val");
            }
          },
        ),
      ),
    ));
  }
}
