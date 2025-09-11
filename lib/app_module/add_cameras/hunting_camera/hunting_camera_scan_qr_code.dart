import 'package:campro/app_module/qr_scanner/qr_scanner_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../../../utils/Fonts/AppDimensions.dart';
import '../../../utils/Images/my_images.dart';
import '../../../utils/Paddings/AppPaddings.dart';
import '../../../utils/Widgets/AppText.dart';
import '../../../utils/Widgets/marquee_scroll.dart';
import '../../../utils/custom_widget/my_color.dart';
import '../../../utils/custom_widget/strings.dart';

class HuntingCameraScanQrCode extends StatelessWidget {
  const HuntingCameraScanQrCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final QrScannerController c = Get.put(QrScannerController());

    final double frameWidth = MediaQuery.of(context).size.width * 0.72;
    final double frameHeight = frameWidth; // square scan area

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: AppText(text: ''), // keep empty if you want like the screenshot
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        actions: [
          // small circular gallery icon (top-right)
          GestureDetector(
            onTap: () => c.pickFromGallery(),
            child: SvgPicture.asset(
              MyImages.opengallery,
              width: 25,
              height: 25,
              color: MyColor.primaryColor,
            ),
          ),

          // popup menu as requested
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: Colors.black87),
            onSelected: (value) {
              debugPrint('${MyStrings.appbarmenuselected.tr} $value');
            },
            color: MyColor.colorWhite, // Background color of the entire menu
            itemBuilder: (_) => [
              PopupMenuItem(
                value: MyStrings.hotspot,
                child: Text(
                  MyStrings.hotspot,
                ),
              ),
              PopupMenuItem(
                value: MyStrings.sonic,
                child: Text(
                  MyStrings.sonic,
                ),
              ),
              PopupMenuItem(
                value: MyStrings.manual,
                child: Text(
                  MyStrings.manual,
                ),
              ),
            ],
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding :AppPaddings.defaultPadding,
          child: Column(
            children: [
              /// Scanner area
              SizedBox(
                height: frameHeight + 40,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Camera view
                    Positioned.fill(
                      child: ClipRect(
                        child: MobileScanner(
                          onDetect: (BarcodeCapture capture) {
                            final barcodes = capture.barcodes;
                            if (barcodes.isNotEmpty) {
                              final barcode = barcodes.first;
                              if (barcode.rawValue != null) {
                                debugPrint('${MyStrings.qrode.tr} ${barcode.rawValue}');
                                Get.snackbar(
                                  MyStrings.qrcodedetected.tr,
                                  barcode.rawValue!,
                                  snackPosition: SnackPosition.TOP,
                                  duration: Duration(seconds: 1),
                                );
                              }
                            }
                          },
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        width: frameWidth,
                        height: frameHeight,
                        child: CustomPaint(
                          painter: _CornerPainter(color: Colors.redAccent, strokeWidth: 6),
                        ),
                      ),
                    ),

                  ],
                ),
              ),

              const SizedBox(height: 20),

              Center(
                child: Container(
                  width: frameWidth * 0.86,
                  height: frameHeight * 0.1,
                  decoration: BoxDecoration(
                    color: MyColor.transparentColor,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      // brightness help action
                      debugPrint('${MyStrings.brightnesshelptapped.tr}');
                    },
                    child: AppText(text: MyStrings.itisonlyapplicabletohunting.tr,
                      size: AppDimensions.FONT_SIZE_10,
                      fontWeight: FontWeight.w500,
                      color: MyColor.primaryColor,
                      textAlign: TextAlign.center,),
                  ),

                ),
              ),

              /// Gridview
              SizedBox(
                height: 110,
                child:  GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 1.5,
                  children: [
                    _buildTile(MyImages.flashlighticon,  onTap: () => debugPrint('Wireless Camera')),
                    _buildTile(MyImages.galleryicon,  onTap: () => debugPrint('Wired Camera')),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTile(String asset,  {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: SvgPicture.asset(
                  asset,
                  width: 55,
                  height: 55,
                  //color: Colors.white,
                ),
              ),
            ),

          ],
        ),

    );
  }


}

// painter that draws corner L shapes for scanner frame
class _CornerPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  _CornerPainter({required this.color, this.strokeWidth = 6});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final double len = size.width * 0.12; // corner length relative to frame size
    // top-left
    canvas.drawLine(Offset(0, len), Offset(0, 0), paint);
    canvas.drawLine(Offset(0, 0), Offset(len, 0), paint);

    // top-right
    canvas.drawLine(Offset(size.width - len, 0), Offset(size.width, 0), paint);
    canvas.drawLine(Offset(size.width, 0), Offset(size.width, len), paint);

    // bottom-left
    canvas.drawLine(Offset(0, size.height - len), Offset(0, size.height), paint);
    canvas.drawLine(Offset(0, size.height), Offset(len, size.height), paint);

    // bottom-right
    canvas.drawLine(Offset(size.width - len, size.height), Offset(size.width, size.height), paint);
    canvas.drawLine(Offset(size.width, size.height - len), Offset(size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant _CornerPainter oldDelegate) => false;
}




