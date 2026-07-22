import 'package:flutter/material.dart';

/// Review data used in the rate-us screen.
class Review {
  final String name;
  final String text;
  final String? avatarAsset;
  final Color? avatarBackgroundColor;

  const Review(
    this.name,
    this.text, {
    this.avatarAsset,
    this.avatarBackgroundColor,
  });
}
