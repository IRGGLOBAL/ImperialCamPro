import 'package:flutter/material.dart';

class FloatingNavbarItem {
  final String? title;
  final IconData? icon;
  final Widget? customWidget;
  final Color? selectedColor;
  final Color? unselectedColor;

  FloatingNavbarItem({
    this.icon,
    this.title,
    this.customWidget,
    this.selectedColor,
    this.unselectedColor,
  }) : assert(icon != null || customWidget != null);

  Widget buildWidget(bool isSelected, BuildContext context) {
    final color = isSelected
        ? (selectedColor ?? Theme.of(context).primaryColor)
        : (unselectedColor ?? Colors.grey);

    if (customWidget != null) {
      return customWidget!;
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color, size: 22),
        if (title != null) ...[
          const SizedBox(height: 4),
          Flexible(
            child: Text(
              title!,
              style: TextStyle(
                color: color,
                fontSize: 12,
                overflow: TextOverflow.visible,
              ),
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ],
    );
  }
}