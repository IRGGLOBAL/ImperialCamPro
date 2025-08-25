import 'package:get/get.dart';
import 'package:flutter/material.dart';


class HomeController extends GetxController {

  TextEditingController searchController = TextEditingController();
  var searchHintText = "Search...".tr.obs;
  var isListening = false.obs;


}