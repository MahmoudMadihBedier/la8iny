import 'package:flutter/material.dart';

extension RateUsDimens on BuildContext {
  double get _width => MediaQuery.of(this).size.width;

  double _scale(double width) {
    if (width < 360) return 0.85;
    if (width < 400) return 0.9;
    return 1.0;
  }

  double get rateUsScale => _scale(_width);

  double get rateUsTitleSize => 32 * rateUsScale;
  double get rateUsSubtitleSize => 22 * rateUsScale;
  double get rateUsRatingSize => 34 * rateUsScale;
  double get rateUsCtaSize => 16 * rateUsScale;
  double get rateUsBodySize => 14 * rateUsScale;
  double get rateUsCaptionSize => 13 * rateUsScale;
  double get rateUsSmallSize => 12 * rateUsScale;

  double get rateUsStarSize => 24 * rateUsScale;
  double get rateUsReviewStarSize => 13 * rateUsScale;
  double get rateUsWreathSize => 50 * rateUsScale;
  double get rateUsAvatarRadius => 22 * rateUsScale;
  double get rateUsReviewAvatarRadius => 18 * rateUsScale;

  double get rateUsContentPadding {
    if (_width < 360) return 20;
    if (_width < 400) return 22;
    return 24;
  }

  static const double maxContentWidth = 600;
}
