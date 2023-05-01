import 'package:flutter/material.dart';

abstract class XMessenger {
  factory XMessenger() => _XMessengerImpl();

  GlobalKey<ScaffoldMessengerState> get messengerKey;

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason>? showSnackBar(SnackBar snackBar);
  void removeCurrentSnackBar({SnackBarClosedReason reason = SnackBarClosedReason.remove});
  void hideCurrentSnackBar({SnackBarClosedReason reason = SnackBarClosedReason.hide});
  void clearSnackBars();

  ScaffoldFeatureController<MaterialBanner, MaterialBannerClosedReason>? showMaterialBanner(
      MaterialBanner materialBanner);
  void removeCurrentMaterialBanner({MaterialBannerClosedReason reason = MaterialBannerClosedReason.remove});
  void hideCurrentMaterialBanner({MaterialBannerClosedReason reason = MaterialBannerClosedReason.hide});
  void clearMaterialBanners();
}

class _XMessengerImpl implements XMessenger {
  @override
  final messengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  void clearMaterialBanners() => messengerKey.currentState?.clearMaterialBanners();

  @override
  void clearSnackBars() => messengerKey.currentState?.clearSnackBars();

  @override
  void hideCurrentMaterialBanner({MaterialBannerClosedReason reason = MaterialBannerClosedReason.hide}) =>
      messengerKey.currentState?.hideCurrentMaterialBanner(reason: reason);

  @override
  void hideCurrentSnackBar({SnackBarClosedReason reason = SnackBarClosedReason.hide}) =>
      messengerKey.currentState?.hideCurrentSnackBar(reason: reason);

  @override
  void removeCurrentMaterialBanner({MaterialBannerClosedReason reason = MaterialBannerClosedReason.remove}) =>
      messengerKey.currentState?.removeCurrentMaterialBanner(reason: reason);

  @override
  void removeCurrentSnackBar({SnackBarClosedReason reason = SnackBarClosedReason.remove}) =>
      messengerKey.currentState?.removeCurrentSnackBar(reason: reason);

  @override
  ScaffoldFeatureController<MaterialBanner, MaterialBannerClosedReason>? showMaterialBanner(
          MaterialBanner materialBanner) =>
      messengerKey.currentState?.showMaterialBanner(materialBanner);

  @override
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason>? showSnackBar(SnackBar snackBar) =>
      messengerKey.currentState?.showSnackBar(snackBar);
}
