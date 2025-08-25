import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AuthController extends GetxController {

  TextEditingController emailController = TextEditingController();
  final passwordController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  RegExp regex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

}
