import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../utils/custom_widget/my_color.dart';


class HomeController extends GetxController {

  TextEditingController searchController = TextEditingController();
  var searchHintText = "Search...".tr.obs;
  var isListening = false.obs;

  var selectedTab = 0.obs;

  void changeTab(int index) {
    selectedTab.value = index;
  }


  ///calendar

  var selectedDate = DateTime.now().obs;

  void pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: MyColor.secondaryColor, // header background color & active day
              onPrimary: Colors.white,         // header text color
              onSurface: MyColor.primaryColor, // body text color
            ),
            dialogBackgroundColor: Colors.white, // background of dialog
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: MyColor.secondaryColor, // button text color (CANCEL, OK)
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
    }
  }

  String get formattedDate {
    return "${selectedDate.value.day}-${selectedDate.value.month}-${selectedDate.value.year}";
  }

}