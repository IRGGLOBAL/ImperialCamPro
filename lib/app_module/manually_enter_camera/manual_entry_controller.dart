import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../models/camera_product_model.dart';
import '../../utils/custom_widget/strings.dart';
import '../add_cameras/4G_camera_flow/fourg_add_battery_camera_power_screen.dart';
import '../add_cameras/add_battery_camera.dart';
import '../add_cameras/add_battery_camera_power_screen.dart';


class ManualEntryController extends GetxController {
  var permissionGranted = false.obs;
  var selectedCategory = RxString('');
  final selectedCategoryIndex = (-1).obs;

  // Define products for each category
  Map<String, List<Product>> categoryProducts = {};


  // Fixed screensData structure
  final Map<String, Map<String, List<String>>> screensData = {
    "Battery Camera": {
      "screen1": [
        MyStrings.holdthedevicepowerbutton.tr,
        MyStrings.pressthebatterycamerabuttontowakeup.tr,
      ],
      "screen2": [
        MyStrings.pleaseresetthedevice.tr,
        MyStrings.batterycameraresetbuttontext.tr,
      ],
    },
    "Smart Doorbell": {
      "screen1": [
        MyStrings.adddoorbellcameratitle.tr,
        MyStrings.adddoorbellcamerasubtitle.tr,
      ],
      "screen2": [
        MyStrings.adddoorbellcameranextsubtitle.tr,
        "",
      ],
      "screen3": [
        MyStrings.pleaseresetthedevice.tr,
        MyStrings.batterycameraresetbuttontext.tr,
      ],
    },
    "Power Plug Camera": {
      "screen1": [
        MyStrings.adddoorbellcameratitle.tr,
        MyStrings.powerplugincamerasubtitle.tr,
      ],
      "screen2": [
        MyStrings.pleaseresetthedevice.tr,
        MyStrings.powerplugincameraresetbuttontext.tr,
      ],
    },
    "Baby Monitor": {
      "screen1": [
        MyStrings.holdthedevicepowerbutton.tr,
        MyStrings.pressthebatterycamerabuttontowakeup.tr,
      ],
      "screen2": [
        MyStrings.pleaseresetthedevice.tr,
        MyStrings.babymonitorcameranextsubtitle.tr,
      ],
    },
    "Floodlight Camera": {
      "screen1": [
        MyStrings.holdthedevicepowerbutton.tr,
        MyStrings.powerplugincamerasubtitle.tr,
      ],
      "screen2": [
        MyStrings.pleaseresetthedevice.tr,
        MyStrings.powerplugincameraresetbuttontext.tr,
      ],
    },
    "Pet Camera": {
      "screen1": [
        MyStrings.holdthedevicepowerbutton.tr,
        MyStrings.powerplugincamerasubtitle.tr,
      ],
      "screen2": [
        MyStrings.pleaseresetthedevice.tr,
        MyStrings.powerplugincameraresetbuttontext.tr,
      ],
    },
    "4G Camera": {
      "screen1": [
        MyStrings.fourgcameratitle.tr,
        MyStrings.fourgcamerasubtitle.tr,
      ],
      "screen2": [
        MyStrings.fourgcameranexttitle.tr,
        MyStrings.fourgcameranextsubtitle.tr,
      ],
      "screen3": [
        "",
        MyStrings.fourgcamerathirdtitle.tr,
      ],
    },
    "Camera Kits": {
      "screen1": [
        MyStrings.camerakittitle.tr,
        MyStrings.camerakitsubtitle.tr,
      ],
      "screen2": [
        MyStrings.camerakitnexttitle.tr,
        MyStrings.camerakitnextsubtitle.tr,
      ],
    },
    "Hunting Camera": {
      "screen1": [
        MyStrings.camerakittitle.tr,
        MyStrings.camerakitsubtitle.tr,
      ],
      "screen2": [
        MyStrings.camerakitnexttitle.tr,
        MyStrings.camerakitnextsubtitle.tr,
      ],
    },
  };


  int getTotalScreensForCategory(String category) {
    final categoryData = screensData[category];
    return categoryData?.length ?? 0;
  }

  bool hasNextScreen(String category, int currentScreenIndex) {
    final nextScreenKey = "screen${currentScreenIndex + 1}";
    return screensData[category]?.containsKey(nextScreenKey) ?? false;
  }

  @override
  void onInit() {
    super.onInit();

    _askPermission();
    Future.delayed(Duration.zero,(){ categoryProducts = {
      "Battery Camera": [
        Product(
          name: "Battery Camera 1",
          screen: AddBatteryCameraPowerScreen(category: "Battery Camera", screenIndex: 1),
        ),
        Product(
          name: "Battery Camera 2",
          screen: AddBatteryCameraPowerScreen(category: "Battery Camera", screenIndex: 1),
        ),
        Product(
          name: "Battery Camera 3",
          screen: AddBatteryCameraPowerScreen(category: "Battery Camera", screenIndex: 1),
        ),
      ],
      "Smart Doorbell": [
        Product(
          name: "Smart Doorbell 1",
          screen: AddBatteryCameraPowerScreen(category: "Smart Doorbell", screenIndex: 1),
        ),
        Product(
          name: "Smart Doorbell 2",
          screen: AddBatteryCameraPowerScreen(category: "Smart Doorbell", screenIndex: 1),
        ),
        Product(
          name: "Smart Doorbell 3",
          screen: AddBatteryCameraPowerScreen(category: "Smart Doorbell", screenIndex: 1),
        ),
      ],
      "Power Plug Camera": [
        Product(
          name: "Power Plug Camera 1",
          screen: AddBatteryCameraPowerScreen(category: "Power Plug Camera", screenIndex: 1),
        ),
        Product(
          name: "Power Plug Camera 2",
          screen: AddBatteryCameraPowerScreen(category: "Power Plug Camera", screenIndex: 1),
        ),
      ],
      "Baby Monitor": [
        Product(
          name: "Baby Monitor 1",
          screen: AddBatteryCameraPowerScreen(category: "Baby Monitor", screenIndex: 1),
        ),
        Product(
          name: "Baby Monitor 2",
          screen: AddBatteryCameraPowerScreen(category: "Baby Monitor", screenIndex: 1),
        ),
      ],
      "Floodlight Camera": [
        Product(
          name: "Floodlight Camera 1",
          screen: AddBatteryCameraPowerScreen(category: "Floodlight Camera", screenIndex: 1),
        ),
      ],
      "Pet Camera": [
        Product(
          name: "Pet Camera 1",
          screen: AddBatteryCameraPowerScreen(category: "Pet Camera", screenIndex: 1),
        ),
        Product(
          name: "Pet Camera 2",
          screen: AddBatteryCameraPowerScreen(category: "Pet Camera", screenIndex: 1),
        ),
      ],
      "4G Camera": [
        Product(
          name: "4G Camera 1",
          screen: FourgAddBatteryCameraPowerScreen(),
        ),
      ],
      "Camera Kits": [
        Product(
          name: "Camera Kit 1",
          screen: AddBatteryCameraPowerScreen(category: "Camera Kits", screenIndex: 1),
        ),
        Product(
          name: "Camera Kit 2",
          screen: AddBatteryCameraPowerScreen(category: "Camera Kits", screenIndex: 1),
        ),
      ],
      "Hunting Camera": [
        Product(
          name: "Hunting Camera 1",
          screen: AddBatteryCameraPowerScreen(category: "Hunting Camera", screenIndex: 1),
        ),
      ],
    };});


    worker = ever(secondsRemaining, (_) {
      if (secondsRemaining.value > 0) {
        Future.delayed(const Duration(seconds: 1), () {
          secondsRemaining.value--;
        });
      }
    });

  }

  Future<void> _askPermission() async {
    if (await Permission.bluetoothScan.isDenied ||
        await Permission.bluetoothConnect.isDenied) {
      await [
        Permission.bluetoothScan,
        Permission.bluetoothConnect,
        Permission.bluetoothAdvertise,
        Permission.location,
      ].request();
    }

    if (await Permission.bluetoothScan.isGranted ||
        await Permission.bluetoothConnect.isGranted ||
        await Permission.bluetooth.isGranted ||
        await Permission.location.isGranted) {
      permissionGranted.value = true;
    } else {
      Get.dialog(const PermissionDialog());
    }
  }

  bool get showBluetoothAnimation => !permissionGranted.value;

  final List<String> categories = [
    "Battery Camera",
    "Smart Doorbell",
    "Power Plug Camera",
    "Baby Monitor",
    "Floodlight Camera",
    "Pet Camera",
    "4G Camera",
    "Camera Kits",
    "Hunting Camera",
  ];

  void selectCategory(String category, int index) {
    selectedCategory.value = category;
    selectedCategoryIndex.value = index;
  }

  // Get products for a specific category
  List<Product> getProductsForCategory(String category) {
    return categoryProducts[category] ?? [];
  }

  // Handle product tap with different navigation for each product
  void handleProductTap(Product product) {
    // Navigate to different screens based on the product
    Get.to(() => product.screen, arguments: product.arguments);

  }

  ///fourg controller
  var secondsRemaining = 120.obs; // 2 minutes timer
  late final worker;

  String get timerText {
    final minutes = (secondsRemaining.value ~/ 60).toString().padLeft(2, '0');
    final seconds = (secondsRemaining.value % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  void onClose() {
    worker?.dispose();
    super.onClose();
  }
}

// Placeholder for permission dialog
class PermissionDialog extends StatelessWidget {
  const PermissionDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Permission Required'),
      content: Text('Bluetooth permission is required to use this feature.'),
      actions: [
        TextButton(
          onPressed: () => openAppSettings(),
          child: Text('Open Settings'),
        ),
        TextButton(
          onPressed: () => Get.back(),
          child: Text('Cancel'),
        ),
      ],
    );
  }
}



