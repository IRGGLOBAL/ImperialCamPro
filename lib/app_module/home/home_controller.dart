import 'package:get/get.dart';
import 'package:flutter/material.dart';


class HomeController extends GetxController {

  TextEditingController searchController = TextEditingController();
  var searchHintText = "Search...".tr.obs;
  var isListening = false.obs;

  var selectedTab = 0.obs;

  void changeTab(int index) {
    selectedTab.value = index;
  }

}