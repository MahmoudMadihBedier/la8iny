import 'package:flutter/material.dart';

import '../theme/rate_us_colors.dart';

class BadgePin extends StatelessWidget {
  const BadgePin({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 58,
      height: 68,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
            width: 58,
            height: 68,
            child: ClipPath(
              clipper: const PinClipper(),
              child: Container(color: rateUsNavy),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 3),
            child: SizedBox(
              width: 52,
              height: 62,
              child: ClipPath(
                clipper: const PinClipper(),
                child: Container(color: rateUsYellow),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: ClipOval(
              child: Container(
                width: 34,
                height: 34,
                color: Colors.grey.shade300,
                child: Icon(Icons.person, size: 20, color: Colors.grey.shade50),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PinClipper extends CustomClipper<Path> {
  const PinClipper();

  @override
  Path getClip(Size size) {
    final w = size.width;
    final h = size.height;
    const r = 16.0;
    final pointH = h * 0.16;
    final bodyH = h - pointH;

    return Path()
      ..moveTo(0, r)
      ..quadraticBezierTo(0, 0, r, 0)
      ..lineTo(w - r, 0)
      ..quadraticBezierTo(w, 0, w, r)
      ..lineTo(w, bodyH - r)
      ..quadraticBezierTo(w, bodyH, w - r, bodyH)
      ..lineTo(w / 2 + pointH, bodyH)
      ..lineTo(w / 2, h)
      ..lineTo(w / 2 - pointH, bodyH)
      ..lineTo(r, bodyH)
      ..quadraticBezierTo(0, bodyH, 0, bodyH - r)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
