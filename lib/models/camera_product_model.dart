// Product model to hold product information
import '../Utils/app_imports/app_imports.dart';

class Product {
  final String name;
  final Widget screen;
  final Map<String, dynamic>? arguments;

  Product({required this.name,    required this.screen, this.arguments});
}