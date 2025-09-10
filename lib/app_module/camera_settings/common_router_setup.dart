import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/Fonts/AppDimensions.dart';
import '../../utils/Widgets/AppText.dart';
import '../../utils/custom_widget/my_color.dart';
import '../../utils/custom_widget/strings.dart'; // for .tr

class CommonRouterSetupScreen extends StatelessWidget {
  const CommonRouterSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.colorWhite,
     appBar: AppBar(
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        onPressed: () => Get.back(),
      ),
      title: AppText(
        text: "${MyStrings.routerSetupTitle.tr}",
        size: AppDimensions.FONT_SIZE_16,
        fontWeight: FontWeight.w600,
        color: MyColor.primaryColor,
      ),
      backgroundColor: Colors.white,
      surfaceTintColor: MyColor.transparentColor,
      iconTheme: const IconThemeData(color: Colors.black),
    ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                MyStrings.routerSetupDesc.tr,
                style: const TextStyle(fontSize: 14, height: 1.5, color: Colors.black87),
              ),
              const SizedBox(height: 16),
              buildStep(MyStrings.step1.tr),
              buildStep(MyStrings.step2.tr),
              buildStep(MyStrings.step3.tr),
              buildStep(MyStrings.step4.tr),
              const SizedBox(height: 16),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: MyStrings.remarkTitle.tr,
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: MyStrings.remarkDesc.tr,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildStep(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        text,
        style: const TextStyle(fontSize: 14, height: 1.5, color: Colors.black87),
      ),
    );
  }
}
