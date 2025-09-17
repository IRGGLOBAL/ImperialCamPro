import 'package:campro/utils/custom_widget/my_color.dart';
import 'package:campro/utils/custom_widget/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/Fonts/AppDimensions.dart';
import '../../utils/Widgets/AppText.dart';
import '../camera_settings/camera_setting_controller.dart';

class ShareDevicesView extends StatelessWidget {
  ShareDevicesView({Key? key}) : super(key: key);

  final CameraSettingController c = Get.put(CameraSettingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: AppText(
          text: MyStrings.sharedevices.tr,
          size: AppDimensions.FONT_SIZE_16,
          fontWeight: FontWeight.w600,
          color: MyColor.primaryColor,
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: MyColor.transparentColor,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            //  Family / Device Toggle
            Obx(() => Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () => c.isFamilyShare.value = true,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: c.isFamilyShare.value
                            ? Colors.white
                            : Colors.grey.shade200,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                        ),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Center(
                        child: Text(
                          MyStrings.familyshare.tr,
                          style: TextStyle(
                            color: c.isFamilyShare.value
                                ? MyColor.primaryColor
                                : MyColor.primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () => c.isFamilyShare.value = false,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: !c.isFamilyShare.value
                            ? Colors.white
                            : Colors.grey.shade200,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Center(
                        child: Text(
                          MyStrings.deviseshare.tr,
                          style: TextStyle(
                            color: !c.isFamilyShare.value
                                ? MyColor.primaryColor
                                : MyColor.primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )),

            const SizedBox(height: 16),

            // Share / Accept Toggle
            Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FilterChip(
                  label:  Text( MyStrings.share.tr,),
                  selected: c.isShareTab.value,
                  onSelected: (val) => c.isShareTab.value = true,
                  selectedColor: Colors.red,
                  backgroundColor: MyColor.colorWhite,
                  showCheckmark: false, // This removes the checkmark
                  labelStyle: TextStyle(
                    color: c.isShareTab.value
                        ? Colors.white
                        : Colors.black87,
                  ),
                ),
                const SizedBox(width: 8),
                FilterChip(
                  label:  Text( MyStrings.accept.tr),
                  selected: !c.isShareTab.value,
                  onSelected: (val) => c.isShareTab.value = false,
                  selectedColor: Colors.grey,
                  backgroundColor: MyColor.colorWhite,
                  showCheckmark: false, // This removes the checkmark
                  labelStyle: TextStyle(
                    color: !c.isShareTab.value
                        ? Colors.white
                        : Colors.black87,
                  ),
                ),
              ],
            )),
            const SizedBox(height: 20),

            //Content
            Expanded(
              child: Obx(() {
                if (c.isFamilyShare.value) {
                  // FAMILY SHARE
                  if (c.isShareTab.value) {
                    // SHARE TAB → Homes
                    return _buildHomeList();
                  } else {
                    // ACCEPT TAB → Messages
                    return _buildAcceptList();
                  }
                } else {
                  // DEVICE SHARE
                  if (c.isShareTab.value) {
                    // SHARE TAB → Devices
                    return _buildDeviceList();
                  } else {
                    // ACCEPT TAB → Messages (same as family accept)
                    return _buildAcceptList();
                  }
                }
              }),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildHomeList() {
    return ListView(
      children: [
        ListTile(
          title:  Text( MyStrings.imperialtechshome.tr),
          subtitle:  Text( "6 ${MyStrings.devices.tr}"),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Colors.grey.shade300),
          ),
        ),
        SizedBox(height: 10,),
        ListTile(
          title:  Text( MyStrings.imperial.tr,),
          subtitle:  Text("0 ${ MyStrings.devices.tr}"),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Colors.grey.shade300),
          ),
        ),
      ],
    );
  }

  /// Devices
  Widget _buildDeviceList() {
    return ListView.separated(
      itemCount: 4,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        return ListTile(
          leading: const CircleAvatar(
            backgroundColor: Colors.red,
            child: Icon(Icons.devices, color: Colors.white, size: 20),
          ),
          title:  Text( MyStrings.walnutdoorbell.tr,),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Colors.grey.shade300),
          ),
        );
      },
    );
  }

  /// Accept list (used in both Family + Device Accept tab)
  Widget _buildAcceptList() {
    return ListView(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: ListTile(
            leading:  Icon(Icons.home, color: MyColor.secondaryColor, size: 30),
            title:  Text(
              MyStrings.joinfamilysuccess.tr,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle:  Text(
              MyStrings.imperialhomesecurityhasagreedtojoin.tr,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: ListTile(
            leading:  Icon(Icons.home, color: MyColor.secondaryColor, size: 30),
            title:  Text(
              MyStrings.joinfamilysuccess.tr,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle:  Text(
              MyStrings.youhaveacceptedimperialhomesecurity.tr,
            ),
          ),
        ),
      ],
    );
  }
}
