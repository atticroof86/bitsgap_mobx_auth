import 'package:bitsgap_mobx_auth/base/_base.dart';
import 'package:bitsgap_mobx_auth/services/_services.dart';

class FlowStartup extends AppFlow {
  FlowStartup(super.facade);

  @override
  void flow([String? deepLink]) async {
    await Future.delayed(const Duration(milliseconds: 666));

    if (facade.storageService.contains(StorageKey.userName)) {
      facade.factory.flows.makeMain().run();
    } else {
      facade.factory.commands.makeShowAuth().execute();
    }
  }
}
