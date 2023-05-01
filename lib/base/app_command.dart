import 'package:bitsgap_mobx_auth/facade/facade.dart';
import 'package:bitsgap_mobx_auth/framework/_framework.dart';

abstract class AppCommand extends XCommand {
  AppCommand(this.facade);
  final Facade facade;
}
