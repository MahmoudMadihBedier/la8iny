import 'package:flutter/material.dart';

import '../theme/rate_us_colors.dart';

class DottedBackgroundPainter extends CustomPainter {
  const DottedBackgroundPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = rateUsLightBorder;
    const spacing = 18.0;
    const dotRadius = 1.1;
    for (double y = 4; y < size.height; y += spacing) {
      for (double x = 4; x < size.width; x += spacing) {
        canvas.drawCircle(Offset(x, y), dotRadius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
