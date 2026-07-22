import 'package:flutter/material.dart';


class RateUsScreen extends StatelessWidget {
  const RateUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final isArabic = locale.languageCode == 'ar';
    final strings = _RateUsStrings.of(isArabic);

    return Directionality(
      textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            // Subtle dotted background, like the mock
            Positioned.fill(
              child: CustomPaint(painter: _DottedBackgroundPainter()),
            ),
            SafeArea(
              child: Column(
                children: [
                  // ---------- Close button ----------
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.close, color: Colors.black54),
                          onPressed: () => Navigator.of(context).maybePop(),
                        ),
                      ],
                    ),
                  ),

                  // ---------- Scrollable content ----------
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      children: [
                        const SizedBox(height: 8),

                        // Title (left aligned, large & bold, matches new mock)
                        Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            strings.title,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF14213D),
                              height: 1.1,
                            ),
                          ),
                        ),
                        const SizedBox(height: 36),

                        // ---- Rating box: wreaths + stars + badge pin ----
                        _RatingBadgeBox(
                          rating: '4.3',
                          downloadsLabel: strings.downloads,
                        ),

                        const SizedBox(height: 44),

                        // Subtitle
                        Text(
                          strings.subtitle,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF14213D),
                            height: 1.25,
                          ),
                        ),
                        const SizedBox(height: 18),

                        // Avatars row (overlapping circles, centered)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _PlaceholderAvatar(radius: 22, colorSeed: 'a'),
                            Transform.translate(
                              offset: const Offset(-10, 0),
                              child:
                                  _PlaceholderAvatar(radius: 22, colorSeed: 'b'),
                            ),
                            Transform.translate(
                              offset: const Offset(-20, 0),
                              child:
                                  _PlaceholderAvatar(radius: 22, colorSeed: 'c'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),

                        // Caption below avatars, centered
                        Text(
                          strings.usedBy,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                          ),
                        ),

                        const SizedBox(height: 28),

                    // ---- Reviews (this inner list scrolls too since it's
                    // part of the outer ListView; each card is fixed height
                    // so everything scrolls together and all reviews are
                    // reachable) ----
                    ...strings.reviews.map(
                      (r) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: _ReviewCard(review: r),
                      ),
                    ),

                    const SizedBox(height: 8),
                  ],
                ),
              ),

              // ---------- Bottom CTA (fixed, not scrolling) ----------
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1E88F0),
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
              ),
            ],
          ),
        ),
      ],
    ),
      ),
    );
  }
}

/// =====================================================================
/// Review card widget
/// =====================================================================
class _ReviewCard extends StatelessWidget {
  final _Review review;
  const _ReviewCard({required this.review});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFEDEDED)),
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
          _PlaceholderAvatar(radius: 18, colorSeed: review.name),
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
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    const _StarRow(rating: 5, size: 13),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  review.text,
                  style: const TextStyle(
                    fontSize: 13,
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

/// =====================================================================
/// Small reusable pieces
/// =====================================================================
class _StarRow extends StatelessWidget {
  final double rating;
  final double size;
  const _StarRow({required this.rating, required this.size});

  @override
  Widget build(BuildContext context) {
    final fullStars = rating.floor();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (i) {
        return Icon(
          i < fullStars ? Icons.star_rounded : Icons.star_border_rounded,
          size: size,
          color: const Color(0xFFFFB800),
        );
      }),
    );
  }
}

/// Placeholder circular avatar — replace the `child` with your real image
/// (Image.asset / Image.network / CachedNetworkImage) when you have assets.
class _PlaceholderAvatar extends StatelessWidget {
  final double radius;
  final String? colorSeed;
  const _PlaceholderAvatar({required this.radius, this.colorSeed});

  @override
  Widget build(BuildContext context) {
    final colors = [
      const Color(0xFFB9D8FF),
      const Color(0xFFFFD3B0),
      const Color(0xFFC9F0D6),
      const Color(0xFFFFC9E0),
    ];
    final color = colorSeed == null
        ? Colors.grey.shade300
        : colors[colorSeed.hashCode.abs() % colors.length];

    return CircleAvatar(
      radius: radius,
      backgroundColor: color,
      child: Icon(Icons.person, size: radius, color: Colors.white),
      // ^ PLACEHOLDER — swap this whole CircleAvatar's `child`/`backgroundImage`
      // with: backgroundImage: AssetImage('assets/avatars/xxx.png'),
    );
  }
}

/// =====================================================================
/// Rating box: laurel wreaths + "4.3" + stars + downloads caption,
/// with the pin-shaped photo badge overlapping the top edge.
/// (Matches the updated design reference.)
/// =====================================================================
class _RatingBadgeBox extends StatelessWidget {
  final String rating;
  final String downloadsLabel;
  const _RatingBadgeBox({required this.rating, required this.downloadsLabel});

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
            border: Border.all(color: const Color(0xFFECECEC)),
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
                  const _Wreath(flip: false),
                  const SizedBox(width: 14),
                  Text(
                    rating,
                    style: const TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF14213D),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const _StarRow(rating: 5, size: 24),
                  const SizedBox(width: 14),
                  const _Wreath(flip: true),
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

        // Pin-shaped photo badge, overlapping the top border of the box.
        const Positioned(top: -14, child: _BadgePin()),
      ],
    );
  }
}


class _Wreath extends StatelessWidget {
  final bool flip;
  const _Wreath({required this.flip});

  @override
  Widget build(BuildContext context) {
    final image = Image.asset(
      'assets/images/left-21.png',
    );
    return flip ? Transform.flip(flipX: true, child: image) : image;
  }
}

/// The rounded "pin" badge that holds the user photo, matching the shape
/// in the design (rounded-square top, pointed bottom, dark outer ring,
/// yellow inner ring).
class _BadgePin extends StatelessWidget {
  const _BadgePin();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 58,
      height: 68,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          // Outer dark ring
          SizedBox(
            width: 58,
            height: 68,
            child: ClipPath(
              clipper: const _PinClipper(),
              child: Container(color: const Color(0xFF14213D)),
            ),
          ),
          // Inner yellow pin (inset to reveal the dark ring behind it)
          Padding(
            padding: const EdgeInsets.only(top: 3),
            child: SizedBox(
              width: 52,
              height: 62,
              child: ClipPath(
                clipper: const _PinClipper(),
                child: Container(color: const Color(0xFFFFC531)),
              ),
            ),
          ),
          // Photo placeholder — swap for the real user/reviewer photo.
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

/// Clips a rounded-top, pointed-bottom "pin" shape.
class _PinClipper extends CustomClipper<Path> {
  const _PinClipper();

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

/// Faint dotted background painted behind the whole screen, matching the
/// subtle dot-grid seen in the design reference.
class _DottedBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0xFFEDEDED);
    const spacing = 18.0;
    const dotRadius = 1.1;
    for (double y = 4; y < size.height; y += spacing) {
      for (double x = 4; x < size.width; x += spacing) {
        canvas.drawCircle(Offset(x, y), dotRadius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// =====================================================================
/// Localization (self-contained, no .arb needed)
/// =====================================================================
class _Review {
  final String name;
  final String text;
  const _Review(this.name, this.text);
}

class _RateUsStrings {
  final String title;
  final String subtitle;
  final String downloads;
  final String usedBy;
  final String cta;
  final String footer;
  final List<_Review> reviews;

  const _RateUsStrings({
    required this.title,
    required this.subtitle,
    required this.downloads,
    required this.usedBy,
    required this.cta,
    required this.footer,
    required this.reviews,
  });

  factory _RateUsStrings.of(bool isArabic) {
    return isArabic ? _arabic : _english;
  }

  static const _english = _RateUsStrings(
    title: 'Give us a rating',
    subtitle: 'Pocket was made for\npeople like you',
    downloads: '20K+ App Downloads',
    usedBy: 'Used by 20K+ people',
    cta: 'Rate Pocket',
    footer: 'It only takes 2 seconds of your time',
    reviews: [
      _Review(
        'Omar Kamel',
        'بقالي كبير جداً على تحميل تطبيقات ادارة المصاريف والحمدلله ده اول '
            'تطبيق فعلا عملي وبسيط ',
      ),
      _Review(
        'Marwan A.',
        "I've downloaded expense trackers before but always stopped after a "
            "few days. With Pocket I just say what I spent and move on. It's "
            "honestly the first money app I've kept using for more than a week.",
      ),
      _Review(
        'Ghada al-badr',
        'كنت بتضايق من ادخال المصاريف يدوياً، بوكيت الأول اللي بيخليني أعرف '
            'أطلعاتي وأتحكم فيها بسهولة',
      ),
      _Review(
        'Ali Hassan',
        'The app is honestly great and so easy to use. It\'s been super '
            'helpful especially the voiceover feature. It\'s amazing it really '
            'helped me get my wallet and expenses organized',
      ),
    ],
  );

  static const _arabic = _RateUsStrings(
    title: 'قيّم تجربتك معنا',
    subtitle: 'صُمّم بوكيت من أجلك\nولاحتياجاتك',
    downloads: 'أكثر من 20 ألف تحميل',
    usedBy: 'أكثر من 20 ألف مستخدم يثقون في Pocket',
    cta: 'قيّم تجربتك',
    footer: 'يستغرق الأمر ثانيتين فقط من وقتك',
    reviews: [
      _Review(
        'Omar Kamel',
        'بقالي كبير جداً على تحميل تطبيقات ادارة المصاريف والحمدلله ده اول '
            'تطبيق فعلا عملي وبسيط ',
      ),
      _Review(
        'Marwan A.',
        "I've downloaded expense trackers before but always stopped after a "
            "few days. With Pocket I just say what I spent and move on. It's "
            "honestly the first money app I've kept using for more than a week.",
      ),
      _Review(
        'Ghada al-badr',
        'كانت الاكسبيكشن من قبل التنزيل عالية جداً بس بعد استخدام التطبيق '
            'وجدت التوقعات والتصورات التي يمتلكها فيه',
      ),
      _Review(
        'Ali Hassan',
        'The app is honestly great and so easy to use. It\'s been super '
            'helpful especially the voiceover feature. It\'s amazing it really '
            'helped me get my wallet and expenses organized',
      ),
    ],
  );
}