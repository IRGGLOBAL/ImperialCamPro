import 'package:campro/utils/custom_widget/my_color.dart';
import 'package:campro/utils/custom_widget/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ruler_scale_indicator/ruler_scale_indicator.dart';
import '../../utils/Fonts/AppDimensions.dart';
import '../../utils/Images/my_images.dart';
import '../../utils/Widgets/AppText.dart';
import '../../utils/custom_widget/custom_dropdown.dart';
import '../camera_settings/setting_view.dart';
import 'home_controller.dart';

class CameraView extends StatelessWidget {
  final HomeController c = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: AppText(
          text: MyStrings.livingroomcamera.tr,
          fontWeight: FontWeight.w500,
          color: MyColor.primaryColor,
        ),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
            onPressed: () {
              Get.to(SettingView());
            },
          ),
        ],
      ),
      body: Column(
        children: [
          ///Camera Preview (grey placeholder for now)
          Container(
            height: Get.height * 0.3,
            width: double.infinity,
            color: Colors.grey[300],
            child: const Center(
              child: Icon(Icons.videocam_off_outlined,
                  size: 50, color: Colors.white),
            ),
          ),

          /// Mode Row (Day / Auto etc.)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Ruler Scale Indicator
                ScrollableRuler(),
                CustomDropdown(),
              ],
            ),
          ),

          const Divider(height: 1),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _TabItem(
                      text: MyStrings.live.tr,
                      selected: c.selectedTab.value == 0,
                      onTap: () => c.changeTab(0),
                    ),
                    _TabItem(
                      text: MyStrings.history.tr,
                      selected: c.selectedTab.value == 1,
                      onTap: () => c.changeTab(1),
                    ),
                    _TabItem(
                      text: MyStrings.cloud.tr,
                      selected: c.selectedTab.value == 2,
                      onTap: () => c.changeTab(2),
                    ),
                  ],
                )),
          ),

          // Content based on tab
          Expanded(
            child: Obx(() {
              switch (c.selectedTab.value) {
                case 0:
                  return _LiveTabContent();
                case 1:
                  return _HistoryTabContent();
                case 2:
                  return udTabContent();
                default:
                  return Container();
              }
            }),
          ),
        ],
      ),
    );
  }
}

// class CustomDropdownController extends GetxController {
//   RxString selectedValue = 'Auto'.obs;
//
//   final List<String> items = ['SD', 'FHD', 'Auto'];
// }
//
// class CustomDropdown extends StatelessWidget {
//   final CustomDropdownController controller = Get.put(CustomDropdownController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() => Container(
//       height: 35,
//       width: Get.width * 0.21,
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         border: Border.all(color: MyColor.primaryColor, width: 0.5),
//         borderRadius: BorderRadius.circular(50),
//       ),
//       child: DropdownButtonHideUnderline(
//         child: DropdownButton<String>(
//           value: controller.selectedValue.value,
//           isExpanded: true,
//           icon: Icon(Icons.arrow_drop_down, size: 20, color: MyColor.primaryColor,),
//           style: TextStyle(color: Colors.grey.withOpacity(0.6), fontSize: 14),
//           dropdownColor: Colors.white,
//           items: controller.items
//               .map((item) => DropdownMenuItem(
//             value: item,
//             child: Center(child: AppText(
//               text: item,
//               size: AppDimensions.FONT_SIZE_14,
//               fontWeight: FontWeight.w500,
//               color: MyColor.primaryColor,
//             ),
//            ),
//           ))
//               .toList(),
//           onChanged: (val) {
//             if (val != null) {
//               controller.selectedValue.value = val;
//               print("Selected mode: $val");
//             }
//           },
//         ),
//       ),
//     ));
//   }
// }

class _TabItem extends StatelessWidget {
  final String text;
  final bool selected;
  final VoidCallback onTap;

  const _TabItem({
    required this.text,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Column(
        children: [
          AppText(
              text: text,
              size: AppDimensions.FONT_SIZE_14,
              fontWeight: selected ? FontWeight.bold : FontWeight.normal,
              color: selected ? MyColor.primaryColor : MyColor.lightGrey),
          if (selected)
            Container(
              margin: const EdgeInsets.only(top: 4),
              height: 2,
              width: 20,
              color: selected ? MyColor.secondaryColor : MyColor.lightGrey,
            )
        ],
      ),
    );
  }
}

class _LiveTabContent extends StatefulWidget {
  @override
  State<_LiveTabContent> createState() => _LiveTabContentState();
}

class _LiveTabContentState extends State<_LiveTabContent> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Define your feature items with SVG paths
  final List<Map<String, dynamic>> _featureItems = [
    {
      'svgPath': MyImages.screenshot,
      'label': MyStrings.screenshot.tr,
      'onTap': () {}
    },
    {
      'svgPath': MyImages.intercom,
      'label': MyStrings.intercom.tr,
      'onTap': () {}
    },
    {
      'svgPath': MyImages.sound,
      'label': MyStrings.originalsound.tr,
      'onTap': () {}
    },
    {
      'svgPath': MyImages.record,
      'label': MyStrings.recording.tr,
      'onTap': () {}
    },
    {
      'svgPath': MyImages.motiondetection,
      'label': MyStrings.motiondetection.tr,
      'onTap': () {}
    },
    {
      'svgPath': MyImages.alert,
      'label': MyStrings.tamperalarm.tr,
      'onTap': () {}
    },
    {'svgPath': MyImages.siren, 'label': MyStrings.siren.tr, 'onTap': () {}},
    {'svgPath': MyImages.album, 'label': MyStrings.album.tr, 'onTap': () {}},
  ];

  @override
  Widget build(BuildContext context) {
    // Calculate how many pages we need (6 items, 6 per page)
    final int pageCount = (_featureItems.length / 6).ceil();

    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: pageCount,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (context, pageIndex) {
              // Get the items for this page
              final startIndex = pageIndex * 6;
              final endIndex = (pageIndex + 1) * 6;
              final pageItems = _featureItems.sublist(
                startIndex,
                endIndex > _featureItems.length
                    ? _featureItems.length
                    : endIndex,
              );

              return GridView.count(
                padding: const EdgeInsets.all(16),
                crossAxisCount: 3,
                children: pageItems.map((item) {
                  return _FeatureIcon(
                    svgPath: item['svgPath'],
                    label: item['label'],
                    onTap: item['onTap'],
                  );
                }).toList(),
              );
            },
          ),
        ),

        // Dots indicator
        Container(
          margin: const EdgeInsets.only(bottom: 100),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(pageCount, (index) {
              return Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index
                        ? MyColor.getGreyText()
                        : MyColor.secondaryColor),
              );
            }),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class _HistoryTabContent extends StatefulWidget {
  @override
  State<_HistoryTabContent> createState() => _HistoryTabContentState();
}

class _HistoryTabContentState extends State<_HistoryTabContent> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Define your feature items with SVG paths
  final List<Map<String, dynamic>> _featureItems = [
    {
      'svgPath': MyImages.calendar,
      'label': MyStrings.calendar.tr,
      'onTap': () {}
    },
    {'svgPath': MyImages.alert, 'label': MyStrings.alert.tr, 'onTap': () {}},
    {
      'svgPath': MyImages.screenshot,
      'label': MyStrings.screenshot.tr,
      'onTap': () {}
    },
    {
      'svgPath': MyImages.record,
      'label': MyStrings.recording.tr,
      'onTap': () {}
    },
    {'svgPath': MyImages.download, 'label': "Download", 'onTap': () {}},
    {'svgPath': MyImages.trash, 'label': MyStrings.delete.tr, 'onTap': () {}},
  ];

  @override
  Widget build(BuildContext context) {
    // Calculate how many pages we need (6 items, 6 per page)
    final int pageCount = (_featureItems.length / 6).ceil();

    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: pageCount,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (context, pageIndex) {
              // Get the items for this page
              final startIndex = pageIndex * 6;
              final endIndex = (pageIndex + 1) * 6;
              final pageItems = _featureItems.sublist(
                startIndex,
                endIndex > _featureItems.length
                    ? _featureItems.length
                    : endIndex,
              );

              return GridView.count(
                padding: const EdgeInsets.all(16),
                crossAxisCount: 3,
                children: pageItems.map((item) {
                  return _FeatureIcon(
                    svgPath: item['svgPath'],
                    label: item['label'],
                    onTap: item['onTap'],
                  );
                }).toList(),
              );
            },
          ),
        ),

        // Dots indicator
        Container(
          margin: const EdgeInsets.only(bottom: 100),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(pageCount, (index) {
              return Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == index
                      ? MyColor.primaryColor
                      : MyColor.secondaryColor,
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class udTabContent extends StatefulWidget {
  @override
  State<udTabContent> createState() => udTabContentState();
}

class udTabContentState extends State<udTabContent> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Define your feature items with SVG paths
  final List<Map<String, dynamic>> _featureItems = [
    {
      'svgPath': MyImages.screenshot,
      'label': MyStrings.screenshot.tr,
      'onTap': () {}
    },
    {
      'svgPath': MyImages.record,
      'label': MyStrings.recording.tr,
      'onTap': () {}
    },
    {'svgPath': MyImages.album, 'label': MyStrings.album.tr, 'onTap': () {}},
    {'svgPath': MyImages.trash, 'label': MyStrings.delete.tr, 'onTap': () {}},
  ];

  @override
  Widget build(BuildContext context) {
    // Calculate how many pages we need (6 items, 6 per page)
    final int pageCount = (_featureItems.length / 6).ceil();

    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: pageCount,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (context, pageIndex) {
              // Get the items for this page
              final startIndex = pageIndex * 6;
              final endIndex = (pageIndex + 1) * 6;
              final pageItems = _featureItems.sublist(
                startIndex,
                endIndex > _featureItems.length
                    ? _featureItems.length
                    : endIndex,
              );

              return GridView.count(
                padding: const EdgeInsets.all(16),
                crossAxisCount: 3,
                children: pageItems.map((item) {
                  return _FeatureIcon(
                    svgPath: item['svgPath'],
                    label: item['label'],
                    onTap: item['onTap'],
                  );
                }).toList(),
              );
            },
          ),
        ),

        // Dots indicator
        Container(
          margin: const EdgeInsets.only(bottom: 100),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(pageCount, (index) {
              return Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == index
                      ? MyColor.getGreyText()
                      : MyColor.secondaryColor,
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class _FeatureIcon extends StatelessWidget {
  final String svgPath;
  final String label;
  final VoidCallback onTap;

  const _FeatureIcon({
    required this.svgPath,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 26,
            backgroundColor: MyColor.transparentColor,
            child: SvgPicture.asset(
              svgPath,
              height: 26,
              color: MyColor.primaryColor,
            ),
          ),
          const SizedBox(height: 6),
          AppText(
            text: label,
            fontWeight: FontWeight.w500,
            color: MyColor.primaryColor,
            size: AppDimensions.FONT_SIZE_12,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class ScrollableRuler extends StatefulWidget {
  final double minValue;
  final double maxValue;
  final double step;
  final double initialValue;

  const ScrollableRuler({
    super.key,
    this.minValue = 0,
    this.maxValue = 200,
    this.step = 1,
    this.initialValue = 50,
  });

  @override
  State<ScrollableRuler> createState() => _ScrollableRulerState();
}

class _ScrollableRulerState extends State<ScrollableRuler> {
  final ScrollController _scrollController = ScrollController();
  double selectedValue = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final initialOffset =
          (widget.initialValue - widget.minValue) * 10; // spacing * step
      _scrollController.jumpTo(initialOffset);
      setState(() => selectedValue = widget.initialValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 55,
        width: MediaQuery.of(context).size.width * 0.7,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Scrollable ruler
            ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount:
                  ((widget.maxValue - widget.minValue) ~/ widget.step) + 1,
              itemBuilder: (context, index) {
                final value = widget.minValue + (index * widget.step);
                return Container(
                  width: 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: index % 10 == 0 ? 30 : 20,
                        width: 1,
                        color: MyColor.getGreyText(),
                      ),
                      if (index % 10 == 0)
                        AppText(
                          text: value.toInt().toString(),
                          size: 6,
                          fontWeight: FontWeight.w400,
                          color: MyColor.primaryColor,
                        ),
                        // Text(
                        //   value.toInt().toString(),
                        //   style: TextStyle(fontSize: 8),
                        // ),
                    ],
                  ),
                );
              },
            ),

            // Center Indicator (Arrow + Line + Dot)
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Arrow
                  Icon(Icons.arrow_drop_down, color: Colors.red, size: 25),
                  // Line
                  Container(width: 2, height: 20, color: Colors.red),
                  // Dot
                  Container(
                    margin: EdgeInsets.only(top: 2),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
