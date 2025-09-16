import 'package:campro/utils/custom_widget/my_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../utils/Fonts/AppDimensions.dart';
import '../../utils/Images/my_images.dart';
import '../../utils/Widgets/AppText.dart';
import '../../utils/custom_widget/strings.dart';
import '../app_settings/my_orders_view.dart';
import 'cloud_storage_service_detail.dart';

class CloudStorageSetting extends StatelessWidget {
  const CloudStorageSetting({Key? key}) : super(key: key);

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
          text: "${MyStrings.cloudstorageservices.tr}",
          size: AppDimensions.FONT_SIZE_16,
          fontWeight: FontWeight.w600,
          color: MyColor.primaryColor,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: AppText(
              text: "${MyStrings.order.tr}",
              size: AppDimensions.FONT_SIZE_14,
              fontWeight: FontWeight.w500,
              color: MyColor.secondaryColor,
              onTap: (){
                Get.to(MyOrders());
              },
            ),
          ),
        ],
        backgroundColor: Colors.white,
        surfaceTintColor: MyColor.transparentColor,

        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Cloud Storage Card
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: (){
                Get.to(CloudStorageServiceDetail());
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: MyColor.colorWhite,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 3,
                      spreadRadius: 0,
                      offset: const Offset(2, 2),
                    ),
                  ],
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      MyImages.cloudstorageservice,
                      width: 40,
                      height: 40,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: MyStrings.cloudstorage.tr,
                            size: AppDimensions.FONT_SIZE_14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                          const SizedBox(height: 4),
                          AppText(
                            text:
                            "2/12/2025",
                            size: AppDimensions.FONT_SIZE_11,
                            fontWeight: FontWeight.w400,
                            color: MyColor.hinttext,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 6),
                          AppText(
                            text: "${MyStrings.canbind.tr} 3 ${MyStrings.devices.tr}",
                            size: AppDimensions.FONT_SIZE_11,
                            fontWeight: FontWeight.w500,
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.chevron_right, color: Colors.black),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),


          ],
        ),
      ),
    );
  }

}
