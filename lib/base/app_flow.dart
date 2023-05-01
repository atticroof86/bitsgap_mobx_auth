import 'package:bitsgap_mobx_auth/facade/facade.dart';
import 'package:bitsgap_mobx_auth/framework/_framework.dart';

abstract class AppFlow<T> extends XFlowImpl<T> {
  AppFlow(this.facade);
  final Facade facade;
}
