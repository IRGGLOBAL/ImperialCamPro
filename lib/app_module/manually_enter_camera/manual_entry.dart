import 'package:campro/utils/Paddings/AppPaddings.dart';
import 'package:campro/utils/custom_widget/my_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/Fonts/AppDimensions.dart';
import '../../utils/Widgets/AppText.dart';
import '../../utils/custom_widget/strings.dart';
import 'manual_entry_controller.dart';

class ManualEntry extends StatelessWidget {
  ManualEntry({Key? key}) : super(key: key);

  final ManualEntryController controller = Get.put(ManualEntryController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (!controller.permissionGranted.value) {
        return Scaffold(
          body: Center(
            child: AppText(
              text: "${MyStrings.waitingforbluetoothpermission.tr}",
              size: AppDimensions.FONT_SIZE_16,
              fontWeight: FontWeight.bold,
              color: MyColor.primaryColor,
              textAlign: TextAlign.left,
            ),
          ),
        );
      }

      return Scaffold(
        backgroundColor: MyColor.colorWhite,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Get.back(),
          ),
          backgroundColor: MyColor.colorWhite,
          surfaceTintColor: MyColor.transparentColor,
        ),
        body: Padding(
          padding: AppPaddings.defaultPadding,
          child: Column(
            children: [
              AppText(
                text: "${MyStrings.searchingfornearbydevices.tr}",
                size: AppDimensions.FONT_SIZE_16,
                fontWeight: FontWeight.w600,
                color: MyColor.primaryColor,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 5,),
              Row(
                children: [
                  AppText(
                    text: "${MyStrings.pleasemakesurethedeviceisin.tr}",
                    size: AppDimensions.FONT_SIZE_10,
                    fontWeight: FontWeight.w500,
                    color: MyColor.primaryColor,
                    textAlign: TextAlign.center,
                  ),
                  AppText(
                    text: "${MyStrings.distributionnetworkstatus.tr}",
                    size: AppDimensions.FONT_SIZE_10,
                    fontWeight: FontWeight.w500,
                    color: MyColor.secondaryColor,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Icon(Icons.bluetooth, size: 80, color: MyColor.secondaryColor),
              AppText(
                text: "${MyStrings.manual.tr}",
                size: AppDimensions.FONT_SIZE_12,
                fontWeight: FontWeight.w500,
                color: MyColor.primaryColor,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Expanded(child: _buildMainLayout()),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildMainLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left side category buttons
        _buildCategorySidebar(),
        // Right side content area
        Expanded(child: _buildContentArea()),
      ],
    );
  }

  Widget _buildCategorySidebar() {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        color: MyColor.colorWhite,
        border: Border(right: BorderSide(color: MyColor.colorWhite)),
      ),
      child: ListView.builder(
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          final category = controller.categories[index];
          return Obx(() {
            final isSelected = controller.selectedCategoryIndex.value == index;
            return _CategoryButton(
              category: category,
              isSelected: isSelected,
              onTap: () => controller.selectCategory(category, index),
            );
          });
        },
      ),
    );
  }

  Widget _buildContentArea() {
    return Obx(() {
      if (controller.selectedCategory.isEmpty) {
        return Container(
          child: Center(
            child: AppText(
              text: "${MyStrings.selectacategorytoviewcameras.tr}",
              size: AppDimensions.FONT_SIZE_16,
              fontWeight: FontWeight.w500,
              color: MyColor.colorGrey,
              textAlign: TextAlign.left,
            ),
          ),
        );
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _buildSelectedCategoryContent()),
        ],
      );
    });
  }

  Widget _buildSelectedCategoryContent() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.85,
        ),
        itemCount: controller.getProductsForCategory(controller.selectedCategory.value).length,
        itemBuilder: (context, index) {
          final product = controller.getProductsForCategory(controller.selectedCategory.value)[index];
          return _ProductCard(
            product: product.name,
            onTap: () => controller.handleProductTap(product),
          );
        },
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final String category;
  final bool isSelected;
  final VoidCallback onTap;

  const _CategoryButton({
    Key? key,
    required this.category,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? MyColor.colorWhite : MyColor.colorWhite,
      ),
      child: ListTile(
        title: AppText(
          text: category,
          size: AppDimensions.FONT_SIZE_14,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          color: isSelected ? MyColor.primaryColor : MyColor.primaryColor,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        dense: true,
        onTap: onTap,
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final String product;
  final VoidCallback onTap;

  const _ProductCard({
    Key? key,
    required this.product,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: MyColor.colorWhite,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: MyColor.lineColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(color: MyColor.colorWhite),
                child: const Icon(Icons.image, size: 40, color: Colors.grey),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: product,
                      size: AppDimensions.FONT_SIZE_10,
                      fontWeight: FontWeight.w500,
                      color: MyColor.primaryColor,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
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

// import 'package:campro/utils/Paddings/AppPaddings.dart';
// import 'package:campro/utils/custom_widget/my_color.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../utils/Fonts/AppDimensions.dart';
// import '../../utils/Widgets/AppText.dart';
// import '../../utils/custom_widget/strings.dart';
// import 'manual_entry_controller.dart';
//
//
// class ManualEntry extends StatelessWidget {
//   ManualEntry({Key? key}) : super(key: key);
//
//   final ManualEntryController controller = Get.put(ManualEntryController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       if (!controller.permissionGranted.value) {
//         return  Scaffold(
//           body: Center(
//             child: AppText(
//               text: "${MyStrings.waitingforbluetoothpermission.tr}",
//               size: AppDimensions.FONT_SIZE_16, // or use 14 directly
//               fontWeight: FontWeight.bold,
//               color: MyColor.primaryColor,
//               textAlign: TextAlign.left,
//             ),
//
//           ),
//         );
//       }
//
//       return Scaffold(
//         backgroundColor: MyColor.colorWhite,
//         appBar: AppBar(
//          // title: const Text("Categories"),
//           leading: IconButton(
//             icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
//             onPressed: () => Get.back(),
//           ),
//           backgroundColor: MyColor.colorWhite,
//         surfaceTintColor: MyColor.transparentColor,),
//         body: Padding(
//           padding: AppPaddings.defaultPadding,
//             child: Column(
//               children: [
//                 Icon(Icons.bluetooth, size: 80, color: MyColor.secondaryColor),
//                 SizedBox(height: 20,),
//                 Expanded(
//                     child: _buildMainLayout()
//                 ),
//               ],
//             )
//         ),
//       );
//     });
//   }
//
//   Widget _buildMainLayout() {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//
//         // Left side category buttons
//         _buildCategorySidebar(),
//
//         // Right side content area
//         Expanded(
//           child: _buildContentArea(),
//         ),
//       ],
//     );
//   }
//   Widget _buildCategorySidebar() {
//     return Container(
//       width: 100,
//       decoration: BoxDecoration(
//         color: MyColor.colorWhite,
//         border: Border(right: BorderSide(color: MyColor.colorWhite,)),
//       ),
//       child: ListView.builder(
//         itemCount: controller.categories.length,
//         itemBuilder: (context, index) {
//           final category = controller.categories[index];
//
//           return Obx(() { // Wrap each item with Obx
//             final isSelected = controller.selectedCategoryIndex.value == index;
//
//             return _CategoryButton(
//               category: category,
//               isSelected: isSelected,
//               onTap: () => controller.selectCategory(category, index),
//             );
//           });
//         },
//       ),
//     );
//   }
//
//
//   Widget _buildContentArea() {
//     return Obx(() {
//       if (controller.selectedCategory.isEmpty) {
//         return Container(
//           child:  Center(
//             child:  AppText(
//               text: "${MyStrings.selectacategorytoviewcameras.tr}",
//               size: AppDimensions.FONT_SIZE_16, // or use 14 directly
//               fontWeight: FontWeight.w500,
//               color: MyColor.colorGrey,
//               textAlign: TextAlign.left,
//             ),
//
//
//           ),
//         );
//       }
//
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//
//           Expanded(
//             child: _buildSelectedCategoryContent(),
//           ),
//         ],
//       );
//     });
//   }
//
//   Widget _buildSelectedCategoryContent() {
//     return Padding(
//       padding: const EdgeInsets.all(5.0),
//       child: GridView.builder(
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 10,
//           childAspectRatio: 0.85,
//         ),
//         itemCount: 12, // Show 8 items for the selected category
//         itemBuilder: (context, index) {
//           return _ProductCard(
//             product: "${controller.selectedCategory.value} Product ${index + 1}",onTap: (){},
//           );
//         },
//       ),
//     );
//   }
// }
//
// class _CategoryButton extends StatelessWidget {
//   final String category;
//   final bool isSelected;
//   final VoidCallback onTap;
//
//   const _CategoryButton({
//     Key? key,
//     required this.category,
//     required this.isSelected,
//     required this.onTap,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: isSelected ? MyColor.colorWhite  : MyColor.colorWhite,
//
//       ),
//       child: ListTile(
//         title: AppText(
//           text: category,
//           size: AppDimensions.FONT_SIZE_14, // or use 14 directly
//           fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//           color: isSelected ? MyColor.primaryColor : MyColor.primaryColor ,
//           //textAlign: TextAlign.left,
//         ),
//         contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
//         dense: true,
//         onTap: onTap,
//       ),
//     );
//   }
// }
// class _ProductCard extends StatelessWidget {
//
//   final String product;
//   final VoidCallback onTap;
//   const _ProductCard({Key? key,
//     required this.product,
//     required this.onTap,
//   })
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         decoration: BoxDecoration(
//           color: MyColor.colorWhite,
//           borderRadius: BorderRadius.circular(8),
//           border: Border.all(color: MyColor.lineColor,),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Product image placeholder - use Expanded to take available space
//             Expanded(
//               flex: 3,
//               child: Container(
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: MyColor.colorWhite,
//                 ),
//                 child: const Icon(Icons.image, size: 40, color: Colors.grey),
//               ),
//             ),
//             // Product details - use Expanded to take remaining space
//             Expanded(
//               flex: 2,
//               child: Padding(
//                 padding: const EdgeInsets.all(5),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribute space evenly
//                   children: [
//                     AppText(
//                       text: product,
//                       size: AppDimensions.FONT_SIZE_10,
//                       fontWeight:  FontWeight.w500 ,
//                       color:  MyColor.primaryColor  ,
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                       //textAlign: TextAlign.left,
//                     ),
//
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

/*class _ProductCard extends StatelessWidget {
  final String product;

  const _ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // Add this to prevent overflow
        children: [
          // Product image placeholder
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: const Icon(Icons.image, size: 40, color: Colors.grey),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min, // Add this to prevent overflow
              children: [
                Text(
                  product,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                const Text(
                  "Rs. 1,999",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 4),
                const Row(
                  children: [
                    Icon(Icons.star, size: 14, color: Colors.orange),
                    SizedBox(width: 2),
                    Text(
                      "4.5",
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}*/

//
// class ManualEntry extends StatefulWidget {
//   const ManualEntry({Key? key}) : super(key: key);
//
//   @override
//   State<ManualEntry> createState() => _ManualEntryViewState();
// }
//
// class _ManualEntryViewState extends State<ManualEntry>
//     with SingleTickerProviderStateMixin {
//   final ManualEntryController controller = Get.put(ManualEntryController());
//   late AnimationController _animationController;
//
//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 2),
//     )..repeat();
//   }
//
//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       if (!controller.permissionGranted.value) {
//         return const Scaffold(
//           body: Center(
//             child: Text("Waiting for Bluetooth Permission..."),
//           ),
//         );
//       }
//
//       return Scaffold(
//         appBar: AppBar(title: const Text("Bluetooth Devices")),
//         body: Column(
//           children: [
//             const SizedBox(height: 20),
//             _buildBluetoothAnimation(),
//             const SizedBox(height: 20),
//             _buildCategoryList(),
//           ],
//         ),
//       );
//     });
//   }
//
//   Widget _buildBluetoothAnimation() {
//     return Center(
//       child: AnimatedBuilder(
//         animation: _animationController,
//         builder: (context, child) {
//           return Stack(
//             alignment: Alignment.center,
//             children: [
//               for (int i = 1; i <= 3; i++)
//                 Container(
//                   width: 100 + (i * 40 * _animationController.value),
//                   height: 100 + (i * 40 * _animationController.value),
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Colors.blue.withOpacity(
//                         (1 - _animationController.value) / (i + 1)),
//                   ),
//                 ),
//               child!,
//             ],
//           );
//         },
//         child: const Icon(Icons.bluetooth, size: 80, color: Colors.blueAccent),
//       ),
//     );
//   }
//
//   Widget _buildCategoryList() {
//     return Expanded(
//       child: ListView.builder(
//         padding: const EdgeInsets.all(12),
//         itemCount: controller.categories.length,
//         itemBuilder: (context, index) {
//           final category = controller.categories[index];
//           return Obx(() => _CategoryItem(
//             category: category,
//             isExpanded: controller.isExpanded(category),
//             onTap: () => controller.toggleCategory(category),
//           ));
//         },
//       ),
//     );
//   }
// }
//
// class _CategoryItem extends StatelessWidget {
//   final String category;
//   final bool isExpanded;
//   final VoidCallback onTap;
//
//   const _CategoryItem({
//     Key? key,
//     required this.category,
//     required this.isExpanded,
//     required this.onTap,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       elevation: 4,
//       margin: const EdgeInsets.only(bottom: 12),
//       child: Column(
//         children: [
//           ListTile(
//             title: Text(
//               category,
//               textAlign: TextAlign.center,
//               style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//             ),
//             trailing: Icon(
//               isExpanded ? Icons.expand_less : Icons.expand_more,
//             ),
//             onTap: onTap,
//           ),
//           if (isExpanded) _CategoryGrid(category: category),
//         ],
//       ),
//     );
//   }
// }
//
// class _CategoryGrid extends StatelessWidget {
//   final String category;
//
//   const _CategoryGrid({Key? key, required this.category}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     List<String> items =
//     List.generate(8, (index) => "$category Item ${index + 1}");
//
//     return Padding(
//       padding: const EdgeInsets.all(12.0),
//       child: GridView.count(
//         crossAxisCount: 2,
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         crossAxisSpacing: 12,
//         mainAxisSpacing: 12,
//         children: items
//             .map(
//               (item) => Card(
//             color: Colors.blue.shade50,
//             child: Center(
//               child: Text(
//                 item,
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(fontSize: 16),
//               ),
//             ),
//           ),
//         )
//             .toList(),
//       ),
//     );
//   }
// }