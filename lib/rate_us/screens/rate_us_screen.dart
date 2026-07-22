import 'package:flutter/material.dart';

import '../models/rate_us_strings.dart';
import '../theme/rate_us_colors.dart';
import '../utils/rate_us_dimens.dart';
import '../widgets/dotted_background.dart';
import '../widgets/placeholder_avatar.dart';
import '../widgets/rating_badge_box.dart';
import '../widgets/review_card.dart';

class RateUsScreen extends StatelessWidget {
  const RateUsScreen({super.key});

  static const _heroAvatarAssets = [
    'assets/images/person1.png',
    'assets/images/person2.png',
    'assets/images/person3.png',
  ];

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
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: RateUsDimens.maxContentWidth,
                  ),
                  child: Column(
                    children: [
                      _buildCloseButton(context),
                      Expanded(
                        child: ListView(
                          padding: EdgeInsets.symmetric(
                            horizontal: context.rateUsContentPadding,
                          ),
                          children: [
                            const SizedBox(height: 8),
                            _buildTitle(context, strings.title, isArabic),
                            const SizedBox(height: 36),
                            RatingBadgeBox(
                              rating: '4.3',
                              downloadsLabel: strings.downloads,
                            ),
                            const SizedBox(height: 44),
                            _buildSubtitle(context, strings.subtitle),
                            const SizedBox(height: 18),
                            _buildAvatars(context, isArabic),
                            const SizedBox(height: 10),
                            _buildCaption(context, strings.usedBy),
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

  Widget _buildTitle(BuildContext context, String title, bool isArabic) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: isArabic ? Alignment.centerRight : Alignment.centerLeft,
        child: Text(
          title,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: context.rateUsTitleSize,
            fontWeight: FontWeight.w800,
            color: rateUsNavy,
            height: 1.1,
          ),
        ),
      ),
    );
  }

  Widget _buildSubtitle(BuildContext context, String subtitle) {
    return Text(
      subtitle,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: context.rateUsSubtitleSize,
        fontWeight: FontWeight.w700,
        color: rateUsNavy,
        height: 1.25,
      ),
    );
  }

  Widget _buildAvatars(BuildContext context, bool isArabic) {
    final assets = isArabic
        ? _heroAvatarAssets.reversed.toList()
        : _heroAvatarAssets;
    final overlap = isArabic ? 10.0 : -10.0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < assets.length; i++)
          Transform.translate(
            offset: Offset(i * overlap, 0),
            child: PlaceholderAvatar(
              radius: context.rateUsAvatarRadius,
              imageAsset: assets[i],
            ),
          ),
      ],
    );
  }

  Widget _buildCaption(BuildContext context, String usedBy) {
    return Text(
      usedBy,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: context.rateUsBodySize,
        fontWeight: FontWeight.w600,
        color: Colors.black54,
      ),
    );
  }

  Widget _buildCta(BuildContext context, RateUsStrings strings) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        context.rateUsContentPadding,
        8,
        context.rateUsContentPadding,
        16,
      ),
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
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  strings.cta,
                  style: TextStyle(
                    fontSize: context.rateUsCtaSize,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            strings.footer,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: context.rateUsSmallSize,
              color: Colors.black38,
            ),
          ),
        ],
      ),
    );
  }
}
