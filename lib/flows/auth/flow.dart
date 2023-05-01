import 'package:bitsgap_mobx_auth/base/_base.dart';
import 'package:bitsgap_mobx_auth/shared/_shared.dart';
import 'package:flutter/widgets.dart';
import 'pages/_pages.dart';

class FlowAuth extends AppFlow<String?> {
  FlowAuth(super.facade);

  @override
  void flow([String? deepLink]) async {
    facade.storeStates.prepare();
    facade.navigator.first(_builder);
  }

  Widget _builder(context) => AuthPage(
      statesData: facade.storeStates,
      onSignIn: facade.storeStates.showSignIn,
      onSignUp: facade.storeStates.showSignUp,
      onSubmit: _onSubmit);

  void _onSubmit(String name, String pwd) async {
    if (name == '' || pwd == '') return;
    await _popLoading();

    if (name == pwd) {
      facade.messenger.showSnackBar(AppSnacks.snackOk);
      resolve(name);
    } else {
      facade.messenger.showSnackBar(AppSnacks.snackError);
      await _popValidation();
    }
  }

  Future<void> _popLoading() async {
    facade.storeStates.showLoading(true);
    await Future.delayed(const Duration(seconds: 2));
    facade.storeStates.showLoading(false);
  }

  Future<void> _popValidation() async {
    facade.storeStates.showValid(true);
    await Future.delayed(const Duration(milliseconds: 300));
    facade.storeStates.showValid(false);
  }
}
