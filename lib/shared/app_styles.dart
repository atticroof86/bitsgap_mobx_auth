import 'package:bitsgap_mobx_auth/shared/_shared.dart';
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

class AppSnacks {
  static const snackOk = SnackBar(
    margin: EdgeInsets.all(24),
    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
    content: _Snack(_iconOk),
    backgroundColor: AppColorsLight._success,
    closeIconColor: Colors.white,
    showCloseIcon: true,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
  );

  static const snackError = SnackBar(
    margin: EdgeInsets.all(24),
    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
    content: _Snack(_iconError),
    backgroundColor: AppColorsLight._error,
    closeIconColor: Colors.white,
    showCloseIcon: true,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
  );
}

const _iconOk = SizedBox(width: 26, height: 26, child: Icon(Icons.check_circle, color: Colors.white, size: 26));
const _iconError = SizedBox(width: 26, height: 26, child: Icon(Icons.cancel, color: Colors.white, size: 26));

class _Snack extends StatelessWidget {
  const _Snack(this.icon);

  final Widget icon;

  @override
  Widget build(BuildContext context) => Row(mainAxisSize: MainAxisSize.min, children: [
        icon,
        15.w,
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            'Well done!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              height: 28 / 20,
              letterSpacing: .15,
              fontWeight: FontWeight.w500,
              fontFamily: 'TT Norms Pro',
            ),
          ),
          2.h,
          const Text("Lorem ipsum dolor sit amet,\n consectetur",
              maxLines: 2,
              softWrap: true,
              overflow: TextOverflow.fade,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                height: 20 / 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'TT Norms Pro',
              ))
        ])
      ]);
}
