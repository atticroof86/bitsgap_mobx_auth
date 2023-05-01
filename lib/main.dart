import 'package:bitsgap_mobx_auth/facade/facade.dart';
import 'package:bitsgap_mobx_auth/services/_services.dart';
import 'package:bitsgap_mobx_auth/shared/_shared.dart';
import 'package:bitsgap_mobx_auth/store/_store.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  const light = AppColorsLight();
  const dark = AppColorsDark();

  final brightness = WidgetsFlutterBinding.ensureInitialized().window.platformBrightness;
  final colors = brightness == Brightness.light ? light : dark;

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: colors.background, // navigation bar color
    statusBarColor: colors.secondary, // status bar color
  ));

  final storage = StorageService.localShared();
  await storage.init();

  final facade = Facade(storeStates: StoreStates(), storageService: storage);

  runApp(MaterialApp(
    theme: AppTheme.light,
    darkTheme: AppTheme.dark,
    scaffoldMessengerKey: facade.messenger.messengerKey,
    navigatorKey: facade.navigator.navigatorKey,
    home: Container(),
  ));

  facade.factory.flows.makeStartup().run();
}
