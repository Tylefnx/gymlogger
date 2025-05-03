import 'package:flutter/material.dart';

const Color baseColor = Color(0xFF6200EE); // Ana renk

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: baseColor,
  onPrimary: Colors.white,
  secondary: Color(0xFF7C4DFF), // Sabit açık ton
  onSecondary: Colors.white,
  surface: Color(0xFFEDE7F6), // Hafif renklenmiş yüzey
  onSurface: Colors.black,
  error: Color(0xFFB00020),
  onError: Colors.white,
  outline: Color(0xFFD1C4E9), // Çizgiler için tonlu renk
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: baseColor,
  onPrimary: Colors.black,
  secondary: Color(0xFF512DA8), // Sabit koyu ton
  onSecondary: Colors.black,
  surface: Color(0xFF311B92), // Hafif tonlama ile koyu yüzey
  onSurface: Colors.white,
  error: Color(0xFFCF6679),
  onError: Colors.black,
  outline: Color(0xFF9575CD),
);
