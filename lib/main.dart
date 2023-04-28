import 'package:bitsgap_mobx_auth/pages/_pages.dart';
import 'package:bitsgap_mobx_auth/shared/_shared.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  const light = AppColorsLight();
  const dark = AppColorsDark();

  final brightness = WidgetsFlutterBinding.ensureInitialized().window.platformBrightness;
  final colors = brightness == Brightness.light ? light : dark;

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: colors.background, // navigation bar color
    statusBarColor: colors.secondary, // status bar color
  ));

  runApp(MaterialApp(
    theme: AppTheme.light,
    darkTheme: AppTheme.dark,
    home: AuthPage(),
  ));
}
