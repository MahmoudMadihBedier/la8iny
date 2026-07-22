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

  static const _english = RateUsStrings(
    title: 'Give us a rating',
    subtitle: 'Pocket was made for\npeople like you',
    downloads: '20K+ App Downloads',
    usedBy: 'Used by 20K+ people',
    cta: 'Rate Pocket',
    footer: 'It only takes 2 seconds of your time',
    reviews: [
      Review(
        'Omar Kamel',
        'بقالي كبير جداً على تحميل تطبيقات ادارة المصاريف والحمدلله ده اول '
            'تطبيق فعلا عملي وبسيط ',
      ),
      Review(
        'Marwan A.',
        "I've downloaded expense trackers before but always stopped after a "
            "few days. With Pocket I just say what I spent and move on. It's "
            "honestly the first money app I've kept using for more than a week.",
      ),
      Review(
        'Ghada al-badr',
        'كنت بتضايق من ادخال المصاريف يدوياً، بوكيت الأول اللي بيخليني أعرف '
            'أطلعاتي وأتحكم فيها بسهولة',
      ),
      Review(
        'Ali Hassan',
        'The app is honestly great and so easy to use. It\'s been super '
            'helpful especially the voiceover feature. It\'s amazing it really '
            'helped me get my wallet and expenses organized',
      ),
    ],
  );

  static const _arabic = RateUsStrings(
    title: 'قيّم تجربتك معنا',
    subtitle: 'صُمّم بوكيت من أجلك\nولاحتياجاتك',
    downloads: 'أكثر من 20 ألف تحميل',
    usedBy: 'أكثر من 20 ألف مستخدم يثقون في Pocket',
    cta: 'قيّم تجربتك',
    footer: 'يستغرق الأمر ثانيتين فقط من وقتك',
    reviews: [
      Review(
        'Omar Kamel',
        'بقالي كبير جداً على تحميل تطبيقات ادارة المصاريف والحمدلله ده اول '
            'تطبيق فعلا عملي وبسيط ',
      ),
      Review(
        'Marwan A.',
        "I've downloaded expense trackers before but always stopped after a "
            "few days. With Pocket I just say what I spent and move on. It's "
            "honestly the first money app I've kept using for more than a week.",
      ),
      Review(
        'Ghada al-badr',
        'كانت الاكسبيكشن من قبل التنزيل عالية جداً بس بعد استخدام التطبيق '
            'وجدت التوقعات والتصورات التي يمتلكها فيه',
      ),
      Review(
        'Ali Hassan',
        'The app is honestly great and so easy to use. It\'s been super '
            'helpful especially the voiceover feature. It\'s amazing it really '
            'helped me get my wallet and expenses organized',
      ),
    ],
  );
}
