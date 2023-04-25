import 'package:bitsgap_mobx_auth/base/_base.dart';
import 'package:bitsgap_mobx_auth/storage/_storage.dart';
import 'package:flutter/widgets.dart';

typedef AuthActionCallback = void Function({required String username, required String password});

enum AuthPageMode { skip, cancel }

class AuthPage extends AppPageEnh {
  const AuthPage(
    this._mode, {
    super.key,
    required super.data,
    required super.states,
    required this.onSwitchMode,
    required this.onAction,
    required this.onCancel,
  });

  final AuthPageMode _mode;
  final VoidCallback onSwitchMode;
  final VoidCallback onCancel;
  final AuthActionCallback onAction;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
