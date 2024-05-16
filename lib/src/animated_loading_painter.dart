import 'dart:math' as math;

import 'package:flutter/material.dart';

class AnimatedLoadingPainter extends CustomPainter {
  final Animation<double> _animation;
  final Color _arcColor;
  final double? strokeWidth;

  AnimatedLoadingPainter(
    this._animation,
    this._arcColor,
    this.strokeWidth,
  ) : super(repaint: _animation);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint greyPaint = Paint()
      ..color = Colors.grey.shade300
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth ?? size.width * 0.1;

    final Paint arcPaint = Paint()
      ..color = _arcColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth ?? size.width * 0.1;

    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radius = size.width / 2 - arcPaint.strokeWidth / 2;
    // Draw the static grey circle
    canvas.drawCircle(center, radius, greyPaint);

    final double rotationAngle = _animation.value * 2 * math.pi;
    final double sweepAngle = math.pi / 10 +
        (_animation.value < 0.5
            ? _animation.value *
                2 *
                math.pi /
                1.2 // Increase the arc in the first half
            : (1 - _animation.value) *
                2 *
                math.pi /
                1.2); // Decrease the arc in the second half

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2 +
          rotationAngle, // Start angle, adjusted to start at 12 o'clock
      sweepAngle, // Sweep angle, changing as the animation progresses
      false,
      arcPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
