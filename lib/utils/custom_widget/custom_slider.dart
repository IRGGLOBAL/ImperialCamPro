import 'package:flutter/material.dart';

class CustomRedSlider extends StatefulWidget {
  const CustomRedSlider({Key? key}) : super(key: key);

  @override
  State<CustomRedSlider> createState() => _CustomRedSliderState();
}

class _CustomRedSliderState extends State<CustomRedSlider> {
  double sliderValue = 5; // default value

  @override
  Widget build(BuildContext context) {
    final sliderWidth = MediaQuery.of(context).size.width * 1;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Slider
            SizedBox(
              width: sliderWidth,
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Colors.red,
                  inactiveTrackColor: Colors.grey,
                  trackHeight: 4, // thinner line
                  thumbShape: const RedBorderThumbShape(thumbRadius: 12),
                ),
                child: Slider(
                  value: sliderValue,
                  min: 1,
                  max: 5,
                  divisions: 5, // 5 steps
                  onChanged: (val) {
                    setState(() => sliderValue = val);
                  },
                ),
              ),
            ),

            const SizedBox(height: 8),

            // Numbers row (aligned with slider)
            SizedBox(
              width: sliderWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  5,
                      (index) => Text(
                    "${index + 1}",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black, // ✅ force black color
                      fontWeight: FontWeight.w500, // optional (makes it bolder)
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom Thumb with red border
class RedBorderThumbShape extends SliderComponentShape {
  final double thumbRadius;

  const RedBorderThumbShape({this.thumbRadius = 12});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
      PaintingContext context,
      Offset center, {
        required Animation<double> activationAnimation,
        required Animation<double> enableAnimation,
        required bool isDiscrete,
        required TextPainter labelPainter,
        required RenderBox parentBox,
        required SliderThemeData sliderTheme,
        required TextDirection textDirection,
        required double value,
        required double textScaleFactor,
        required Size sizeWithOverflow,
      }) {
    final Canvas canvas = context.canvas;

    // Red border
    final Paint borderPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, thumbRadius, borderPaint);

    // White inside
    final Paint innerPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, thumbRadius - 4, innerPaint);
  }
}
