import 'dart:ui';

class ListItem {
  final String svgAsset;
  final String text;
  final Color? color;

  ListItem({
    required this.svgAsset,
    required this.text,
    this.color,
  });
}