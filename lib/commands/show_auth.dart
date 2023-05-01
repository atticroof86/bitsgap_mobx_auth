import 'package:bitsgap_mobx_auth/base/app_command.dart';
import 'package:bitsgap_mobx_auth/flows/_flows.dart';
import 'package:bitsgap_mobx_auth/services/_services.dart';

const assertMsg = '''Непредвиденное обстоятельство. FlowAuth не должен был сейчас вернуть нам пустое имя,\n
тк у нас сейчас нет в логике варианта пропустить аутентификацию.''';

class ShowAuthCommand extends AppCommand {
  ShowAuthCommand(super.facade);

  @override
  Future execute() async {
    String? name = await facade.factory.flows.makeAuth().run();
    assert(name != null, assertMsg);
    await facade.storageService.write(StorageKey.userName, name ?? 'ой');
    FlowMain(facade).run();
  }
}
