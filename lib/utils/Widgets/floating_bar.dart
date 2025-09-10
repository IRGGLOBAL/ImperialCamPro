import 'package:flutter/material.dart';

import 'floating_bar_items.dart';

typedef ItemBuilder = Widget Function(
    BuildContext context, int index, FloatingNavbarItem items);

class FloatingNavbar extends StatefulWidget {
  final List<FloatingNavbarItem> items;
  final int currentIndex;
  final void Function(int val)? onTap;
  final Color selectedBackgroundColor;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final Color backgroundColor;
  final double fontSize;
  final double iconSize;
  final double itemBorderRadius;
  final double itemSpace;
  final double borderRadius;
  final ItemBuilder itemBuilder;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final double width;
  final double elevation;
  final bool inLine;

  FloatingNavbar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
    ItemBuilder? itemBuilder,
    this.backgroundColor = Colors.black,
    this.selectedBackgroundColor = Colors.white,
    this.selectedItemColor = Colors.black,
    this.iconSize = 20.0,
    this.fontSize = 11.0,
    this.borderRadius = 8,
    this.itemBorderRadius = 8,
    this.itemSpace = 2,
    this.unselectedItemColor = Colors.white,
    this.margin = const EdgeInsets.fromLTRB(8, 8, 8, 8),
    this.padding = const EdgeInsets.symmetric(vertical: 8),
    this.width = double.infinity,
    this.inLine = false,
    this.elevation = 0.0,
  })  : assert(items.length > 1),
        assert(items.length <= 5),
        assert(currentIndex <= items.length),
        assert(width > 50),
        itemBuilder = itemBuilder ??
            _defaultItemBuilder(
              unselectedItemColor: unselectedItemColor,
              selectedItemColor: selectedItemColor,
              borderRadius: borderRadius,
              fontSize: fontSize,
              width: width,
              backgroundColor: backgroundColor,
              currentIndex: currentIndex,
              iconSize: iconSize,
              itemSpace: itemSpace,
              itemBorderRadius: itemBorderRadius,
              items: items,
              onTap: onTap,
              inLine: inLine,
              selectedBackgroundColor: selectedBackgroundColor,
            );

  @override
  _FloatingNavbarState createState() => _FloatingNavbarState();
}

class _FloatingNavbarState extends State<FloatingNavbar> {
  List<FloatingNavbarItem> get items => widget.items;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      margin: widget.margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        color: widget.backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0.3,
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Calculate available width per item
          final availableWidth = constraints.maxWidth - (widget.margin.horizontal);
          final itemWidth = availableWidth / items.length;

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: items.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;

              return SizedBox(
                width: itemWidth,
                child: widget.itemBuilder(context, index, item),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

ItemBuilder _defaultItemBuilder({
  Function(int val)? onTap,
  required List<FloatingNavbarItem> items,
  int? currentIndex,
  Color? selectedBackgroundColor,
  Color? selectedItemColor,
  Color? unselectedItemColor,
  Color? backgroundColor,
  double width = double.infinity,
  double? fontSize,
  double? iconSize,
  double? itemSpace,
  double? itemBorderRadius,
  double? borderRadius,
  bool? inLine = false,
}) {
  return (BuildContext context, int index, FloatingNavbarItem item) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => onTap?.call(index),
        borderRadius: BorderRadius.circular(itemBorderRadius!),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 2),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              item.customWidget ?? Icon(
                item.icon,
                color: currentIndex == index
                    ? selectedItemColor
                    : unselectedItemColor,
                size: iconSize,
              ),
              if (item.title != null) SizedBox(height: itemSpace),
              if (item.title != null)
                Flexible(
                  child: Text(
                    item.title!,
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                    softWrap: false,
                    style: TextStyle(
                      color: currentIndex == index
                          ? selectedItemColor
                          : unselectedItemColor,
                      fontSize: fontSize,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  };
}
