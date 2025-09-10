import 'package:campro/utils/custom_widget/my_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/Fonts/AppDimensions.dart';
import '../../utils/Widgets/AppButton.dart';
import '../../utils/Widgets/AppText.dart';
import '../../utils/custom_widget/strings.dart';
import 'app_setting_controller /app_setting_controller.dart';

class BabyMonitorView extends StatelessWidget {
  const BabyMonitorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final AppSettingController controller = Get.put(AppSettingController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Obx(() => Icon(
              controller.selectedTileIndex.value != -1
                  ? Icons. arrow_back_ios
                  : Icons.arrow_back_ios,
              color: Colors.black
          )),
          onPressed: () {
            if (controller.selectedTileIndex.value != -1) {
              controller.goBack();
            } else {
              Get.back();
            }
          },
        ),
        title: Obx(() => AppText(
          text: controller.selectedTileIndex.value != -1
              ? "${MyStrings.babymonitorfaqs.tr}"
              : "${MyStrings.babymonitor.tr}",
          size: AppDimensions.FONT_SIZE_16,
          fontWeight: FontWeight.w600,
          color: MyColor.primaryColor,
        )),
        backgroundColor: Colors.white,
        surfaceTintColor: MyColor.transparentColor,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Obx(() => AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: controller.selectedTileIndex.value == -1
                  ? _buildMainTiles(controller)
                  : _buildDetailList(controller),
            )),

            const SizedBox(height: 20),
            // const Spacer(),

            Column(
              children: [
                AppButton(
                  buttonName: MyStrings.sendusfeedback.tr,
                  buttonColor: MyColor.secondaryColor,
                  textColor: MyColor.colorWhite,
                  textSize: 16,
                  fontWeight: FontWeight.w500,
                  hasShadow: false,
                  buttonWidth: double.infinity,
                  onTap: () {
                    //Get.to(AddDeviceShare());
                  },
                  elevation: 0,
                  borderWidth: 0,
                  iconSize: 20,
                  paddingButton: 8,
                  isSuffix: false,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMainTiles(AppSettingController controller) {
    return Container(
      height: Get.height*0.27,
      key: const ValueKey('main-tiles'),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: BoxDecoration(
        color: MyColor.colorWhite,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          _settingsTile(controller, 0, "${MyStrings.networkconnections.tr}"),
          _settingsTile(controller, 1, "${MyStrings.mobiledetection.tr}"),
          _settingsTile(controller, 2, "${MyStrings.imageissues.tr}"),
          _settingsTile(controller, 3, "${MyStrings.replaytheatre.tr}"),
          _settingsTile(controller, 4, "${MyStrings.hardwareissues.tr}"),
        ],
      ),
    );
  }

  Widget _settingsTile(
      AppSettingController controller,
      int index,
      String title,
      ) {
    return GestureDetector(
      onTap: () => controller.selectTile(index),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Row(
          children: [

            // Title text
            Expanded(
              child: AppText(
                text: title,
                size: AppDimensions.FONT_SIZE_12,
                fontWeight: FontWeight.w500,
                color: MyColor.primaryColor,
              ),
            ),

            // Chevron icon
            Icon(
              Icons.chevron_right,
              color: MyColor.primaryColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailList(AppSettingController controller) {
    final items = controller.babymonitortileItems[controller.selectedTileIndex.value];

    return Container(
      key: ValueKey('detail-${controller.selectedTileIndex.value}'),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: BoxDecoration(
        color: MyColor.colorWhite,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [

          ListView.builder(
            shrinkWrap: true, // Important for dynamic height
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Obx(() => _QuestionItem(
                key: ValueKey('question-$index'),
                question: item['question']!,
                answer: item['answer']!,
                isExpanded: controller.isQuestionExpanded(index),
                onTap: () => controller.toggleQuestion(index),
                showDivider: index < items.length - 1,
              ));
            },
          ),
        ],
      ),
    );
  }

}

class _QuestionItem extends StatelessWidget {
  final String question;
  final String answer;
  final bool isExpanded;
  final VoidCallback onTap;
  final bool showDivider;

  const _QuestionItem({
    Key? key,
    required this.question,
    required this.answer,
    required this.isExpanded,
    required this.onTap,
    required this.showDivider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Question row
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    question,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: MyColor.primaryColor,
                    ),
                  ),
                ),
                // Animated chevron icon
                AnimatedRotation(
                  duration: const Duration(milliseconds: 300),
                  turns: isExpanded ? 0.25 : 0,
                  child: Icon(
                    Icons.chevron_right,
                    size: 20,
                    color: MyColor.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),

        // Answer section (appears when expanded)
        if (isExpanded)
          Container(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Text(
              answer,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade700,
                height: 1.4,
              ),
            ),
          ),

        if (showDivider)
          const Divider(height: 1, indent: 16),
      ],
    );
  }
}