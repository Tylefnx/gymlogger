import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'color_schemes_state.freezed.dart';

@freezed
class ColorSchemeState with _$ColorSchemeState {
  const ColorSchemeState._();
  const factory ColorSchemeState.light({
    required ThemeData themeData,
  }) = _LightTheme;

  const factory ColorSchemeState.dark({
    required ThemeData themeData,
  }) = _DarkTheme;

  bool get isDark => this is _DarkTheme;
}

class ColorSchemeStateNotifier extends StateNotifier<ColorSchemeState> {
  ColorSchemeStateNotifier()
      : super(ColorSchemeState.light(themeData: _lightTheme));

  static final ColorScheme _lightColorScheme = ColorScheme.fromSeed(
    seedColor: Colors.deepPurple,
  );

  static final ColorScheme _darkColorScheme = ColorScheme.fromSeed(
    seedColor: Colors.deepPurple,
    brightness: Brightness.dark,
  );

  static final ThemeData _lightTheme = ThemeData(
    fontFamily: 'Roboto',
    useMaterial3: true,
    colorScheme: _lightColorScheme,
    appBarTheme: AppBarTheme(
      backgroundColor: _lightColorScheme.primary,
      foregroundColor: _lightColorScheme.onPrimary,
      elevation: 0,
      centerTitle: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _lightColorScheme.primary,
        foregroundColor: _lightColorScheme.onPrimary,
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: _lightColorScheme.primary,
        side: BorderSide(color: _lightColorScheme.primary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: _lightColorScheme.primary,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: _lightColorScheme.primary,
      foregroundColor: _lightColorScheme.onPrimary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: _lightColorScheme.surface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: _lightColorScheme.surface,
      selectedItemColor: _lightColorScheme.primary,
      unselectedItemColor: _lightColorScheme.onSurface.withValues(alpha: 0.6),
      showUnselectedLabels: true,
      selectedIconTheme: const IconThemeData(size: 28),
      unselectedIconTheme: const IconThemeData(size: 24),
    ),
  );

  static final ThemeData _darkTheme = ThemeData(
    fontFamily: 'Roboto',
    useMaterial3: true,
    colorScheme: _darkColorScheme,
    appBarTheme: AppBarTheme(
      backgroundColor: _darkColorScheme.surface,
      foregroundColor: _darkColorScheme.onSurface,
      elevation: 0,
      centerTitle: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _darkColorScheme.primary,
        foregroundColor: _darkColorScheme.onPrimary,
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: _darkColorScheme.primary,
        side: BorderSide(color: _darkColorScheme.primary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: _darkColorScheme.primary,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: _darkColorScheme.primary,
      foregroundColor: _darkColorScheme.onPrimary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: _darkColorScheme.surface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: _darkColorScheme.surface,
      selectedItemColor: _darkColorScheme.primary,
      unselectedItemColor: _darkColorScheme.onSurface.withValues(alpha: 0.6),
      showUnselectedLabels: true,
      selectedIconTheme: const IconThemeData(size: 28),
      unselectedIconTheme: const IconThemeData(size: 24),
    ),
  );

  void activateLightTheme() {
    state = ColorSchemeState.light(themeData: _lightTheme);
  }

  void activateDarkTheme() {
    state = ColorSchemeState.dark(themeData: _darkTheme);
  }
}

final colorSchemeStateNotifierProvider =
    StateNotifierProvider<ColorSchemeStateNotifier, ColorSchemeState>(
  (ref) => ColorSchemeStateNotifier(),
);
