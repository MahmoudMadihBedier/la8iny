import 'package:flutter/material.dart';

import '../models/rate_us_strings.dart';
import '../theme/rate_us_colors.dart';
import '../widgets/dotted_background.dart';
import '../widgets/placeholder_avatar.dart';
import '../widgets/rating_badge_box.dart';
import '../widgets/review_card.dart';

class RateUsScreen extends StatelessWidget {
  const RateUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final isArabic = locale.languageCode == 'ar';
    final strings = RateUsStrings.of(isArabic);

    return Directionality(
      textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            const Positioned.fill(
              child: CustomPaint(painter: DottedBackgroundPainter()),
            ),
            SafeArea(
              child: Column(
                children: [
                  _buildCloseButton(context),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      children: [
                        const SizedBox(height: 8),
                        _buildTitle(strings.title),
                        const SizedBox(height: 36),
                        RatingBadgeBox(
                          rating: '4.3',
                          downloadsLabel: strings.downloads,
                        ),
                        const SizedBox(height: 44),
                        _buildSubtitle(strings.subtitle),
                        const SizedBox(height: 18),
                        _buildAvatars(isArabic),
                        const SizedBox(height: 10),
                        _buildCaption(strings.usedBy),
                        const SizedBox(height: 28),
                        for (final review in strings.reviews)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: ReviewCard(review: review),
                          ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                  _buildCta(context, strings),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCloseButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
      child: Align(
        alignment: AlignmentDirectional.centerEnd,
        child: IconButton(
          icon: const Icon(Icons.close, color: Colors.black54),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Text(
        title,
        textAlign: TextAlign.start,
        style: const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w800,
          color: rateUsNavy,
          height: 1.1,
        ),
      ),
    );
  }

  Widget _buildSubtitle(String subtitle) {
    return Text(
      subtitle,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: rateUsNavy,
        height: 1.25,
      ),
    );
  }

  Widget _buildAvatars(bool isArabic) {
    const seeds = ['a', 'b', 'c'];
    final overlap = isArabic ? 10.0 : -10.0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < seeds.length; i++)
          Transform.translate(
            offset: Offset(i * overlap, 0),
            child: PlaceholderAvatar(
              radius: 22,
              colorSeed: seeds[i],
            ),
          ),
      ],
    );
  }

  Widget _buildCaption(String usedBy) {
    return Text(
      usedBy,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.black54,
      ),
    );
  }

  Widget _buildCta(BuildContext context, RateUsStrings strings) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: rateUsBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                elevation: 0,
              ),
              onPressed: () {
                // TODO: hook up to app store / play store review flow
              },
              child: Text(
                strings.cta,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            strings.footer,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black38,
            ),
          ),
        ],
      ),
    );
  }
}
