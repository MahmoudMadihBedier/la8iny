import 'package:flutter/material.dart';

class Wreath extends StatelessWidget {
  final bool flip;

  const Wreath({super.key, required this.flip});

  @override
  Widget build(BuildContext context) {
    final image = Image.asset('assets/images/left-21.png');
    return flip ? Transform.flip(flipX: true, child: image) : image;
  }
}
