import 'package:campro/app_module/camera_settings/camera_setting_controller.dart';
import 'package:campro/utils/Images/my_images.dart';
import 'package:campro/utils/custom_widget/my_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../utils/Fonts/AppDimensions.dart';
import '../../utils/Paddings/AppPaddings.dart';
import '../../utils/Widgets/AppText.dart';
import '../../utils/custom_widget/strings.dart';

class ElectricityUsageStatistics extends StatelessWidget {
  ElectricityUsageStatistics({Key? key}) : super(key: key);

  final CameraSettingController c = Get.put(CameraSettingController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Get.back(),
          ),
          title: AppText(
            text: MyStrings.electricityUsageStatistics.tr,
            size: AppDimensions.FONT_SIZE_16,
            fontWeight: FontWeight.w600,
            color: MyColor.primaryColor,
          ),
          backgroundColor: Colors.white,
          surfaceTintColor: MyColor.transparentColor,
          iconTheme: const IconThemeData(color: Colors.black),
          bottom: TabBar(
            labelColor: MyColor.secondaryColor,
            unselectedLabelColor: MyColor.hintTextColor,
            indicatorColor: MyColor.secondaryColor,
            indicatorWeight: 3,
            tabs: [
              Tab(text: MyStrings.today.tr),
              Tab(text: "In the Past Week"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // ---------- Today ----------
            SingleChildScrollView(
              padding: AppPaddings.defaultPadding,
              child: _buildStatisticsCards(),
            ),

            // ---------- In the Past Week ----------
            SingleChildScrollView(
              padding: AppPaddings.defaultPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: "Electric Quantity",
                    size: AppDimensions.FONT_SIZE_14,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 200,
                    child: SfCartesianChart(
                      legend: Legend(isVisible: true),
                      trackballBehavior: TrackballBehavior(
                        enable: true,
                        tooltipSettings: const InteractiveTooltip(
                          enable: true,
                        ),
                      ),
                      primaryXAxis: CategoryAxis(),
                      primaryYAxis: NumericAxis(),
                      series: <LineSeries<_ChartData, String>>[
                        LineSeries<_ChartData, String>(
                          name: 'Ireland',
                          dataSource: [
                            _ChartData('0', 10),
                            _ChartData('4', 20),
                            _ChartData('8', 15),
                            _ChartData('12', 30),
                            _ChartData('16', 25),
                            _ChartData('20', 40),
                          ],
                          xValueMapper: (d, _) => d.x,
                          yValueMapper: (d, _) => d.y,
                        ),
                        LineSeries<_ChartData, String>(
                          name: 'Europe',
                          dataSource: [
                            _ChartData('0', 5),
                            _ChartData('4', 12),
                            _ChartData('8', 18),
                            _ChartData('12', 22),
                            _ChartData('16', 30),
                            _ChartData('20', 35),
                          ],
                          xValueMapper: (d, _) => d.x,
                          yValueMapper: (d, _) => d.y,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  AppText(
                    text: "WiFi Signal Strength",
                    size: AppDimensions.FONT_SIZE_14,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 200,
                    child: SfCartesianChart(
                      trackballBehavior: TrackballBehavior(enable: true),
                      primaryXAxis: CategoryAxis(),
                      primaryYAxis: NumericAxis(),
                      series: <LineSeries<_ChartData, String>>[
                        LineSeries<_ChartData, String>(
                          dataSource: [
                            _ChartData('0:00', 70),
                            _ChartData('2:00', 75),
                            _ChartData('4:00', 80),
                            _ChartData('6:00', 60),
                            _ChartData('8:00', 65),
                            _ChartData('10:00', 55),
                          ],
                          xValueMapper: (d, _) => d.x,
                          yValueMapper: (d, _) => d.y,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  _buildStatisticsCards(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Statistics cards grid
  Widget _buildStatisticsCards() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 1.6,
      children: [
        _statCard("Wake up of Time", "0s", MyImages.wakeupoftime),
        _statCard("Preview Time", "0s",  MyImages.previewtime),
        _statCard("Number of alarms", "0",  MyImages.noofalarms),
        _statCard("Number of detected", "0",  MyImages.noofdetected),
      ],
    );
  }

  Widget _statCard(String title, String value, String svgAsset) {
    return Container(
      padding: const EdgeInsets.all(12),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: title,
            size: AppDimensions.FONT_SIZE_12,
            fontWeight: FontWeight.w500,
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                text: value,
                size: AppDimensions.FONT_SIZE_14,
                fontWeight: FontWeight.w600,
              ),
              SvgPicture.asset(
                svgAsset,
                width: 30,
                height: 30,
                color: MyColor.lineColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ChartData {
  final String x;
  final double y;
  _ChartData(this.x, this.y);
}
