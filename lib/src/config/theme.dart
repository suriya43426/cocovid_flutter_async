import 'package:flutter/material.dart';

class Theme {
  const Theme();

  static const Color gradientStart = const Color(0xff57CBE6);
  static const Color gradientEnd = const Color(0xff5649E6);

  static const gradient = const LinearGradient(
      colors: [gradientStart, gradientEnd],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.0, 1.0]);
}
