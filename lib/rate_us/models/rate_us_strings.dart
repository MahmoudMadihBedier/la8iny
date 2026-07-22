import 'package:flutter/material.dart';

import 'review.dart';

/// Localized copy for the rate-us screen.
class RateUsStrings {
  final String title;
  final String subtitle;
  final String downloads;
  final String usedBy;
  final String cta;
  final String footer;
  final List<Review> reviews;

  const RateUsStrings({
    required this.title,
    required this.subtitle,
    required this.downloads,
    required this.usedBy,
    required this.cta,
    required this.footer,
    required this.reviews,
  });

  factory RateUsStrings.of(bool isArabic) => isArabic ? _arabic : _english;

  static const _reviews = [
    Review(
      'Omar Kamel',
      'تحففففففففة 🔥🔥🔥🔥 بقالي كثير كنت بدور علي حاجة كدا واستخدمت apps كتيرة بس اول مرة حاجة تبقي بالسهولة والبساطة دي',
      avatarAsset: 'assets/images/person4.png',
    ),
    Review(
      'Marwan A.',
      "I've downloaded expense trackers before but always stopped after a "
          "few days. With Pocket I just say what I spent and move on. It's "
          "honestly the first money app I've kept using for more than a week.",
      avatarAsset: 'assets/images/person1.png',
    ),
    Review(
      'Ghada al-badr',
      'انا نزلت الابليكيشن من اول ما تم الاعلان عنه 👏 وكم التطورات والتعديلات اللي بيحصل فيه حقيقي',
      avatarBackgroundColor: Color(0xFFFFC9E0),
    ),
    Review(
      'Ali Hassan',
      'The app is honestly great and so easy to use. It\'s been super '
          'helpful especially the voiceover feature. It\'s amazing It really '
          'helped me get my wallet and expenses organized',
      avatarAsset: 'assets/images/person3.png',
    ),
  ];

  static const _english = RateUsStrings(
    title: 'Give us a rating',
    subtitle: 'Pocket was made for\npeople like you',
    downloads: '20K+ App Downloads',
    usedBy: 'Used by 20K+ people',
    cta: 'Rate Pocket',
    footer: 'It only takes 5 seconds of your time',
    reviews: _reviews,
  );

  static const _arabic = RateUsStrings(
    title: 'قيم تجربتك مع Pocket',
    subtitle: 'صُمّم خصيصا من أجلك\nولاحتياجاتك',
    downloads: 'أكثر من 20 ألف تحميل',
    usedBy: 'أكثر من 20 ألف مستخدم وثقوا في Pocket',
    cta: 'قيّم تجربتك',
    footer: 'لن يستغرق سوى ٥ ثواني من وقتك',
    reviews: _reviews,
  );
}
