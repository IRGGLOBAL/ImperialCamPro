import 'package:campro/utils/custom_widget/my_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../utils/Fonts/AppDimensions.dart';
import '../../utils/Images/my_images.dart';
import '../../utils/Widgets/AppText.dart';
import '../../utils/custom_widget/strings.dart';

class CloudStorageServiceDetail extends StatefulWidget {
  const CloudStorageServiceDetail({Key? key}) : super(key: key);

  @override
  State<CloudStorageServiceDetail> createState() => _CloudStorageServiceDetailState();
}

class _CloudStorageServiceDetailState extends State<CloudStorageServiceDetail> {

// Example data list
  List<Map<String, dynamic>> errorCardsData = [
    {
      'title': "Walnut Doorbell",
      'titletwo': "Invalid Socket",
      'titlethree': "AI Plus",
      'subtitle': "Services included in the package",
      'time': "3 P.M.",
      'hint': "Effective time 2025.08.19.10",
      'hinttwo': "Effective time 2024.08.19.10",
      'alert': "*Your device socket is invalid, please bind the device again.",
      'svgIcon': MyImages.walnutdoorbell,
      'svgimg': MyImages.imperialcloudstorage,
      'svgimgtwo': MyImages.aiplus,
      'isChecked': true,
    },
    {
      'title': "Walnut Doorbell",
      'titletwo': "Invalid Socket",
      'titlethree': "AI Plus",
      'subtitle': "Services included in the package",
      'time': "3 P.M.",
      'hint': "Effective time 2025.08.19.10",
      'hinttwo': "Effective time 2024.08.19.10",
      'alert': "*Your device socket is invalid, please bind the device again.",
      'svgIcon': MyImages.walnutdoorbell,
      'svgimg': MyImages.imperialcloudstorage,
      'svgimgtwo': MyImages.aiplus,
      'isChecked': true,
    },
    // Add more items as needed
    {
      'title': "Another Device",
      'titletwo': "Different Error",
      'titlethree': "AI Standard",
      'subtitle': "Other services",
      'time': "4 P.M.",
      'hint': "Effective time 2025.09.19.10",
      'hinttwo': "Effective time 2024.09.19.10",
      'alert': "*Another error message here.",
      'svgIcon': MyImages.walnutdoorbell,
      'svgimg': MyImages.imperialcloudstorage,
      'svgimgtwo': MyImages.aiplus,
      'isChecked': false,
    },
  ];

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
          text: MyStrings.cloudstorageservices.tr,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _buildHeaderCard(),
            ),
            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: errorCardsData.length,
                itemBuilder: (context, index) {
                  final data = errorCardsData[index];
                  return _buildErrorCard(
                    title: data['title'],
                    titletwo: data['titletwo'],
                    titlethree: data['titlethree'],
                    subtitle: data['subtitle'],
                    time: data['time'],
                    hint: data['hint'],
                    hinttwo: data['hinttwo'],
                    alert: data['alert'],
                    svgIcon: data['svgIcon'],
                    svgimg: data['svgimg'],
                    svgimgtwo: data['svgimgtwo'],
                    svgWidth: 45,
                    svgHeight: 45,
                    svgimgWidth: 25,
                    svgimgHeight: 25,
                    svgimgtwoWidth: 24,
                    svgimgtwoHeight: 24,
                    titleFontSize: 14,
                    titleFontWeight: FontWeight.w500,
                    titleColor: MyColor.primaryColor,
                    hintColor: MyColor.hinttext,
                    hinttwoColor: MyColor.hinttext,
                    alertColor: MyColor.secondaryColor,
                    alertFontSize: 10,
                    alertFontWeight: FontWeight.w400,
                    subtitleFontSize: 12,
                    subtitleFontWeight: FontWeight.w400,
                    subtitleColor: MyColor.hinttext,
                    isChecked: data['isChecked'],
                    onChanged: (val) {
                      setState(() {
                        errorCardsData[index]['isChecked'] = val ?? false;
                      });
                    },
                  );
                },
              ),


            ),

          ],
        ),

    );
  }

  // A widget for the top device card
  Widget _buildHeaderCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      // decoration: BoxDecoration(
      //   color: MyColor.colorWhite,
      //   borderRadius: BorderRadius.circular(12),
      //   boxShadow: [
      //     BoxShadow(
      //       color: Colors.grey.shade200,
      //       blurRadius: 3,
      //       offset: const Offset(2, 2),
      //     ),
      //   ],
      //   border: Border.all(color: Colors.grey.shade200),
      // ),
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
                  text: "2/12/2025",
                  size: AppDimensions.FONT_SIZE_11,
                  fontWeight: FontWeight.w400,
                  color: MyColor.hinttext,
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }

  // A widget for each error card
  Widget _buildErrorCard({
    required String title,
    required String titletwo,
    required String titlethree,
    required String subtitle,
    required String time,
    required String hint,
    required String hinttwo,
    required String alert,
    required String svgIcon,
    required String svgimg,
    required String svgimgtwo,
    bool isChecked = false,
    Function(bool?)? onChanged,
    // SVG parameters
    double svgWidth = 24,
    double svgHeight = 24,
    double svgimgWidth = 24,
    double svgimgHeight = 24,
    double svgimgtwoWidth = 24,
    double svgimgtwoHeight = 24,
    Color? svgColor,
    // Title text parameters
    double titleFontSize = AppDimensions.FONT_SIZE_14,
    doubletitlethreeFontSize = AppDimensions.FONT_SIZE_14,
    double titletitletwoFontSize = AppDimensions.FONT_SIZE_14,
    FontWeight titleFontWeight = FontWeight.w600,
    FontWeight titlethreeFontWeight = FontWeight.w600,
    FontWeight titletitletwoFontWeight = FontWeight.w600,
    Color titleColor = Colors.black,
    Color titlethreeColor = Colors.black,
    Color titletitletwoColor = Colors.black,
    // Subtitle text parameters
    double subtitleFontSize = AppDimensions.FONT_SIZE_12,
    FontWeight subtitleFontWeight = FontWeight.w400,
    Color subtitleColor = Colors.black,
    // alert text parameters
    double alertFontSize = AppDimensions.FONT_SIZE_12,
    FontWeight alertFontWeight = FontWeight.w500,
    Color alertColor = MyColor.hinttext,
    // Hint text parameters
    double hintFontSize = AppDimensions.FONT_SIZE_11,
    doublehinttwoFontSize = AppDimensions.FONT_SIZE_11,
    FontWeight hintFontWeight = FontWeight.w400,
    FontWeight hinttwoFontWeight = FontWeight.w400,
    Color hintColor = Colors.red,
    Color hinttwoColor = Colors.red,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: MyColor.colorWhite,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 3,
            offset: const Offset(2, 2),
          ),
        ],
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Row 1: Icon + Title + Checkbox
          Row(
            children: [
              SvgPicture.asset(
                svgIcon,
                width: svgWidth,
                height: svgHeight,
                color: svgColor,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: AppText(
                  text: title,
                  size: titleFontSize,
                  fontWeight: titleFontWeight,
                  color: titleColor,
                ),
              ),
              Checkbox(
                value: isChecked,
                onChanged: onChanged,
                shape: const CircleBorder(), // makes it round
                side: const BorderSide( // border when inactive
                  color: Colors.grey,
                  width: 1.5,
                ),
                activeColor: Colors.red, // fill color when active
                checkColor: Colors.white, // tick color
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // tighter hit area
              )
            ],
          ),
          const SizedBox(height: 6),
          Divider(
            color: Colors.grey.shade300,
            thickness: 1,
            height: 1,
          ),
          const SizedBox(height: 6),

          /// Row 2: Subtitle
          AppText(
            text: subtitle,
            size: subtitleFontSize,
            fontWeight: subtitleFontWeight,
            color: subtitleColor,
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                svgimg,
                width: svgimgWidth,
                height: svgimgHeight,
                color: svgColor,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: titletwo,
                      size: titleFontSize,
                      fontWeight: titleFontWeight,
                      color: titleColor,
                    ),

                    AppText(
                      text: hint,
                      size: hintFontSize,
                      fontWeight: hintFontWeight,
                      color: hintColor,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Divider(
            color: Colors.grey.shade300,
            thickness: 1,
            height: 1,
          ),
          const SizedBox(height: 12),

          /// Row 3: Time
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                svgimgtwo,
                width: svgimgtwoWidth,
                height: svgimgtwoHeight,
                color: svgColor,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                 AppText(
                        text: titlethree,
                        size: titleFontSize,
                        fontWeight: titleFontWeight,
                        color: titleColor,
                      ),

                    AppText(
                      text: hinttwo,
                      size: hintFontSize,
                      fontWeight: hintFontWeight,
                      color: hintColor,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    AppText(
                      text: alert,
                      size: alertFontSize,
                      fontWeight: alertFontWeight,
                      color: alertColor,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),


        ],
      ),
    );
  }


}




