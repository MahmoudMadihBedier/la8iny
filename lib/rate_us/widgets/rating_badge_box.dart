import 'package:flutter/material.dart';

import '../theme/rate_us_colors.dart';
import 'badge_pin.dart';
import 'star_row.dart';
import 'wreath.dart';

class RatingBadgeBox extends StatelessWidget {
  final String rating;
  final String downloadsLabel;

  const RatingBadgeBox({
    super.key,
    required this.rating,
    required this.downloadsLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 22),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: rateUsBorder),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0F000000),
                blurRadius: 12,
                offset: Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Wreath(flip: false),
                  const SizedBox(width: 14),
                  Text(
                    rating,
                    style: const TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w800,
                      color: rateUsNavy,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const StarRow(rating: 5, size: 24),
                  const SizedBox(width: 14),
                  const Wreath(flip: true),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                downloadsLabel,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black45,
                ),
              ),
            ],
          ),
        ),
        const Positioned(top: -14, child: BadgePin()),
      ],
    );
  }
}
