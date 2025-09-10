
import 'package:campro/utils/Images/my_images.dart';
import 'package:campro/utils/Widgets/floating_bar.dart';
import 'package:campro/utils/Widgets/floating_bar_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../utils/custom_widget/my_color.dart';
import 'bottom_bar_controller.dart';

class BottomNavBarView extends GetView<BottomNavController> {

  final List<String> iconPaths = [
    MyImages.home,
    MyImages.layer,
    MyImages.library,
    MyImages.setting,
  ];

  @override

  Widget build(BuildContext context) {
      return Scaffold(
        body:Obx(()=>controller.currentPage,),
        bottomNavigationBar:
      Obx(()=>  Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),),
            border: Border.all(color: MyColor.primaryColor.withValues(alpha: 0.1) , width: 1),

          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(iconPaths.length, (index) {
              final isSelected = controller.selectedIndex.value == index;
              return GestureDetector(
                behavior:HitTestBehavior.translucent,
                onTap: () {
                  controller.changeIndex(index);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // --- Icon ---
                    SvgPicture.asset(
                      iconPaths[index],
                      height: 16,
                      width: 16,
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
        )),

          ///
        //
        //
        // FloatingNavbar(
        //   currentIndex: controller.selectedIndex.value,
        //   onTap: (index) => controller.changeIndex(index),
        //   items: [
        //     FloatingNavbarItem(icon: (Icons.home), title: "Home"),
        //      FloatingNavbarItem(icon: (Icons.search), title: "Search"),
        //      FloatingNavbarItem(icon: (Icons.person), title: "Profile"),
        //   ],
        // ),



      );
  }
}
