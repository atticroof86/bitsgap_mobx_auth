import 'package:bitsgap_mobx_auth/base/_base.dart';
import 'package:bitsgap_mobx_auth/domain/_domain.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/_pages.dart';

enum AuthFlowMode { startup, manual }

class FlowAuth extends AppFlow<String?> {
  FlowAuth(super.facade, {required this.mode});

  final AuthFlowMode mode;

  @override
  void flow([String? deepLink]) async {
    facade.statesManager.prepare();
    facade.navigator.next((context) => AuthPage(
          mode == AuthFlowMode.manual ? AuthPageMode.cancel : AuthPageMode.skip,
          data: facade.data,
          states: facade.states,
          onSwitchMode: _onSwitchMode,
          onAction: _onAction,
          onCancel: _onCancel,
        ));
  }

  void _onSwitchMode() => facade.statesManager.switchSignModeState();

  void _onAction({required String password, required String username}) async {
    facade.statesManager.showLoading();
    final request = DtoAuthRequest(name: username, password: password);
    final response = facade.states.stateAuth.stateInput == StateAuth.signIn
        ? await facade.api.signIn(request)
        : await facade.api.signUp(request);

    if (response == null) {
      facade.statesManager.showResult(success: false);
      await Future.delayed(const Duration(seconds: 1));
      facade.statesManager.showPending();
    } else {
      facade.dataManager.signIn(UserInfo(token: response.token, name: response.name));
      facade.statesManager.showResult(success: true);
      await Future.delayed(const Duration(seconds: 1));
      facade.navigator.pop();
      (await SharedPreferences.getInstance()).setString('name', response.name);
      resolve(response.token);
    }
  }

  void _onCancel() {
    facade.navigator.pop();
    resolve();
  }
}
