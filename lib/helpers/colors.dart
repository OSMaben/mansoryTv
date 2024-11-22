part of 'helpers.dart';

const Color kColorPrimary = Color.fromARGB(255, 64, 131, 232);
const Color kColorPrimaryDark = Color.fromARGB(255, 39, 59, 161);

const Color kColorFocus = Color.fromARGB(255, 4, 95, 160);

const Color kColorBack = Color(0xFF14153A);
const Color kColorBackDark = Color(0xff0a082c);

const Color kColorCardLight = Color(0xFF172048);
const Color kColorCardDark = Color(0xFF162546);
const Color kColorCardDarkness = Color(0xFF100E15);

const Color kColorHint = Color(0xFFE7E7E7);
const Color kColorHintGrey = Color(0xFFF5F5F5);
const Color kColorFontLight = Color(0xFFFFFFFF);

BoxDecoration kDecorBackground = const BoxDecoration(
  gradient: LinearGradient(
    colors: [kColorBackDark, kColorBack],
  ),
);

BoxDecoration kDecorIconCircle = const BoxDecoration(
  shape: BoxShape.circle,
  gradient: LinearGradient(
    colors: [kColorPrimaryDark, kColorPrimary],
  ),
);

/*
const Color kColorPrimary = Color(0xFFEF233C);
const Color kColorPrimaryDark = Color(0xFFB31A2D);

const Color kColorFocus = Color(0xFFD72036);

const Color kColorBack = Color(0xFF131518);
const Color kColorBackDark = Color(0xFF171A1D);

const Color kColorCardLight = Color(0xFF272B30);
const Color kColorCardDark = Color(0xFF1D2024);
const Color kColorCardDarkness = Color(0xFF131518);
 */
