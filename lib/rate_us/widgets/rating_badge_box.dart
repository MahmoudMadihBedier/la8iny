import 'package:flutter/material.dart';

import '../theme/rate_us_colors.dart';
import '../utils/rate_us_dimens.dart';
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
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Wreath(flip: false, size: context.rateUsWreathSize),
                    const SizedBox(width: 14),
                    Text(
                      rating,
                      style: TextStyle(
                        fontSize: context.rateUsRatingSize,
                        fontWeight: FontWeight.w800,
                        color: rateUsNavy,
                      ),
                    ),
                    const SizedBox(width: 12),
                    StarRow(rating: 5, size: context.rateUsStarSize),
                    const SizedBox(width: 14),
                    Wreath(flip: true, size: context.rateUsWreathSize),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                downloadsLabel,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: context.rateUsBodySize,
                  fontWeight: FontWeight.w500,
                  color: Colors.black45,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
