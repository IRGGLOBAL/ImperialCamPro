import 'dart:async';
import 'package:flutter/material.dart';

class MarqueeText extends StatefulWidget {
  final String text;
  final TextStyle style;
  final double scrollSpeed;
  final Duration updateInterval;
  final double spacing;

  const MarqueeText({
    Key? key,
    required this.text,
    required this.style,
    this.scrollSpeed = 30.0,
    this.updateInterval = const Duration(milliseconds: 490),
    this.spacing = 10.0,
  }) : super(key: key);

  @override
  _MarqueeTextState createState() => _MarqueeTextState();
}

class _MarqueeTextState extends State<MarqueeText> {
  final ScrollController _scrollController = ScrollController();
  Timer? _autoScrollTimer;
  bool _userHasInteracted = false;
  bool _scrollingForward = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _startAutoScroll());
  }

  void _startAutoScroll() {
    const duration = Duration(milliseconds: 80);
    _autoScrollTimer = Timer.periodic(duration, (timer) {

      if (_userHasInteracted || !_scrollController.hasClients) return;
      final maxScroll = _scrollController.position.maxScrollExtent;
      final minScroll = _scrollController.position.minScrollExtent;
      double offsetChange = (widget.scrollSpeed / 1000) * duration.inMilliseconds;
      double current = _scrollController.offset;
      double target = _scrollingForward ? current + offsetChange : current - offsetChange;

      if (target >= maxScroll) {
        _scrollingForward = false;
        target = maxScroll;
      } else if (target <= minScroll) {
        _scrollingForward = true;
        target = minScroll;
      }
      _scrollController.jumpTo(target);
    });
  }

  void _stopAutoScroll() {
    _autoScrollTimer?.cancel();
    _autoScrollTimer = null;
  }

  @override
  void dispose() {
    _stopAutoScroll();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is UserScrollNotification) {
          _userHasInteracted = true;
          _stopAutoScroll();
        }
        return false;
      },
      child: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        // physics: const NeverScrollableScrollPhysics(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        physics: const BouncingScrollPhysics(),
        child: Row(
          children: [
            Text(widget.text, style: widget.style),
            SizedBox(width: widget.spacing),
            // Text(widget.text, style: widget.style), // Duplicate for seamless loop
          ],
        ),
      ),
    );
  }
}