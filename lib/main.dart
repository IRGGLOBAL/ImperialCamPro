import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'app/my_app.dart';
import 'data/common/theme_controller.dart';


final storageBox = GetStorage();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  await GetStorage.init();
  await initializeDateFormatting();
  //await PushNotificationService.initialize();
  Get.lazyPut(() => ThemeController());
  runApp(const MyApp());
}