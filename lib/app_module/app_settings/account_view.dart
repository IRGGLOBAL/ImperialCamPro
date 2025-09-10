import 'package:campro/utils/custom_widget/my_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/Fonts/AppDimensions.dart';
import '../../utils/Widgets/AppButton.dart';
import '../../utils/Widgets/AppText.dart';
import '../../utils/custom_widget/strings.dart';
import 'app_setting_controller /app_setting_controller.dart';

class AccountView extends StatelessWidget {
  AccountView ({Key? key}) : super(key: key);

  final AppSettingController controller = Get.put(AppSettingController());

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
          text: MyStrings.accountfaqs.tr,
          size: AppDimensions.FONT_SIZE_16,
          fontWeight: FontWeight.w600,
          color: MyColor.primaryColor,
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: MyColor.transparentColor,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: _buildAllQuestionsList(controller),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: AppButton(
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
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAllQuestionsList(AppSettingController controller) {
    // Combine all questions from all categories into a single list
    final allQuestions = <Map<String, String>>[];

    for (int i = 0; i < controller.accounttileItems.length; i++) {
      final categoryQuestions = controller.accounttileItems[i];
      // Add all questions for this category
      allQuestions.addAll(categoryQuestions);
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: BoxDecoration(
        color: MyColor.colorWhite,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: allQuestions.length,
        itemBuilder: (context, index) {
          final item = allQuestions[index];

          return Obx(() => _QuestionItem(
            key: ValueKey('question-$index'),
            question: item['question']!,
            answer: item['answer']!,
            isExpanded: controller.isQuestionExpanded(index),
            onTap: () => controller.toggleQuestion(index),
            showDivider: index < allQuestions.length - 1,
          ));
        },
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