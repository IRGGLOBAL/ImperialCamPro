import 'package:campro/app_module/camera_settings/camera_setting_controller.dart';
import 'package:campro/utils/custom_widget/my_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/Fonts/AppDimensions.dart';
import '../../utils/Paddings/AppPaddings.dart';
import '../../utils/Widgets/AppButton.dart';
import '../../utils/Widgets/AppText.dart';
import '../../utils/custom_widget/strings.dart';
import '../manually_enter_camera/manual_entry.dart';


class SelectDevicesView extends StatelessWidget {
  SelectDevicesView({Key? key}) : super(key: key);

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
          text: MyStrings.memberinfo.tr,
          size: AppDimensions.FONT_SIZE_16,
          fontWeight: FontWeight.w600,
          color: MyColor.primaryColor,
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: MyColor.transparentColor,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: AppPaddings.defaultPadding,
        child: Container(
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              AppText(
                text: MyStrings.nodevice.tr,
                size: AppDimensions.FONT_SIZE_14,
                fontWeight: FontWeight.w500,
                color: MyColor.primaryColor,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity, // Makes button take full width
                child: AppButton(
                  buttonName: MyStrings.adddevice.tr,
                  buttonColor: MyColor.secondaryColor,
                  textColor: Colors.white,
                  textSize: 16,
                  fontWeight: FontWeight.w500,
                  hasShadow: false,
                  onTap: () {
                    Get.to(ManualEntry());
                  },
                  elevation: 0,
                  borderWidth: 0,
                  isCenter: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
