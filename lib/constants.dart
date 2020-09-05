import 'package:flutter/material.dart';

Color gradientStartColor = Color(0xFF192741);
Color gradientFirstColor = Color(0xFF4A3752);
Color gradientSecondColor = Color(0xFF7D4964);
Color gradientThirdColor = Color(0xFFC7617F);
Color gradientFourthColor = Color(0xFFFA93A3);
Color gradientEndColor = Color(0xFFF8D8C9);
Color facebook = Color(0xFF4267B2);
Color nameColor = Color(0xFF3F455A);
Color ratingCol = Color(0XFFEF544A);
TextStyle position = TextStyle(
  fontSize: 120.0,
  fontWeight: FontWeight.bold,
  fontFamily: 'Gilroy',
  color: Color(0xffF2F4F6),
);

BoxDecoration homeBody = BoxDecoration(
  gradient: LinearGradient(
    colors: [
      gradientFirstColor,
      gradientSecondColor,
      gradientThirdColor,
      gradientFourthColor,
      gradientEndColor
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.1, 0.3, 0.5, 0.7, 0.9],
  ),
);
TextStyle rating = TextStyle(
  color: Colors.white,
  fontFamily: 'Gilroy',
  fontWeight: FontWeight.bold,
  fontSize: 25,
);

Color gradientInsStartColor = Color(0xFF405DE6);
Color gradientInsFirstColor = Color(0xFF5851DB);
Color gradientInsSecondColor = Color(0xFF833AB4);
Color gradientInsThirdColor = Color(0xFFC13584);
Color gradientInsFourthColor = Color(0xFFE1306C);
Color gradientInsFivethColor = Color(0xFFFD1D1D);
Color gradientInsSixthColor = Color(0xFFF56040);
Color gradientInsSeventhColor = Color(0xFFF77737);
Color gradientInsEightthColor = Color(0xFFFCAF45);
Color gradientInsEndColor = Color(0xFFFFDC80);

BoxDecoration instagram = BoxDecoration(
  gradient: LinearGradient(
    colors: [
      gradientInsStartColor,
      gradientInsFirstColor,
      gradientInsSecondColor,
      gradientInsThirdColor,
      gradientInsFourthColor,
      gradientInsFivethColor,
      gradientInsSixthColor,
      gradientInsSeventhColor,
      gradientInsEightthColor,
      gradientInsEndColor
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.1, 0.3, 0.5, 0.7, 0.9],
  ),
);
