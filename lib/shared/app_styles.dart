import 'package:flutter/material.dart';

abstract class AppColors {
  Color get background;
  Color get foreground;
  Color get primary;
  Color get secondary;
  Color get success;
  Color get error;
}

class AppColorsLight implements AppColors {
  const AppColorsLight();

  static const _background = Color(0xFFF9F9F9);
  static const _foreground = Color(0xFF262931);
  static const _primary = Color(0xFF4A55A7);
  static const _secondary = Color(0xFFBFDBFE);
  static const _success = Color(0xFF00B37E);
  static const _error = Color(0xFFE12E0D);

  @override
  final background = _background;

  @override
  final error = _error;

  @override
  final foreground = _foreground;

  @override
  final primary = _primary;

  @override
  final secondary = _secondary;

  @override
  final success = _success;
}

class AppColorsDark implements AppColors {
  const AppColorsDark();

  static const _background = Color(0xFF181818);
  static const _foreground = Color(0xFFFFFFFF);
  static const _primary = Color(0xFF6371DE);
  static const _secondary = Color(0xFF1E293B);
  static const _success = Color(0xFF00B37E);
  static const _error = Color(0xFFE12E0D);

  @override
  final background = _background;

  @override
  final error = _error;

  @override
  final foreground = _foreground;

  @override
  final primary = _primary;

  @override
  final secondary = _secondary;

  @override
  final success = _success;
}

class AppTheme {
  static InputBorder _border(AppColors colors) => OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(24.0)),
      borderSide: BorderSide(color: colors.primary, width: 1),
      gapPadding: 10.0);

  static ThemeData _make(AppColors colors, Brightness brightness) => ThemeData(
        primaryColor: colors.primary,
        focusColor: colors.primary,
        snackBarTheme: const SnackBarThemeData(),
        colorScheme: ColorScheme(
            brightness: brightness,
            primary: colors.primary,
            onPrimary: colors.foreground,
            secondary: colors.secondary,
            onSecondary: colors.foreground,
            background: colors.background,
            onBackground: colors.foreground,
            surface: colors.secondary,
            onSurface: colors.foreground,
            error: colors.error,
            onError: Colors.white),
        textTheme: TextTheme(
            titleMedium: TextStyle(
                color: colors.foreground,
                fontSize: 16,
                fontFamily: 'TT Norms Pro',
                fontWeight: FontWeight.w400,
                height: 22.4 / 16)),
        inputDecorationTheme: InputDecorationTheme(
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            enabledBorder: _border(colors),
            iconColor: colors.foreground,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            focusedBorder: _border(colors),
            border: _border(colors)),
      );

  static final light = _make(const AppColorsLight(), Brightness.light);
  static final dark = _make(const AppColorsDark(), Brightness.dark);
}
