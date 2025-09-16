import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/custom_widget/my_color.dart';
import 'app_setting_controller /app_setting_controller.dart';


class SubscriptionPlanPage extends StatelessWidget {
  SubscriptionPlanPage({Key? key}) : super(key: key);

  final AppSettingController controller = Get.put(AppSettingController());

  String splitName(int index) {
    switch (index) {
      case 0:
        return  "Smart AI";
      case 1:
        return  "30 days recording";
      case 2:
        return  "7 days recording";
      case 3:
        return  "continuous recording";
      default:
        return  "";
    }
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Subscription Plan",
            style: TextStyle(color: Colors.black)),
        leading: const BackButton(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //  Category List
            SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.categories.length,
                itemBuilder: (context, index) {
                  return Obx(() {
                    final isSelected = controller.selectedCategoryIndex.value == index;

                    final mainName = controller.categories[index]["name"].toString();
                    final subName = splitName(index);

                    return GestureDetector(
                      onTap: () => controller.selectedCategoryIndex.value = index,
                      child: Container(
                        width: Get.width * 0.2,
                        height: Get.height *0.14,
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                        decoration: BoxDecoration(
                          color: isSelected ? MyColor.colorWhite : MyColor.colorWhite,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: isSelected ? MyColor.getGreyText() : MyColor.colorWhite,
                              // color: Colors.grey.shade200,
                              blurRadius: 2,
                              offset: const Offset(2, -2),
                            ),
                          ],
                          border: Border.all(
                            color: isSelected ? MyColor.colorWhite : MyColor.colorWhite,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              mainName,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: isSelected ? MyColor.primaryColor : MyColor.rideSub,
                              ),
                            ),
                            if (subName.isNotEmpty)
                              Text(
                                subName,
                                style: TextStyle(
                                  fontSize: 9,
                                  fontWeight: FontWeight.w400,
                                  color: isSelected ? MyColor.primaryColor : MyColor.rideSub,
                                ),
                                textAlign: TextAlign.center,
                              ),
                          ],
                        ),
                      ),
                    );
                  });
                },
              ),
            ),

            const SizedBox(height: 20),


            //  Plans List
            SizedBox(
              height: 110,
              child: Obx(() {
                final categoryIndex = controller.selectedCategoryIndex.value;
                final plans = controller.categories[categoryIndex]["plans"] as List;

                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: plans.length,
                  itemBuilder: (context, index) {


                    return GestureDetector(
                      onTap: () {
                        controller.selectedPlanIndex.value = index;
                      },
                      child: Obx(()=>Container(
                        width: Get.width*0.34,
                        margin: const EdgeInsets.only(right: 12),
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color:controller.selectedPlanIndex.value==index? Colors.red : Colors.grey.shade400,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          color:controller.selectedPlanIndex.value==index? Colors.red.withOpacity(0.1) : Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  plans[index]["title"].toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: controller.selectedPlanIndex.value==index? MyColor.secondaryColor : MyColor.primaryColor,
                                  ),
                                ),
                                // Round checkbox with small size
                                SizedBox(
                                  width: 12, // Small size
                                  height: 12, // Small size
                                  child: Checkbox(
                                    value: controller.selectedPlanIndex.value == index,
                                    onChanged: (bool? value) {
                                      if (value == true) {
                                        controller.selectedPlanIndex.value = index;
                                      }
                                    },
                                    activeColor: Colors.red,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10), // Fully round
                                    ),
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // Makes it smaller
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Text(
                              plans[index]["price"].toString(),
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: controller.selectedPlanIndex.value==index? Colors.red : Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      )),
                    );
                  },
                );
              }),
            ),

            const SizedBox(height: 20),

            //  Details Card
            Obx(() {
              final category = controller
                  .categories[controller.selectedCategoryIndex.value];
              final plans = category["plans"] as List;
              final selectedPlan =
              plans[controller.selectedPlanIndex.value];

              return Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 5,
                        offset: const Offset(2, 2))
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Enjoy Rights",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16)),
                    const SizedBox(height: 10),
                    ...List.generate(
                      (selectedPlan["details"] as List).length,
                          (i) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Row(
                          children: [
                            const Icon(Icons.check_circle,
                                color: Colors.red, size: 20),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                selectedPlan["details"][i],
                                style: const TextStyle(fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
            const Spacer(),

            //  Agreement + Button
            Row(
              children: [
                Obx(() => Checkbox(
                  value: controller.agreed.value,
                  onChanged: (val) => controller.agreed.value = val ?? false,
                  activeColor: Colors.red,
                )),
                const Expanded(
                  child: Text.rich(
                    TextSpan(
                      text: "I have read and agree to ",
                      style: TextStyle(fontSize: 12),
                      children: [
                        TextSpan(
                          text: "User Agreement",
                          style: TextStyle(
                              color: Colors.red,
                              decoration: TextDecoration.underline),
                        ),
                        TextSpan(text: " and "),
                        TextSpan(
                          text: "Automatic Deduction Agreement",
                          style: TextStyle(
                              color: Colors.red,
                              decoration: TextDecoration.underline),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),

            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () {},
                child: const Text("Next Step",
                    style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

}

