import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MotionDetectionController extends GetxController {
  var startTime = TimeOfDay(hour: 0, minute: 0).obs;
  var endTime = TimeOfDay(hour: 0, minute: 0).obs;
  var selectedDays = <int>[].obs; // 0=Sun, 1=Mon...

  // Select start time
  Future<void> pickStartTime(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: startTime.value,
    );
    if (picked != null) {
      startTime.value = picked;
    }
  }

  // Select end time
  Future<void> pickEndTime(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: endTime.value,
    );
    if (picked != null) {
      endTime.value = picked;
    }
  }

  // Toggle weekday
  void toggleDay(int index) {
    if (selectedDays.contains(index)) {
      selectedDays.remove(index);
    } else {
      selectedDays.add(index);
    }
  }

  // Helper: format time with Next day
  String formatTime(TimeOfDay time, {bool isEnd = false}) {
    final startMinutes = startTime.value.hour * 60 + startTime.value.minute;
    final endMinutes = time.hour * 60 + time.minute;

    String formatted = time.format(Get.context!);
    if (isEnd && endMinutes <= startMinutes) {
      return "Next day $formatted";
    }
    return formatted;
  }
}