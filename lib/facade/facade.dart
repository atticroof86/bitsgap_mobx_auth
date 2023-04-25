import 'package:bitsgap_mobx_auth/framework/_framework.dart';
import 'package:bitsgap_mobx_auth/services/_services.dart';
import 'package:bitsgap_mobx_auth/storage/store_data.dart';
import 'package:bitsgap_mobx_auth/storage/store_state.dart';
import 'package:flutter/material.dart';

class Facade {
  Facade({required this.statesManager, required this.dataManager, required this.api});

  late final Data data = dataManager;
  late final States states = statesManager;

  final AppApi api;
  final DataManager dataManager;
  final StatesManager statesManager;
  final navigator = XRouteNavigator(routeBuilder: (widgetBuilder) => MaterialPageRoute(builder: widgetBuilder));
}
