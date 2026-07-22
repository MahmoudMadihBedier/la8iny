import 'package:flutter/material.dart';

import '../utils/rate_us_dimens.dart';

/// Circular avatar that can show an [imageAsset] or a colored placeholder.
class PlaceholderAvatar extends StatelessWidget {
  final double? radius;
  final String? imageAsset;
  final String? colorSeed;
  final Color? backgroundColor;

  const PlaceholderAvatar({
    super.key,
    this.radius,
    this.imageAsset,
    this.colorSeed,
    this.backgroundColor,
  });

  static const _colors = [
    Color(0xFFB9D8FF),
    Color(0xFFFFD3B0),
    Color(0xFFC9F0D6),
    Color(0xFFFFC9E0),
  ];

  @override
  Widget build(BuildContext context) {
    final r = radius ?? context.rateUsReviewAvatarRadius;
    final color = backgroundColor ??
        (colorSeed == null
            ? Colors.grey.shade300
            : _colors[colorSeed.hashCode.abs() % _colors.length]);

    if (imageAsset != null) {
      return CircleAvatar(
        radius: r,
        backgroundImage: AssetImage(imageAsset!),
        backgroundColor: color,
      );
    }

    return CircleAvatar(
      radius: r,
      backgroundColor: color,
      child: Icon(Icons.person, size: r, color: Colors.white),
    );
  }
}
