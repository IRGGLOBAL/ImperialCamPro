import 'package:get/get.dart';
import '../../Utils/app_imports/app_imports.dart';
import '../../utils/custom_widget/strings.dart';


class CameraSettingController extends GetxController {

  // reactive selected mode
  var selectedMode = "automatic".obs;
  var isFamilyShare = true.obs;
  var isShareTab = true.obs;
  var selectedBand = "2.4GHz".obs;
  TextEditingController wifiNameController = TextEditingController();
  TextEditingController wifiPasswordController = TextEditingController();

  void openWifiSettings() async {
    try {
      // Method to open WiFi settings on Android
      const platform = MethodChannel('your_channel_name/wifi');
      await platform.invokeMethod('openWifiSettings');
    } on PlatformException catch (e) {
      print("Failed to open WiFi settings: '${e.message}'");
      // Handle error or show a message to the user
    }
  }
  // void openWifiSettings() {
  //   final AndroidIntent intent = AndroidIntent(
  //     action: 'android.settings.WIFI_SETTINGS',
  //     flags: [Flag.FLAG_ACTIVITY_NEW_TASK],
  //   );
  //   intent.launch();
  // }

  void changeMode(String mode) {
    selectedMode.value = mode;
  }
  var receiveAlarmNotifications = true.obs;

  void toggleNotification(bool value) {
    receiveAlarmNotifications.value = value;
  }


  final PageController pageController = PageController();
  var currentPage = 0.obs;

  final List<Map<String, String>> guideSteps = [
    {
      "note": MyStrings.guideNote1.tr,
      "instruction": MyStrings.guideInstruction1.tr,
    },
    {
      "note": MyStrings.guideNote2.tr,
      "instruction": MyStrings.guideInstruction2.tr,
    },
    {
      "note": MyStrings.guideNote3.tr,
      "instruction": MyStrings.guideInstruction3.tr,
    },
  ];

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void nextPage() {
    if (currentPage.value < guideSteps.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  // 0 = Network, 1 = Bluetooth
  var selectedTab = 0.obs;

  void switchTab(int index) {
    if (index == 1) {
      // Show alert first when Bluetooth is clicked
      Get.defaultDialog(
        title:  MyStrings.tips.tr,
        middleText:
        MyStrings.ipaddresssettingalert.tr,
        textConfirm:  MyStrings.isee.tr,
        confirmTextColor: Get.theme.primaryColor,
        onConfirm: () {
          Get.back();
          selectedTab.value = index;
        },
      );
    } else {
      selectedTab.value = index;
    }
  }

}
