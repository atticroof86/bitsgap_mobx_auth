import 'package:bitsgap_mobx_auth/base/_base.dart';
import 'package:bitsgap_mobx_auth/services/_services.dart';
import 'pages/_pages.dart';

class FlowMain extends AppFlow {
  FlowMain(super.facade);

  @override
  void flow([String? deepLink]) => facade.navigator.first(
      (context) => MainPage(onSignOut: _onSignOut, username: facade.storageService.read(StorageKey.userName) ?? 'ой'));

  void _onSignOut() async {
    await facade.storageService.clear();
    facade.factory.commands.makeShowAuth().execute();
  }
}
