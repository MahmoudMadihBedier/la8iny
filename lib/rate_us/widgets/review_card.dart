import 'package:flutter/material.dart';

import '../models/review.dart';
import '../theme/rate_us_colors.dart';
import '../utils/rate_us_dimens.dart';
import 'placeholder_avatar.dart';
import 'star_row.dart';

class ReviewCard extends StatelessWidget {
  final Review review;

  const ReviewCard({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: rateUsLightBorder),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PlaceholderAvatar(
            imageAsset: review.avatarAsset,
            backgroundColor: review.avatarBackgroundColor,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        review.name,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: context.rateUsBodySize,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    StarRow(rating: 5, size: context.rateUsReviewStarSize),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  review.text,
                  style: TextStyle(
                    fontSize: context.rateUsCaptionSize,
                    color: Colors.black54,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
