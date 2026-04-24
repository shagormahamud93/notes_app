import 'package:flutter/material.dart';

class AppColors {
  // Gradient Colors
  static const Color gradientStart = Color(0xFF1E1E2C);
  static const Color gradientMiddle = Color(0xFF2A2A40);
  static const Color gradientEnd = Color(0xFF3A3A5A);

  static const LinearGradient mainGradient = LinearGradient(
    colors: [gradientStart, gradientMiddle, gradientEnd],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Text Colors
  static const Color white = Colors.white;
  static const Color white70 = Colors.white70;

  // Card / Glass Effect
  static Color glass = Colors.white.withOpacity(0.1);

  // Button
  static const Color primary = Colors.deepPurpleAccent;

  // Avatar BG
  static Color avatarBg = Colors.white.withOpacity(0.2);
}
