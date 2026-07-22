import 'package:flutter/material.dart';

import '../theme/rate_us_colors.dart';

/// Displays a row of five stars for a [rating] between 0 and 5.
class StarRow extends StatelessWidget {
  final double rating;
  final double size;

  const StarRow({super.key, required this.rating, required this.size});

  @override
  Widget build(BuildContext context) {
    final clamped = rating.clamp(0.0, 5.0);
    final fullStars = clamped.floor();
    final hasHalf = (clamped - fullStars) >= 0.5;
    final emptyStars = 5 - fullStars - (hasHalf ? 1 : 0);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 0; i < fullStars; i++)
          Icon(Icons.star_rounded, size: size, color: rateUsStar),
        if (hasHalf)
          Icon(Icons.star_half_rounded, size: size, color: rateUsStar),
        for (var i = 0; i < emptyStars; i++)
          Icon(Icons.star_border_rounded, size: size, color: rateUsStar),
      ],
    );
  }
}
