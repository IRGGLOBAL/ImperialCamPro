import 'package:campro/utils/custom_widget/my_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../utils/Fonts/AppDimensions.dart';
import '../../utils/Images/my_images.dart';
import '../../utils/Widgets/AppText.dart';
import '../../utils/custom_widget/strings.dart';

class MyOrders extends StatelessWidget {
  const MyOrders ({Key? key}) : super(key: key);

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
                //Get.to(CloudStorageServiceDetail());
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

                    Expanded(
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: MyStrings.cloudstorageserviceeventaiplus.tr,
                            size: AppDimensions.FONT_SIZE_14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                text:
                                "${MyStrings.orderno.tr}",
                                size: AppDimensions.FONT_SIZE_11,
                                fontWeight: FontWeight.w400,
                                color: MyColor.primaryColor,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              AppText(
                                text:
                                "34234242342453453453_v2",
                                size: AppDimensions.FONT_SIZE_11,
                                fontWeight: FontWeight.w400,
                                color: MyColor.primaryColor,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                text:
                                "${MyStrings.noofdevices.tr}",
                                size: AppDimensions.FONT_SIZE_11,
                                fontWeight: FontWeight.w400,
                                color: MyColor.primaryColor,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              AppText(
                                text:
                                "10",
                                size: AppDimensions.FONT_SIZE_11,
                                fontWeight: FontWeight.w400,
                                color: MyColor.primaryColor,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                text:
                                "${MyStrings.packagetype.tr}",
                                size: AppDimensions.FONT_SIZE_11,
                                fontWeight: FontWeight.w400,
                                color: MyColor.primaryColor,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              AppText(
                                text:
                                "Monthly",
                                size: AppDimensions.FONT_SIZE_11,
                                fontWeight: FontWeight.w400,
                                color: MyColor.primaryColor,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                text:
                                "${MyStrings.paymenttimedate.tr}",
                                size: AppDimensions.FONT_SIZE_11,
                                fontWeight: FontWeight.w400,
                                color: MyColor.primaryColor,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              AppText(
                                text:
                                "2025/08/19 23:50:51",
                                size: AppDimensions.FONT_SIZE_11,
                                fontWeight: FontWeight.w400,
                                color: MyColor.primaryColor,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          Divider(thickness: 0.5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              AppText(
                                text:
                                "${MyStrings.paid.tr}",
                                size: AppDimensions.FONT_SIZE_11,
                                fontWeight: FontWeight.w400,
                                color: MyColor.primaryColor,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              AppText(
                                text:
                                " US\$16.77",
                                size: AppDimensions.FONT_SIZE_11,
                                fontWeight: FontWeight.w500,
                                color: MyColor.secondaryColor,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
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
