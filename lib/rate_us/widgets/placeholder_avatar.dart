import 'package:flutter/material.dart';

/// Circular avatar placeholder.
///
/// Swap the [CircleAvatar.child] or use [backgroundImage] when real assets are available.
class PlaceholderAvatar extends StatelessWidget {
  final double radius;
  final String? colorSeed;

  const PlaceholderAvatar({super.key, required this.radius, this.colorSeed});

  static const _colors = [
    Color(0xFFB9D8FF),
    Color(0xFFFFD3B0),
    Color(0xFFC9F0D6),
    Color(0xFFFFC9E0),
  ];

  @override
  Widget build(BuildContext context) {
    final color = colorSeed == null
        ? Colors.grey.shade300
        : _colors[colorSeed.hashCode.abs() % _colors.length];

    return CircleAvatar(
      radius: radius,
      backgroundColor: color,
      child: Icon(Icons.person, size: radius, color: Colors.white),
    );
  }
}
