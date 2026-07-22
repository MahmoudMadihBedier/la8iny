import 'package:flutter/material.dart';

class Wreath extends StatelessWidget {
  final bool flip;
  final double size;

  const Wreath({super.key, required this.flip, required this.size});

  @override
  Widget build(BuildContext context) {
    final image = Image.asset(
      'assets/images/left-21.png',
      width: size,
      height: size,
    );
    return flip ? Transform.flip(flipX: true, child: image) : image;
  }
}
