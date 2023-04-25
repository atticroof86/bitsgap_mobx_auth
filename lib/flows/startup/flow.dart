import 'package:bitsgap_mobx_auth/base/_base.dart';
import 'package:bitsgap_mobx_auth/domain/_domain.dart';
import 'package:bitsgap_mobx_auth/flows/_flows.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FlowStartup extends AppFlow {
  FlowStartup(super.facade);

  @override
  void flow([String? deepLink]) async {
    final preferences = await SharedPreferences.getInstance(); // да, это лучше в сервис, но сейчас ТЗ
    final token = preferences.getString('token'); // да, магическая строка, но так быстрее сейчас
    final name = preferences.getString('name');
    await Future.delayed(const Duration(milliseconds: 666));

    if (token == null) {
      String? token2 = await FlowAuth(facade, mode: AuthFlowMode.startup).run();
      if (token2 != null) preferences.setString('token', token2);
    } else {
      facade.dataManager.signIn(UserInfo(token: token, name: name ?? 'ой'));
      FlowMain(facade).run();
    }
  }
}
