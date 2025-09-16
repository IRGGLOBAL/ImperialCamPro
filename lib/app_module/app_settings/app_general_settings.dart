import 'package:campro/app_module/camera_settings/camera_setting_controller.dart';
import 'package:campro/utils/custom_widget/my_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/Fonts/AppDimensions.dart';
import '../../utils/Paddings/AppPaddings.dart';
import '../../utils/Widgets/AppText.dart';
import '../../utils/custom_widget/strings.dart';
import 'app_log_general_settings.dart';
import 'change_languages.dart';
import 'clear_cache_general_settings.dart';
import 'delete_account_general_settings.dart';
import 'intercom_setting_select_device.dart';
import 'ip_address_settings.dart';



class AppGeneralSettings extends StatelessWidget {
  AppGeneralSettings({Key? key}) : super(key: key);

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
          text: MyStrings.generalsettings.tr,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, ),
              decoration: BoxDecoration(
                color: MyColor.colorWhite,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 2,
                    offset: const Offset(2, 2),
                  ),
                ],
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  // Get.to(() =>  WirelessChime());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: MyStrings.popupreminder.tr,
                      size: AppDimensions.FONT_SIZE_14,
                      fontWeight: FontWeight.w500,
                      color: MyColor.primaryColor,
                    ),
                    Obx(() => Transform.scale(
                      scale: 0.7,
                      child: Switch(
                        value: c.receiveAlarmNotifications.value,
                        onChanged: (val) {
                          c.toggleNotification(val);
                        },
                        activeColor: MyColor.secondaryColor,
                        inactiveTrackColor: Colors.grey.shade400,
                        activeTrackColor: MyColor.secondaryColor,
                        thumbColor: MaterialStateProperty.all(Colors.white),
                        trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                    )),                      ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            AppText(
              text: MyStrings.popupreminderdesc.tr,
              size: AppDimensions.FONT_SIZE_12,
              fontWeight: FontWeight.w500,
              color: MyColor.primaryColor,
            ),
            const SizedBox(height: 10),
            // Anti-flicker tile
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, ),
              decoration: BoxDecoration(
                color: MyColor.colorWhite,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 2,
                    offset: const Offset(2, 2),
                  ),
                ],
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: GestureDetector(
                onTap: () {
                  // Get.to(() =>  WirelessChime());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: MyStrings.receivepromotionalmessages.tr,
                      size: AppDimensions.FONT_SIZE_14,
                      fontWeight: FontWeight.w500,
                      color: MyColor.primaryColor,
                    ),
                    Obx(() => Transform.scale(
                      scale: 0.7,
                      child: Switch(
                        value: c.receiveAlarmNotifications.value,
                        onChanged: (val) {
                          c.toggleNotification(val);
                        },
                        activeColor: MyColor.secondaryColor,
                        inactiveTrackColor: Colors.grey.shade400,
                        activeTrackColor: MyColor.secondaryColor,
                        thumbColor: MaterialStateProperty.all(Colors.white),
                        trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                    )),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            AppText(
              text: MyStrings.emailtoreceivepromotionalactivity.tr,
              size: AppDimensions.FONT_SIZE_12,
              fontWeight: FontWeight.w500,
              color: MyColor.primaryColor,
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, ),
              decoration: BoxDecoration(
                color: MyColor.colorWhite,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 2,
                    offset: const Offset(2, 2),
                  ),
                ],
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: GestureDetector(
                onTap: () {
                  // Get.to(() =>  WirelessChime());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: MyStrings.turnonhardwaredecoding.tr,
                      size: AppDimensions.FONT_SIZE_14,
                      fontWeight: FontWeight.w500,
                      color: MyColor.primaryColor,
                    ),
                    Obx(() => Transform.scale(
                      scale: 0.7,
                      child: Switch(
                        value: c.receiveAlarmNotifications.value,
                        onChanged: (val) {
                          c.toggleNotification(val);
                        },
                        activeColor: MyColor.secondaryColor,
                        inactiveTrackColor: Colors.grey.shade400,
                        activeTrackColor: MyColor.secondaryColor,
                        thumbColor: MaterialStateProperty.all(Colors.white),
                        trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                    )),                      ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            AppText(
              text: MyStrings.afterenablingthisfunction.tr,
              size: AppDimensions.FONT_SIZE_12,
              fontWeight: FontWeight.w500,
              color: MyColor.primaryColor,
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, ),
              decoration: BoxDecoration(
                color: MyColor.colorWhite,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 2,
                    offset: const Offset(2, 2),
                  ),
                ],
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: GestureDetector(
                onTap: () {
                  // Get.to(() =>  WirelessChime());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: MyStrings.playvideoinasmallwindow.tr,
                      size: AppDimensions.FONT_SIZE_14,
                      fontWeight: FontWeight.w500,
                      color: MyColor.primaryColor,
                    ),
                    Obx(() => Transform.scale(
                      scale: 0.7,
                      child: Switch(
                        value: c.receiveAlarmNotifications.value,
                        onChanged: (val) {
                          c.toggleNotification(val);
                        },
                        activeColor: MyColor.secondaryColor,
                        inactiveTrackColor: Colors.grey.shade400,
                        activeTrackColor: MyColor.secondaryColor,
                        thumbColor: MaterialStateProperty.all(Colors.white),
                        trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                    )),                      ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            AppText(
              text: MyStrings.livebroadcastinasmallwindow.tr,
              size: AppDimensions.FONT_SIZE_12,
              fontWeight: FontWeight.w500,
              color: MyColor.primaryColor,
            ),
            const SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              decoration: BoxDecoration(
                color: MyColor.colorWhite,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 2,
                    offset: const Offset(2, 2),
                  ),
                ],
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        Get.to(() =>  ChangeLanguages());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                            text: MyStrings.language.tr,
                            size: AppDimensions.FONT_SIZE_14,
                            fontWeight: FontWeight.w500,
                            color: MyColor.primaryColor,
                          ),
                          Icon(Icons.chevron_right, color: MyColor.primaryColor),
                        ],
                      ),
                    ),
                  ),
                  Divider(thickness: 0.5,color: MyColor.borderColor,),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: GestureDetector(
                      onTap: () {
                         Get.to(() =>  IntercomSettingSelectDevice());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                            text: MyStrings.intercomsettings.tr,
                            size: AppDimensions.FONT_SIZE_14,
                            fontWeight: FontWeight.w500,
                            color: MyColor.primaryColor,
                          ),
                          Icon(Icons.chevron_right, color: MyColor.primaryColor),
                        ],
                      ),
                    ),
                  ),
                  Divider(thickness: 0.5,color: MyColor.borderColor,),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() =>  IpAddressSettings());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                            text: MyStrings.ipaddresssettings.tr,
                            size: AppDimensions.FONT_SIZE_14,
                            fontWeight: FontWeight.w500,
                            color: MyColor.primaryColor,
                          ),
                          Icon(Icons.chevron_right, color: MyColor.primaryColor),
                        ],
                      ),
                    ),
                  ),
                  Divider(thickness: 0.5,color: MyColor.borderColor,),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: GestureDetector(
                      onTap: () {
                        // Get.to(() =>  InstallationGuide());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                            text: MyStrings.appversion.tr,
                            size: AppDimensions.FONT_SIZE_14,
                            fontWeight: FontWeight.w500,
                            color: MyColor.primaryColor,
                          ),
                          Row(
                            children: [
                              AppText(
                                text: "15.10.1",
                                size: AppDimensions.FONT_SIZE_12,
                                fontWeight: FontWeight.w500,
                                color: MyColor.rideSub,
                              ),
                              Icon(Icons.chevron_right, color: MyColor.primaryColor),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(thickness: 0.5,color: MyColor.borderColor,),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: GestureDetector(
                      onTap: () {
                         Get.to(() =>  AppLogGeneralSettings());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                            text: MyStrings.applog.tr,
                            size: AppDimensions.FONT_SIZE_14,
                            fontWeight: FontWeight.w500,
                            color: MyColor.primaryColor,
                          ),
                          Icon(Icons.chevron_right, color: MyColor.primaryColor),
                        ],
                      ),
                    ),
                  ),
                  Divider(thickness: 0.5,color: MyColor.borderColor,),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: GestureDetector(
                      onTap: () {
                         Get.to(() =>  ClearCacheGeneralSettings());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                            text: MyStrings.clearcache.tr,
                            size: AppDimensions.FONT_SIZE_14,
                            fontWeight: FontWeight.w500,
                            color: MyColor.primaryColor,
                          ),
                          Row(
                            children: [
                              AppText(
                                text: "12.9MB",
                                size: AppDimensions.FONT_SIZE_12,
                                fontWeight: FontWeight.w500,
                                color: MyColor.rideSub,
                              ),
                              Icon(Icons.chevron_right, color: MyColor.primaryColor),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(thickness: 0.5,color: MyColor.borderColor,),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() =>  DeleteAccountGeneralSettings());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                            text: MyStrings.deleteaccount.tr,
                            size: AppDimensions.FONT_SIZE_14,
                            fontWeight: FontWeight.w500,
                            color: MyColor.primaryColor,
                          ),
                          Icon(Icons.chevron_right, color: MyColor.primaryColor),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }


}
