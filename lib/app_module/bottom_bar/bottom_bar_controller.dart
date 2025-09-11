// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../home/home_view.dart';
//
// class BuyModeBottomNavigationBuyController extends GetxController {
//   var selectedIndex = 0.obs;
//
//   // DON'T create MyHomePage here as it causes circular dependency
//   final List<Widget> widgets = [
//     // Use simple placeholders or lazy load the actual screens
//     MyHomePage(),
//     Center(child: Container(child: Text("Devices Screen"))),
//     Center(child: Container(child: Text("Alerts Screen"))),
//     Center(child: Container(child: Text("Settings Screen"))),
//   ];
//
//   void changeScreen(int index) {
//     selectedIndex.value = index;
//   }
// }

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../app_settings/app_settings.dart';
import '../home/home_view.dart';

class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;

  List<Widget> get pages => [
    MyHomePage(),
    // ForgotPassword(),
    // SignUpScreen(),
    AppSettings(),
  ];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  Widget get currentPage => pages[selectedIndex.value];
}