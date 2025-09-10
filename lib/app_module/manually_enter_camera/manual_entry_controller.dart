import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../models/camera_product_model.dart';
import '../../utils/custom_widget/strings.dart';
import '../add_cameras/add_battery_camera.dart';
import '../add_cameras/add_battery_camera_power_screen.dart';


class ManualEntryController extends GetxController {
  var permissionGranted = false.obs;
  var selectedCategory = RxString('');
  final selectedCategoryIndex = (-1).obs;

  // Define products for each category
   Map<String, List<Product>> categoryProducts = {};

  var screensData={
 [
      {
        "screen1":[
          MyStrings.holdthedevicepowerbutton.tr,
          MyStrings.pressthebatterycamerabuttontowakeup.tr,
        ],
        "screen2":[
           MyStrings.pleaseresetthedevice.tr,
          MyStrings.batterycameraresetbuttontext.tr,
        ],

      },

      {
        "screen1":[
          MyStrings.adddoorbellcameratitle.tr,
          MyStrings.adddoorbellcamerasubtitle.tr,
        ],
        "screen2":[
          MyStrings.adddoorbellcameranextsubtitle.tr,
          "",

        ],
      },
      {},
    ],
  };


  @override
  void onInit() {
    super.onInit();

    _askPermission();
Future.delayed(Duration.zero,(){
  categoryProducts = {
    "Battery Camera": [
      Product(name: "Battery Camera 1", screen: AddBatteryCameraPowerScreen(index1: 0,index2:0,)),
      Product(name: "Battery Camera 2", screen: AddBatteryCameraPowerScreen(index1: 0,index2:0,)),
      Product(name: "Battery Camera 3", screen: AddBatteryCameraPowerScreen(index1: 0,index2:0,)),
    ],
    "Smart Doorbell": [
      Product(name: "Smart Doorbell 1", screen: AddBatteryCameraPowerScreen(index1: 0,index2:1,)),
      Product(name: "Smart Doorbell 2", screen: AddBatteryCameraPowerScreen(index1:0,index2:1,)),
      Product(name: "Smart Doorbell 3", screen: AddBatteryCameraPowerScreen(index1: 0,index2:1,)),
    ],
    "Power Plug Camera": [
      Product(name: "Power Plug Camera 1", screen: AddBatteryCamera()),
      Product(name: "Power Plug Camera 2", screen: AddBatteryCamera()),
    ],
    "Baby Monitor": [
      Product(name: "Baby Monitor 1", screen: AddBatteryCamera()),
      Product(name: "Baby Monitor 2", screen: AddBatteryCamera()),
    ],
    "Floodlight Camera": [
      Product(name: "Floodlight Camera 1", screen: AddBatteryCamera()),
    ],
    "Pet Camera": [
      Product(name: "Pet Camera 1", screen: AddBatteryCamera()),
      Product(name: "Pet Camera 2", screen: AddBatteryCamera()),
    ],
    "4G Camera": [
      Product(name: "4G Camera 1", screen: AddBatteryCamera()),
    ],
    "Camera Kits": [
      Product(name: "Camera Kit 1", screen: AddBatteryCamera()),
      Product(name: "Camera Kit 2", screen: AddBatteryCamera()),
    ],
    "Hunting Camera": [
      Product(name: "Hunting Camera 1", screen: AddBatteryCamera()),
    ],
  };

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
   // Get.toNamed(product.screenRoute, arguments: product.arguments);

    // Alternatively, you could use conditional logic:
    /*
    switch (product.name) {
      case "Battery Camera 1":
        Get.toNamed('/batteryCamera1');
        break;
      case "Smart Doorbell 1":
        Get.toNamed('/doorbell1');
        break;
      // Add more cases for other products
      default:
        Get.toNamed('/defaultProductScreen');
    }
    */
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

/*import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';


class ManualEntryController extends GetxController {
  var permissionGranted = false.obs;
  var selectedCategory = RxString('');
  final selectedCategoryIndex = (-1).obs;


  @override
  void onInit() {
    super.onInit();
    _askPermission();
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
      // Show permission dialog using GetX
      Get.dialog(
        const PermissionDialog(),
      );
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
    print('Selected category: $category at index: $index'); // Debug print
  }

}*/
// class ManualEntryController extends GetxController {
//
//   var expandedCategory = RxString('');
//
//   final List<String> categories = [
//     "Battery Camera",
//     "Smart Doorbell",
//     "Power Plug Camera",
//     "Baby Monitor",
//     "Floodlight Camera",
//     "Pet Camera",
//     "4G Camera",
//     "Camera Kits",
//     "Hunting Camera",
//   ];
//
//
//
//   void toggleCategory(String category) {
//     if (expandedCategory.value == category) {
//       expandedCategory.value = '';
//     } else {
//       expandedCategory.value = category;
//     }
//   }
//
//   bool isExpanded(String category) => expandedCategory.value == category;
// }

//Separate widget for permission dialog
// class PermissionDialog extends StatelessWidget {
//   const PermissionDialog({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: const Text("Permission Required"),
//       content: const Text(
//           "Bluetooth permission is needed to continue. Please enable it in settings."),
//       actions: [
//         TextButton(
//           onPressed: () {
//             openAppSettings();
//             Get.back();
//           },
//           child: const Text("Open Settings"),
//         )
//       ],
//     );
//   }
// }