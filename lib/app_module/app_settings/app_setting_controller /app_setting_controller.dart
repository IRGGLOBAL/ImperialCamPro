

import 'package:campro/utils/Images/my_images.dart';
import 'package:campro/utils/custom_widget/my_color.dart';
import 'package:campro/utils/custom_widget/strings.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../../models/listitem_model.dart';

class AppSettingController extends GetxController {

  final RxList<ListItem> items = <ListItem>[].obs;
  final RxInt selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // Load your initial data
    loadItems();
  }

  void loadItems() {
    // Example data - replace with your actual data
    items.assignAll([
      ListItem(
        svgAsset: MyImages.helpsettinglisticon,
        text: MyStrings.walnutdoorbell.tr,
        color: MyColor.secondaryColor,
      ),
      ListItem(
        svgAsset: MyImages.helpsettinglisticon,
        text: "869 ${MyStrings.walnutbackdoor.tr}",
        color: MyColor.secondaryColor,
      ),
      ListItem(
        svgAsset: MyImages.helpsettinglisticon,
        text:  "869 ${MyStrings.walnutdoorbell.tr} 2",
        color: MyColor.secondaryColor,
      ),
      ListItem(
        svgAsset: MyImages.helpsettinglisticon,
        text: "${MyStrings.walnutfrontmailbox.tr}",
        color: MyColor.secondaryColor,
      ),
      ListItem(
        svgAsset: MyImages.helpsettinglisticon,
        text:  "${MyStrings.walnutfrontwindows.tr}",
        color: MyColor.secondaryColor,
      ),
      ListItem(
        svgAsset: MyImages.helpsettinglisticon,
        text:  "${MyStrings.thirdstfront.tr}",
        color: MyColor.secondaryColor,
      ),
    ]);
  }

  void updateItems(List<ListItem> newItems) {
    items.assignAll(newItems);
  }

  void selectItem(int index) {
    selectedIndex.value = index;
  }

  // Track which tile is selected (-1 means none)
  final RxInt selectedTileIndex = (-1).obs;

  // Track which question is expanded within a tile (-1 means none)
  final RxInt expandedQuestionIndex = (-1).obs;

  // Sample data for each tile - replace with your actual data
  final List<List<Map<String, String>>> tileItems = [
    // Items for first tile
    [
      {'question': '${MyStrings.cameraque1.tr}', 'answer': '${MyStrings.cameraans1.tr}'},
      {'question': '${MyStrings.cameraque2.tr}', 'answer': '${MyStrings.cameraans2.tr}'},
      {'question': '${MyStrings.cameraque3.tr}', 'answer': '${MyStrings.cameraans3.tr}'},
      {'question': '${MyStrings.cameraque4.tr}', 'answer': '${MyStrings.cameraans4.tr}'},
      {'question': '${MyStrings.cameraque5.tr}', 'answer': '${MyStrings.cameraans5.tr}'},
      {'question': '${MyStrings.cameraque6.tr}', 'answer': '${MyStrings.cameraans6.tr}'},
      {'question': '${MyStrings.cameraque7.tr}', 'answer': '${MyStrings.cameraans7.tr}'},
      {'question': '${MyStrings.cameraque8.tr}', 'answer': '${MyStrings.cameraans8.tr}'},
    ],
    // Items for second tile
    [
      {'question': '${MyStrings.cameramobileetectionque1.tr}', 'answer': '${MyStrings.cameramobileetectionans1.tr}'},
      {'question': '${MyStrings.cameramobileetectionque2.tr}', 'answer': '${MyStrings.cameramobileetectionans2.tr}'},
      {'question': '${MyStrings.cameramobileetectionque3.tr}', 'answer': '${MyStrings.cameramobileetectionans3.tr}'},
      {'question': '${MyStrings.cameramobileetectionque4.tr}', 'answer': '${MyStrings.cameramobileetectionans4.tr}'},
      {'question': '${MyStrings.cameramobileetectionque5.tr}', 'answer': '${MyStrings.cameramobileetectionans5.tr}'},
    ],
    // Items for third tile
    [
      {'question': '${MyStrings.cameraimagedetectionque1.tr}', 'answer': '${MyStrings.cameraimagedetectionans1.tr}'},
      {'question': '${MyStrings.cameraimagedetectionque2.tr}', 'answer': '${MyStrings.cameraimagedetectionans2.tr}'},
      {'question': '${MyStrings.cameraimagedetectionque3.tr}', 'answer': '${MyStrings.cameraimagedetectionans3.tr}'},
    ],
    // Items for fourth tile
    [
      {'question': '${MyStrings.cameramobilereplaytheaterque1.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans1.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque2.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans2.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque3.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans3.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque4.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans4.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque5.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans5.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque6.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans6.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque7.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans7.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque8.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans8.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque9.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans9.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque10.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans10.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque11.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans11.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque12.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans12.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque13.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans13.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque14.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans14.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque15.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans15.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque16.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans16.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque17.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans17.tr}'},
    ],
    // Items for fifth tile
    [
      {'question': '${MyStrings.camerahardwareissuesque1.tr}', 'answer': '${MyStrings.camerahardwareissuesans1.tr}'},
      {'question': '${MyStrings.camerahardwareissuesque2.tr}', 'answer': '${MyStrings.camerahardwareissuesans2.tr}'},
      {'question': '${MyStrings.camerahardwareissuesque3.tr}', 'answer': '${MyStrings.camerahardwareissuesans3.tr}'},
      {'question': '${MyStrings.camerahardwareissuesque4.tr}', 'answer': '${MyStrings.camerahardwareissuesans4.tr}'},
      {'question': '${MyStrings.camerahardwareissuesque5.tr}', 'answer': '${MyStrings.camerahardwareissuesans5.tr}'},
      {'question': '${MyStrings.camerahardwareissuesque6.tr}', 'answer': '${MyStrings.camerahardwareissuesans6.tr}'},
      {'question': '${MyStrings.camerahardwareissuesque7.tr}', 'answer': '${MyStrings.camerahardwareissuesans7.tr}'},
      {'question': '${MyStrings.camerahardwareissuesque8.tr}', 'answer': '${MyStrings.camerahardwareissuesans8.tr}'},
      {'question': '${MyStrings.camerahardwareissuesque9.tr}', 'answer': '${MyStrings.camerahardwareissuesans9.tr}'},
      {'question': '${MyStrings.camerahardwareissuesque10.tr}', 'answer': '${MyStrings.camerahardwareissuesans10.tr}'},
      {'question': '${MyStrings.camerahardwareissuesque11.tr}', 'answer': '${MyStrings.camerahardwareissuesans11.tr}'},
      {'question': '${MyStrings.camerahardwareissuesque12.tr}', 'answer': '${MyStrings.camerahardwareissuesans12.tr}'},
      {'question': '${MyStrings.camerahardwareissuesque13.tr}', 'answer': '${MyStrings.camerahardwareissuesans13.tr}'},
    ],
  ];

  final List<List<Map<String, String>>> doorbelltileItems = [
    // Items for fifth tile
    [
      {'question': '${MyStrings.doorbellque1.tr}', 'answer': '${MyStrings.doorbellans1.tr}'},
      {'question': '${MyStrings.doorbellque2.tr}', 'answer': '${MyStrings.doorbellans2.tr}'},
      {'question': '${MyStrings.doorbellque3.tr}', 'answer': '${MyStrings.doorbellans3.tr}'},
      {'question': '${MyStrings.doorbellque4.tr}', 'answer': '${MyStrings.doorbellans4.tr}'},
      {'question': '${MyStrings.doorbellque5.tr}', 'answer': '${MyStrings.doorbellans5.tr}'},
      {'question': '${MyStrings.doorbellque6.tr}', 'answer': '${MyStrings.doorbellans6.tr}'},
      {'question': '${MyStrings.doorbellque7.tr}', 'answer': '${MyStrings.doorbellans7.tr}'},
      {'question': '${MyStrings.doorbellque8.tr}', 'answer': '${MyStrings.doorbellans8.tr}'},
      {'question': '${MyStrings.doorbellque9.tr}', 'answer': '${MyStrings.doorbellans9.tr}'},
      {'question': '${MyStrings.doorbellque10.tr}', 'answer': '${MyStrings.doorbellans10.tr}'},
      {'question': '${MyStrings.doorbellque11.tr}', 'answer': '${MyStrings.doorbellans11.tr}'},
      {'question': '${MyStrings.doorbellque12.tr}', 'answer': '${MyStrings.doorbellans12.tr}'},
      {'question': '${MyStrings.doorbellque13.tr}', 'answer': '${MyStrings.doorbellans13.tr}'},
      {'question': '${MyStrings.doorbellque14.tr}', 'answer': '${MyStrings.doorbellans14.tr}'},
      {'question': '${MyStrings.doorbellque15.tr}', 'answer': '${MyStrings.doorbellans15.tr}'},
      //{'question': '${MyStrings.doorbellque16.tr}', 'answer': '${MyStrings.doorbellans16.tr}'},
      {'question': '${MyStrings.doorbellque17.tr}', 'answer': '${MyStrings.doorbellans17.tr}'},
      {'question': '${MyStrings.doorbellque18.tr}', 'answer': '${MyStrings.doorbellans18.tr}'},
      {'question': '${MyStrings.doorbellque19.tr}', 'answer': '${MyStrings.doorbellans19.tr}'},
      {'question': '${MyStrings.doorbellque20.tr}', 'answer': '${MyStrings.doorbellans20.tr}'},
      {'question': '${MyStrings.doorbellque21.tr}', 'answer': '${MyStrings.doorbellans21.tr}'},
      {'question': '${MyStrings.doorbellque22.tr}', 'answer': '${MyStrings.doorbellans22.tr}'},
      {'question': '${MyStrings.doorbellque23.tr}', 'answer': '${MyStrings.doorbellans23.tr}'},
      {'question': '${MyStrings.doorbellque24.tr}', 'answer': '${MyStrings.doorbellans24.tr}'},
      {'question': '${MyStrings.doorbellque25.tr}', 'answer': '${MyStrings.doorbellans25.tr}'},
      {'question': '${MyStrings.doorbellque26.tr}', 'answer': '${MyStrings.doorbellans26.tr}'},
      {'question': '${MyStrings.doorbellque27.tr}', 'answer': '${MyStrings.doorbellans27.tr}'},
      {'question': '${MyStrings.doorbellque28.tr}', 'answer': '${MyStrings.doorbellans28.tr}'},
      {'question': '${MyStrings.doorbellque29.tr}', 'answer': '${MyStrings.doorbellans29.tr}'},
      {'question': '${MyStrings.doorbellque30.tr}', 'answer': '${MyStrings.doorbellans30.tr}'},
      {'question': '${MyStrings.doorbellque31.tr}', 'answer': '${MyStrings.doorbellans31.tr}'},
    ],
  ];

  final List<List<Map<String, String>>> batterycameratileItems = [
    // Items for first tile
    [
      {'question': '${MyStrings.cameraque1.tr}', 'answer': '${MyStrings.cameraans1.tr}'},
      {'question': '${MyStrings.cameraque2.tr}', 'answer': '${MyStrings.cameraans2.tr}'},
      {'question': '${MyStrings.cameraque3.tr}', 'answer': '${MyStrings.cameraans3.tr}'},
      {'question': '${MyStrings.cameraque4.tr}', 'answer': '${MyStrings.cameraans4.tr}'},
      {'question': '${MyStrings.cameraque5.tr}', 'answer': '${MyStrings.cameraans5.tr}'},
      {'question': '${MyStrings.cameraque6.tr}', 'answer': '${MyStrings.cameraans6.tr}'},
      {'question': '${MyStrings.cameraque7.tr}', 'answer': '${MyStrings.cameraans7.tr}'},
      {'question': '${MyStrings.cameraque8.tr}', 'answer': '${MyStrings.cameraans8.tr}'},
    ],
    // Items for second tile
    [
      {'question': '${MyStrings.cameramobileetectionque1.tr}', 'answer': '${MyStrings.cameramobileetectionans1.tr}'},
      {'question': '${MyStrings.cameramobileetectionque2.tr}', 'answer': '${MyStrings.cameramobileetectionans2.tr}'},
      {'question': '${MyStrings.cameramobileetectionque3.tr}', 'answer': '${MyStrings.cameramobileetectionans3.tr}'},
      {'question': '${MyStrings.cameramobileetectionque4.tr}', 'answer': '${MyStrings.cameramobileetectionans4.tr}'},
      {'question': '${MyStrings.cameramobileetectionque5.tr}', 'answer': '${MyStrings.cameramobileetectionans5.tr}'},
    ],
    // Items for third tile
    [
      {'question': '${MyStrings.cameraimagedetectionque1.tr}', 'answer': '${MyStrings.cameraimagedetectionans1.tr}'},
      {'question': '${MyStrings.batterycameraque1.tr}', 'answer': '${MyStrings.batterycameraans1.tr}'},
      {'question': '${MyStrings.batterycameraque2.tr}', 'answer': '${MyStrings.batterycameraans2.tr}'},
      {'question': '${MyStrings.batterycameraque3.tr}', 'answer': '${MyStrings.batterycameraans3.tr}'},
      {'question': '${MyStrings.cameraimagedetectionque2.tr}', 'answer': '${MyStrings.cameraimagedetectionans2.tr}'},
      {'question': '${MyStrings.batterycameraque4.tr}', 'answer': '${MyStrings.batterycameraans4.tr}'},
      {'question': '${MyStrings.cameraimagedetectionque3.tr}', 'answer': '${MyStrings.cameraimagedetectionans3.tr}'},
    ],
    // Items for fourth tile
    [
      {'question': '${MyStrings.cameramobilereplaytheaterque1.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans1.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque2.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans2.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque3.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans3.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque4.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans4.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque5.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans5.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque6.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans6.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque7.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans7.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque8.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans8.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque9.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans9.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque10.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans10.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque11.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans11.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque12.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans12.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque13.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans13.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque14.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans14.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque15.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans15.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque16.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans16.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque17.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans17.tr}'},
    ],
    // Items for fifth tile
    [
      {'question': '${MyStrings.camerahardwareissuesque1.tr}', 'answer': '${MyStrings.camerahardwareissuesans1.tr}'},
      {'question': '${MyStrings.camerahardwareissuesque2.tr}', 'answer': '${MyStrings.camerahardwareissuesans2.tr}'},
      {'question': '${MyStrings.camerahardwareissuesque3.tr}', 'answer': '${MyStrings.camerahardwareissuesans3.tr}'},
      {'question': '${MyStrings.camerahardwareissuesque4.tr}', 'answer': '${MyStrings.camerahardwareissuesans4.tr}'},
      {'question': '${MyStrings.camerahardwareissuesque5.tr}', 'answer': '${MyStrings.camerahardwareissuesans5.tr}'},
      {'question': '${MyStrings.camerahardwareissuesque6.tr}', 'answer': '${MyStrings.camerahardwareissuesans6.tr}'},
      {'question': '${MyStrings.camerahardwareissuesque7.tr}', 'answer': '${MyStrings.camerahardwareissuesans7.tr}'},
      {'question': '${MyStrings.camerahardwareissuesque8.tr}', 'answer': '${MyStrings.camerahardwareissuesans8.tr}'},
      {'question': '${MyStrings.camerahardwareissuesque9.tr}', 'answer': '${MyStrings.camerahardwareissuesans9.tr}'},
      {'question': '${MyStrings.camerahardwareissuesque10.tr}', 'answer': '${MyStrings.camerahardwareissuesans10.tr}'},
      {'question': '${MyStrings.camerahardwareissuesque11.tr}', 'answer': '${MyStrings.camerahardwareissuesans11.tr}'},
      {'question': '${MyStrings.camerahardwareissuesque12.tr}', 'answer': '${MyStrings.camerahardwareissuesans12.tr}'},
      {'question': '${MyStrings.camerahardwareissuesque13.tr}', 'answer': '${MyStrings.camerahardwareissuesans13.tr}'},
      {'question': '${MyStrings.batterycameraharswareissueque1.tr}', 'answer': '${MyStrings.batterycameraharswareissueans1.tr}'},
      {'question': '${MyStrings.batterycameraharswareissueque2.tr}', 'answer': '${MyStrings.batterycameraharswareissuean2.tr}'},
      {'question': '${MyStrings.batterycameraharswareissueque3.tr}', 'answer': '${MyStrings.batterycameraharswareissueans3.tr}'},
      {'question': '${MyStrings.batterycameraharswareissueque4.tr}', 'answer': '${MyStrings.batterycameraharswareissueans4.tr}'},
      {'question': '${MyStrings.batterycameraharswareissueque5.tr}', 'answer': '${MyStrings.batterycameraharswareissueans5.tr}'},
      {'question': '${MyStrings.batterycameraharswareissueque6.tr}', 'answer': '${MyStrings.batterycameraharswareissueans6.tr}'},
    ],
    // Items for sixth tile
    [
      {'question': '${MyStrings.batterycameraaudiblevisualalarmque1.tr}', 'answer': '${MyStrings.batterycameraaudiblevisualalarmans1.tr}'},
      {'question': '${MyStrings.batterycameraaudiblevisualalarmque2.tr}', 'answer': '${MyStrings.batterycameraaudiblevisualalarmans2.tr}'},

    ],
  ];

  final List<List<Map<String, String>>> fourgcameratileItems = [
    // Items for first tile
    [
      {'question': '${MyStrings.fourgvameranetworkconnectionque1.tr}', 'answer': '${MyStrings.fourgvameranetworkconnectionans1.tr}'},
      {'question': '${MyStrings.fourgvameranetworkconnectionque2.tr}', 'answer': '${MyStrings.fourgvameranetworkconnectionans2.tr}'},
      {'question': '${MyStrings.fourgvameranetworkconnectionque3.tr}', 'answer': '${MyStrings.fourgvameranetworkconnectionans3.tr}'},
      {'question': '${MyStrings.fourgvameranetworkconnectionque4.tr}', 'answer': '${MyStrings.fourgvameranetworkconnectionans4.tr}'},
      {'question': '${MyStrings.fourgvameranetworkconnectionque5.tr}', 'answer': '${MyStrings.fourgvameranetworkconnectionans5.tr}'},
      {'question': '${MyStrings.fourgvameranetworkconnectionque6.tr}', 'answer': '${MyStrings.fourgvameranetworkconnectionans6.tr}'},
      {'question': '${MyStrings.fourgvameranetworkconnectionque7.tr}', 'answer': '${MyStrings.fourgvameranetworkconnectionans7.tr}'},
      {'question': '${MyStrings.fourgvameranetworkconnectionque8.tr}', 'answer': '${MyStrings.fourgvameranetworkconnectionans8.tr}'},
      {'question': '${MyStrings.fourgvameranetworkconnectionque9.tr}', 'answer': '${MyStrings.fourgvameranetworkconnectionans9.tr}'},
      {'question': '${MyStrings.fourgvameranetworkconnectionque10.tr}', 'answer': '${MyStrings.fourgvameranetworkconnectionans10.tr}'},
      {'question': '${MyStrings.fourgvameranetworkconnectionque11.tr}', 'answer': '${MyStrings.fourgvameranetworkconnectionans11.tr}'},
      {'question': '${MyStrings.fourgvameranetworkconnectionque12.tr}', 'answer': '${MyStrings.fourgvameranetworkconnectionans12.tr}'},
      {'question': '${MyStrings.fourgvameranetworkconnectionque13.tr}', 'answer': '${MyStrings.fourgvameranetworkconnectionans13.tr}'},
    ],
    // Items for second tile
    [
      {'question': '${MyStrings.cameramobileetectionque1.tr}', 'answer': '${MyStrings.cameramobileetectionans1.tr}'},
      {'question': '${MyStrings.cameramobileetectionque2.tr}', 'answer': '${MyStrings.cameramobileetectionans2.tr}'},
      {'question': '${MyStrings.cameramobileetectionque3.tr}', 'answer': '${MyStrings.cameramobileetectionans3.tr}'},
      {'question': '${MyStrings.cameramobileetectionque4.tr}', 'answer': '${MyStrings.cameramobileetectionans4.tr}'},
      {'question': '${MyStrings.cameramobileetectionque5.tr}', 'answer': '${MyStrings.cameramobileetectionans5.tr}'},
      {'question': '${MyStrings.fourgvameramobiledetectionque1.tr}', 'answer': '${MyStrings.fourgvameramobiledetectionans1.tr}'},
      {'question': '${MyStrings.fourgvameramobiledetectionque2.tr}', 'answer': '${MyStrings.fourgvameramobiledetectionans2.tr}'},
      {'question': '${MyStrings.fourgvameramobiledetectionque3.tr}', 'answer': '${MyStrings.fourgvameramobiledetectionans3.tr}'},
    ],
    // Items for third tile
    [
      {'question': '${MyStrings.cameraimagedetectionque1.tr}', 'answer': '${MyStrings.cameraimagedetectionans1.tr}'},
      {'question': '${MyStrings.batterycameraque1.tr}', 'answer': '${MyStrings.batterycameraans1.tr}'},
      {'question': '${MyStrings.batterycameraque2.tr}', 'answer': '${MyStrings.batterycameraans2.tr}'},
      {'question': '${MyStrings.batterycameraque3.tr}', 'answer': '${MyStrings.batterycameraans3.tr}'},
      {'question': '${MyStrings.cameraimagedetectionque2.tr}', 'answer': '${MyStrings.cameraimagedetectionans2.tr}'},
      {'question': '${MyStrings.batterycameraque4.tr}', 'answer': '${MyStrings.batterycameraans4.tr}'},
      {'question': '${MyStrings.cameraimagedetectionque3.tr}', 'answer': '${MyStrings.cameraimagedetectionans3.tr}'},
    ],
    // Items for fourth tile
    [
      {'question': '${MyStrings.fourgvameratrafficpurchaseque1.tr}', 'answer': '${MyStrings.fourgvameratrafficpurchaseans1.tr}'},
      {'question': '${MyStrings.fourgvameratrafficpurchaseque2.tr}', 'answer': '${MyStrings.fourgvameratrafficpurchaseans2.tr}'},
      {'question': '${MyStrings.fourgvameratrafficpurchaseque3.tr}', 'answer': '${MyStrings.fourgvameratrafficpurchasean3.tr}'},
      {'question': '${MyStrings.fourgvameratrafficpurchaseque4.tr}', 'answer': '${MyStrings.fourgvameratrafficpurchaseans4.tr}'},
      {'question': '${MyStrings.fourgvameratrafficpurchaseque5.tr}', 'answer': '${MyStrings.fourgvameratrafficpurchaseans5.tr}'},
      {'question': '${MyStrings.fourgvameratrafficpurchaseque6.tr}', 'answer': '${MyStrings.fourgvameratrafficpurchaseans6.tr}'},

    ],
    // Items for fifth tile
    [
      {'question': '${MyStrings.camerahardwareissuesque1.tr}', 'answer': '${MyStrings.camerahardwareissuesans1.tr}'},
      {'question': '${MyStrings.camerahardwareissuesque2.tr}', 'answer': '${MyStrings.camerahardwareissuesans2.tr}'},
      {'question': '${MyStrings.camerahardwareissuesque3.tr}', 'answer': '${MyStrings.camerahardwareissuesans3.tr}'},
      {'question': '${MyStrings.camerahardwareissuesque4.tr}', 'answer': '${MyStrings.camerahardwareissuesans4.tr}'},
      {'question': '${MyStrings.camerahardwareissuesque5.tr}', 'answer': '${MyStrings.camerahardwareissuesans5.tr}'},
      {'question': '${MyStrings.camerahardwareissuesque6.tr}', 'answer': '${MyStrings.camerahardwareissuesans6.tr}'},
      {'question': '${MyStrings.camerahardwareissuesque7.tr}', 'answer': '${MyStrings.camerahardwareissuesans7.tr}'},
      {'question': '${MyStrings.camerahardwareissuesque8.tr}', 'answer': '${MyStrings.camerahardwareissuesans8.tr}'},
      {'question': '${MyStrings.camerahardwareissuesque9.tr}', 'answer': '${MyStrings.camerahardwareissuesans9.tr}'},
      {'question': '${MyStrings.camerahardwareissuesque10.tr}', 'answer': '${MyStrings.camerahardwareissuesans10.tr}'},
      {'question': '${MyStrings.camerahardwareissuesque11.tr}', 'answer': '${MyStrings.camerahardwareissuesans11.tr}'},
      {'question': '${MyStrings.camerahardwareissuesque12.tr}', 'answer': '${MyStrings.camerahardwareissuesans12.tr}'},
      {'question': '${MyStrings.camerahardwareissuesque13.tr}', 'answer': '${MyStrings.camerahardwareissuesans13.tr}'},
      {'question': '${MyStrings.batterycameraharswareissueque1.tr}', 'answer': '${MyStrings.batterycameraharswareissueans1.tr}'},
      {'question': '${MyStrings.batterycameraharswareissueque2.tr}', 'answer': '${MyStrings.batterycameraharswareissuean2.tr}'},
      {'question': '${MyStrings.batterycameraharswareissueque3.tr}', 'answer': '${MyStrings.batterycameraharswareissueans3.tr}'},
      {'question': '${MyStrings.batterycameraharswareissueque4.tr}', 'answer': '${MyStrings.batterycameraharswareissueans4.tr}'},
      {'question': '${MyStrings.batterycameraharswareissueque5.tr}', 'answer': '${MyStrings.batterycameraharswareissueans5.tr}'},
      {'question': '${MyStrings.batterycameraharswareissueque6.tr}', 'answer': '${MyStrings.batterycameraharswareissueans6.tr}'},
      {'question': '${MyStrings.fourgvamerahardwareissueque1.tr}', 'answer': '${MyStrings.fourgvamerahardwareissueans1.tr}'},
      {'question': '${MyStrings.fourgvamerahardwareissueque2.tr}', 'answer': '${MyStrings.fourgvamerahardwareissueans2.tr}'},
    ],
    // Items for sixth tile
    [
      {'question': '${MyStrings.cameramobilereplaytheaterque1.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans1.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque2.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans2.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque3.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans3.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque4.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans4.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque5.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans5.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque6.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans6.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque7.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans7.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque8.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans8.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque9.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans9.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque10.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans10.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque11.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans11.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque13.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans13.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque14.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans14.tr}'},
    ],
  ];

  final List<List<Map<String, String>>> babymonitortileItems = [
    // Items for first tile
    [
      {'question': '${MyStrings.cameraque1.tr}', 'answer': '${MyStrings.cameraans1.tr}'},
      {'question': '${MyStrings.cameraque2.tr}', 'answer': '${MyStrings.cameraans2.tr}'},
      {'question': '${MyStrings.cameraque3.tr}', 'answer': '${MyStrings.cameraans3.tr}'},
      {'question': '${MyStrings.cameraque4.tr}', 'answer': '${MyStrings.cameraans4.tr}'},
      {'question': '${MyStrings.cameraque5.tr}', 'answer': '${MyStrings.cameraans5.tr}'},
      {'question': '${MyStrings.cameraque6.tr}', 'answer': '${MyStrings.cameraans6.tr}'},
      {'question': '${MyStrings.cameraque7.tr}', 'answer': '${MyStrings.cameraans7.tr}'},
      {'question': '${MyStrings.cameraque8.tr}', 'answer': '${MyStrings.cameraans8.tr}'},
    ],
    // Items for second tile
    [
      {'question': '${MyStrings.cameramobileetectionque1.tr}', 'answer': '${MyStrings.cameramobileetectionans1.tr}'},
      {'question': '${MyStrings.cameramobileetectionque2.tr}', 'answer': '${MyStrings.cameramobileetectionans2.tr}'},
      {'question': '${MyStrings.cameramobileetectionque3.tr}', 'answer': '${MyStrings.cameramobileetectionans3.tr}'},
      {'question': '${MyStrings.cameramobileetectionque4.tr}', 'answer': '${MyStrings.cameramobileetectionans4.tr}'},
      {'question': '${MyStrings.cameramobileetectionque5.tr}', 'answer': '${MyStrings.cameramobileetectionans5.tr}'},
    ],
    // Items for third tile
    [
      {'question': '${MyStrings.cameraimagedetectionque1.tr}', 'answer': '${MyStrings.cameraimagedetectionans1.tr}'},
      {'question': '${MyStrings.cameraimagedetectionque2.tr}', 'answer': '${MyStrings.cameraimagedetectionans2.tr}'},
      {'question': '${MyStrings.cameraimagedetectionque3.tr}', 'answer': '${MyStrings.cameraimagedetectionans3.tr}'},
      {'question': '${MyStrings.babymonitorimageissuesque1.tr}', 'answer': '${MyStrings.babymonitorimageissuesans1.tr}'},
      {'question': '${MyStrings.babymonitorimageissuesque2.tr}', 'answer': '${MyStrings.babymonitorimageissuesans2.tr}'},
    ],
    // Items for fourth tile
    [
      {'question': '${MyStrings.cameramobilereplaytheaterque1.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans1.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque2.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans2.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque3.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans3.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque4.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans4.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque5.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans5.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque6.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans6.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque7.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans7.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque8.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans8.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque9.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans9.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque10.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans10.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque11.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans11.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque12.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans12.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque13.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans13.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque14.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans14.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque15.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans15.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque16.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans16.tr}'},
      {'question': '${MyStrings.cameramobilereplaytheaterque17.tr}', 'answer': '${MyStrings.cameramobilereplaytheaterans17.tr}'},
      {'question': '${MyStrings.babymonitorreplaytheaterque1.tr}', 'answer': '${MyStrings.babymonitorreplaytheaterans1.tr}'},
    ],
    // Items for fifth tile
    [
      {'question': '${MyStrings.camerahardwareissuesque1.tr}', 'answer': '${MyStrings.camerahardwareissuesans1.tr}'},
      {'question': '${MyStrings.camerahardwareissuesque2.tr}', 'answer': '${MyStrings.camerahardwareissuesans2.tr}'},
      {'question': '${MyStrings.camerahardwareissuesque3.tr}', 'answer': '${MyStrings.camerahardwareissuesans3.tr}'},
      {'question': '${MyStrings.camerahardwareissuesque4.tr}', 'answer': '${MyStrings.camerahardwareissuesans4.tr}'},
      {'question': '${MyStrings.camerahardwareissuesque5.tr}', 'answer': '${MyStrings.camerahardwareissuesans5.tr}'},
      {'question': '${MyStrings.camerahardwareissuesque6.tr}', 'answer': '${MyStrings.camerahardwareissuesans6.tr}'},
      {'question': '${MyStrings.camerahardwareissuesque7.tr}', 'answer': '${MyStrings.camerahardwareissuesans7.tr}'},
      {'question': '${MyStrings.camerahardwareissuesque8.tr}', 'answer': '${MyStrings.camerahardwareissuesans8.tr}'},
      {'question': '${MyStrings.camerahardwareissuesque9.tr}', 'answer': '${MyStrings.camerahardwareissuesans9.tr}'},
      {'question': '${MyStrings.camerahardwareissuesque10.tr}', 'answer': '${MyStrings.camerahardwareissuesans10.tr}'},
      {'question': '${MyStrings.camerahardwareissuesque11.tr}', 'answer': '${MyStrings.camerahardwareissuesans11.tr}'},
      {'question': '${MyStrings.camerahardwareissuesque12.tr}', 'answer': '${MyStrings.camerahardwareissuesans12.tr}'},
      {'question': '${MyStrings.camerahardwareissuesque13.tr}', 'answer': '${MyStrings.camerahardwareissuesans13.tr}'},
    ],
  ];

  final List<List<Map<String, String>>> appfunctionexperiencetileItems = [
    // Items for fifth tile
    [
      {'question': '${MyStrings.appfunctionexperienceque1.tr}', 'answer': '${MyStrings.appfunctionexperienceans1.tr}'},
      {'question': '${MyStrings.appfunctionexperienceque2.tr}', 'answer': '${MyStrings.appfunctionexperienceans2.tr}'},
      {'question': '${MyStrings.appfunctionexperienceque3.tr}', 'answer': '${MyStrings.appfunctionexperienceans3.tr}'},
      {'question': '${MyStrings.appfunctionexperienceque4.tr}', 'answer': '${MyStrings.appfunctionexperienceans4.tr}'},
      {'question': '${MyStrings.appfunctionexperienceque5.tr}', 'answer': '${MyStrings.appfunctionexperienceans5.tr}'},
      {'question': '${MyStrings.appfunctionexperienceque6.tr}', 'answer': '${MyStrings.appfunctionexperienceans6.tr}'},
      {'question': '${MyStrings.appfunctionexperienceque7.tr}', 'answer': '${MyStrings.appfunctionexperienceans7.tr}'},
      {'question': '${MyStrings.appfunctionexperienceque8.tr}', 'answer': '${MyStrings.appfunctionexperienceans8.tr}'},
      {'question': '${MyStrings.appfunctionexperienceque9.tr}', 'answer': '${MyStrings.appfunctionexperienceans9.tr}'},
      {'question': '${MyStrings.appfunctionexperienceque10.tr}', 'answer': '${MyStrings.appfunctionexperienceans10.tr}'},

    ],
  ];

  final List<List<Map<String, String>>> accounttileItems = [
    // Items for fifth tile
    [
      {'question': '${MyStrings.accountque1.tr}', 'answer': '${MyStrings.accountans1.tr}'},
      {'question': '${MyStrings.accountque2.tr}', 'answer': '${MyStrings.accountans2.tr}'},
      {'question': '${MyStrings.accountque3.tr}', 'answer': '${MyStrings.accountans3.tr}'},
      {'question': '${MyStrings.accountque4.tr}', 'answer': '${MyStrings.accountans4.tr}'},
      {'question': '${MyStrings.accountque5.tr}', 'answer': '${MyStrings.accountans5.tr}'},
      {'question': '${MyStrings.accountque6.tr}', 'answer': '${MyStrings.accountans6.tr}'},
      {'question': '${MyStrings.accountque7.tr}', 'answer': '${MyStrings.accountans7.tr}'},
      {'question': '${MyStrings.accountque8.tr}', 'answer': '${MyStrings.accountans8.tr}'},
      {'question': '${MyStrings.accountque9.tr}', 'answer': '${MyStrings.accountans9.tr}'},
      {'question': '${MyStrings.accountque10.tr}', 'answer': '${MyStrings.accountans10.tr}'},
      {'question': '${MyStrings.accountque11.tr}', 'answer': '${MyStrings.accountans11.tr}'},
      {'question': '${MyStrings.accountque12.tr}', 'answer': '${MyStrings.accountans12.tr}'},
      {'question': '${MyStrings.accountque13.tr}', 'answer': '${MyStrings.accountans13.tr}'},
      {'question': '${MyStrings.accountque14.tr}', 'answer': '${MyStrings.accountans14.tr}'},
      {'question': '${MyStrings.accountque15.tr}', 'answer': '${MyStrings.accountans15.tr}'},
      {'question': '${MyStrings.accountque16.tr}', 'answer': '${MyStrings.accountans16.tr}'},
      {'question': '${MyStrings.accountque17.tr}', 'answer': '${MyStrings.accountans17.tr}'},
      {'question': '${MyStrings.accountque18.tr}', 'answer': '${MyStrings.accountans18.tr}'},
      {'question': '${MyStrings.accountque19.tr}', 'answer': '${MyStrings.accountans19.tr}'},


    ],
  ];

  // Track expanded state for each question using a map
  final RxMap<int, bool> expandedQuestions = <int, bool>{}.obs;

  final List<List<Map<String, String>>> paidsubscriptiontileItems =  [
    // Items for first tile
    [
      {'question': '${MyStrings.paidsubscriptionque3.tr}', 'answer': '${MyStrings.paidsubscriptionans3.tr}'},
      {'question': '${MyStrings.paidsubscriptionque4.tr}', 'answer': '${MyStrings.paidsubscriptionans4.tr}'},
      {'question': '${MyStrings.paidsubscriptionque5.tr}', 'answer': '${MyStrings.paidsubscriptionans5.tr}'},

    ],
    // Items for second tile
    [
      {'question': '${MyStrings.cameramobileetectionque1.tr}', 'answer': '${MyStrings.cameramobileetectionans1.tr}'},

    ],

  ];

  // Select a specific tile
  void selectTile(int index) {
    selectedTileIndex.value = index;
    expandedQuestions.clear(); // Clear all expanded questions when changing tiles
  }

  // Go back to the main list
  void goBack() {
    selectedTileIndex.value = -1;
    expandedQuestions.clear();
  }

  // Toggle question expansion
  void toggleQuestion(int index) {
    if (expandedQuestions[index] == true) {
      expandedQuestions.remove(index); // Remove from map to collapse
    } else {
      expandedQuestions[index] = true; // Add to map to expand
    }
    // Only update the specific question state
    expandedQuestions.refresh();
  }

  // Check if a question is expanded
  bool isQuestionExpanded(int index) {
    return expandedQuestions[index] == true;
  }

}