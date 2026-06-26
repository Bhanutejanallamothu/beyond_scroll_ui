import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Claymorphism palette
  static const Color bg = Color(0xFFECFDF5);
  static const Color panel = Color(0xFFF0FDF4);
  static const Color cardBg = Color(0xFFFFFFFF);
  static const Color acid = Color(0xFF22C55E);
  static const Color acidDim = Color(0xFF15803D);
  static const Color accent2 = Color(0xFF1E8A5E);
  static const Color accent2Light = Color(0xFFD4F0E4);
  static const Color accent2Mid = Color(0xFF2CAF78);
  static const Color accent3 = Color(0xFF4FC4CF);
  static const Color warn = Color(0xFFFF8C61);
  static const Color warnDim = Color(0xFFD96840);
  static const Color ink = Color(0xFF1A1F2E);
  static const Color inkDim = Color(0xFF6B7A99);

  static ThemeData get theme {
    return ThemeData(
      scaffoldBackgroundColor: bg,
      primaryColor: acid,
      textTheme: GoogleFonts.interTextTheme().apply(
        bodyColor: ink,
        displayColor: ink,
      ),
    );
  }

  // BoxDecorations for Claymorphism
  static BoxDecoration clayCardDecoration = BoxDecoration(
    color: cardBg,
    borderRadius: BorderRadius.circular(22),
    boxShadow: [
      // Outer drop shadows
      BoxShadow(
        color: acid.withValues(alpha: 0.18),
        offset: const Offset(0, 8),
        blurRadius: 24,
      ),
      BoxShadow(
        color: acid.withValues(alpha: 0.10),
        offset: const Offset(0, 2),
        blurRadius: 6,
      ),
      // Flutter doesn't natively support inner shadows (inset) in BoxShadow.
      // We often simulate it with a border or a Stack with CustomPaint.
      // For this simplified version, we'll use border for the top/left highlight.
    ],
    border: Border.all(color: Colors.white.withValues(alpha: 0.5), width: 1.5),
  );

  static BoxDecoration clayButtonDecoration = BoxDecoration(
    gradient: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xFFF0FAF5), Color(0xFFE0F4EC)],
    ),
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
      BoxShadow(
        color: const Color(0xFF1E8A5E).withValues(alpha: 0.15),
        offset: const Offset(0, 6),
        blurRadius: 16,
      ),
    ],
    border: Border.all(color: Colors.white.withValues(alpha: 0.5), width: 1.0),
  );

  static BoxDecoration solidButtonDecoration = BoxDecoration(
    gradient: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [accent2, accent2Mid],
    ),
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
      BoxShadow(
        color: const Color(0xFF1E8A5E).withValues(alpha: 0.38),
        offset: const Offset(0, 6),
        blurRadius: 20,
      ),
    ],
    border: Border.all(color: Colors.white.withValues(alpha: 0.2), width: 1.0),
  );

  static BoxDecoration warnButtonDecoration = BoxDecoration(
    gradient: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [warn, Color(0xFFFFAC8A)],
    ),
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
      BoxShadow(
        color: warn.withValues(alpha: 0.35),
        offset: const Offset(0, 6),
        blurRadius: 16,
      ),
    ],
    border: Border.all(color: Colors.white.withValues(alpha: 0.2), width: 1.0),
  );
}
