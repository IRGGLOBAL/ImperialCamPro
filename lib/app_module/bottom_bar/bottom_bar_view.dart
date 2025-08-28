
import 'package:campro/utils/Images/my_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../utils/custom_widget/my_color.dart';
import 'bottom_bar_controller.dart';

class CustomBottomBar extends GetView<BottomNavController> {
  final List<String> iconPaths = [
    MyImages.home,
    MyImages.layer,
    MyImages.library,
    MyImages.setting,

  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
          decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
      topRight: Radius.circular(5),),
            border: Border.all(color: MyColor.primaryColor.withValues(alpha: 0.1) , width: 1),

          ),

        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(iconPaths.length, (index) {
            final isSelected = controller.selectedIndex.value == index;
            return GestureDetector(
              onTap: () {
                controller.changeIndex(index);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // --- Icon ---
                  SvgPicture.asset(
                    iconPaths[index],
                    height: 30,
                    width: 30,
                    colorFilter: ColorFilter.mode(
                      isSelected ? Colors.red : Colors.grey,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(height: 6),
                  // --- Dot Indicator ---
                  if (isSelected)
                    Container(
                      height: 6,
                      width: 6,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    )
                  else
                    const SizedBox(height: 6), // keeps alignment equal
                ],
              ),
            );
          }),
        ),
      );
    });
  }
}
