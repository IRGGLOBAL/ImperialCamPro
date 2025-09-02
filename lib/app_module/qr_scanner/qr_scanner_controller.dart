// lib/features/qr/qr_scanner_controller.dart
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class QrScannerController extends GetxController {
  MobileScannerController? scannerController;

  final qrCode = ''.obs;
  final showFirstText = true.obs;
  final lastDirection = 1.obs;
  final ImagePicker _picker = ImagePicker();
  final isLoading = true.obs;
  final hasError = false.obs;
  final errorMessage = ''.obs;


  // Add these variables to prevent multiple detections
  String lastDetectedCode = '';
  DateTime lastDetectionTime = DateTime.now();
  final Duration cooldownDuration = Duration(seconds: 3); // 3 seconds cooldown

  void onDetect(BarcodeCapture capture) {
    final List<Barcode> barcodes = capture.barcodes;

    if (barcodes.isNotEmpty) {
      for (final barcode in barcodes) {
        if (barcode.rawValue != null && barcode.rawValue!.isNotEmpty) {
          final String currentCode = barcode.rawValue!;
          final DateTime now = DateTime.now();

          // Prevent multiple detections of the same code within cooldown period
          if (currentCode != lastDetectedCode ||
              now.difference(lastDetectionTime) > cooldownDuration) {

            qrCode.value = currentCode;
            lastDetectedCode = currentCode;
            lastDetectionTime = now;

            debugPrint('QR Code detected: ${qrCode.value}');

            // Handle the QR code result (show only once)
            _handleQrCodeResult(qrCode.value);
            break;
          }
        }
      }
    }
  }

  void _handleQrCodeResult(String code) {
    // Use a unique key for the snackbar to prevent multiple showing
    if (Get.isSnackbarOpen) {
      Get.back(); // Close any existing snackbar
    }

    Get.snackbar(
      'QR Code Scanned',
      'Content: $code',
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: 1),
      snackStyle: SnackStyle.FLOATING,
      margin: EdgeInsets.all(16),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      // Add a unique key to prevent multiple snackbars
      snackbarStatus: (status) {
        if (status == SnackbarStatus.CLOSED) {
          lastDetectedCode = '';
        }
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    _initializeCamera();
    Future.delayed(Duration(seconds: 3), () {
      toggleText();
    });
  }

  void _initializeCamera() {
    try {
      scannerController = MobileScannerController(
        detectionSpeed: DetectionSpeed.normal,
        facing: CameraFacing.back,
        formats: [BarcodeFormat.qrCode],
        returnImage: false,
      );

      // Add a small delay to simulate camera initialization
      Future.delayed(Duration(seconds: 2), () {
        isLoading.value = false;
      });
    } catch (e) {
      isLoading.value = false;
      hasError.value = true;
      errorMessage.value = 'Failed to initialize camera: $e';
      debugPrint('Camera initialization error: $e');
    }
  }

  Future<void> pickFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        debugPrint("Image selected: ${image.path}");
        Get.snackbar(
          'Gallery Image',
          'QR detection from gallery not implemented yet',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      debugPrint('Gallery pick error: $e');
      Get.snackbar(
        'Error',
        'Failed to pick image from gallery',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  final currentText = 'Scan QR Code'.obs;
  final slideDirection = 1.obs; // 1 for right, -1 for left
  List<String> textVariations = [
    'Scan QR Code',
    'Align QR Code',
    'Position QR Code',
    'Focus QR Code'
  ];
  int currentIndex = 0;

  void toggleText() {
    // Update slide direction
    slideDirection.value = 1; // Always slide in from right

    // Move to next text variation
    currentIndex = (currentIndex + 1) % textVariations.length;
    currentText.value = textVariations[currentIndex];

    // Optional: Add a small delay before cycling again
    Future.delayed(Duration(seconds: 2), () {
      if (currentIndex < textVariations.length - 1) {
        toggleText(); // Auto-cycle to next text
      }
    });
  }

  void openOption(String option, BuildContext context) {
    debugPrint('Selected option: $option');
    Get.back();
  }

  void toggleFlash() {
    scannerController?.toggleTorch();
  }

  void switchCamera() {
    scannerController?.switchCamera();
  }

  void restartCamera() {
    isLoading.value = true;
    hasError.value = false;
    scannerController?.dispose();

    Future.delayed(Duration(milliseconds: 500), () {
      _initializeCamera();
    });
  }

  @override
  void onClose() {
    scannerController?.dispose();
    super.onClose();
  }
}