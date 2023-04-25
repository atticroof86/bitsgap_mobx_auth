import 'package:bitsgap_mobx_auth/base/_base.dart';
import 'package:bitsgap_mobx_auth/flows/_flows.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/_pages.dart';

class FlowMain extends AppFlow {
  FlowMain(super.facade);

  @override
  void flow([String? deepLink]) => facade.navigator.first(
      (context) => MainPage(onSignOut: _onSignOut, onSignIn: _onSignIn, data: facade.data, states: facade.states));

  void _onSignOut() async {
    (await SharedPreferences.getInstance()).clear();
    facade.dataManager.signOut();
  }

  void _onSignIn() async {
    /// да, тут повторяется блок и по-хорошему его бы завернуть при помощи паттерна "команда",
    /// но я не стал перегружать и так перегруженный ТЗ

    String? token2 = await FlowAuth(facade, mode: AuthFlowMode.startup).run();
    if (token2 != null) (await SharedPreferences.getInstance()).setString('token', token2);
  }
}
