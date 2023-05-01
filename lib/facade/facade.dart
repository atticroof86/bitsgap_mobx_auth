import 'package:bitsgap_mobx_auth/commands/_commands.dart';
import 'package:bitsgap_mobx_auth/flows/_flows.dart';
import 'package:bitsgap_mobx_auth/framework/_framework.dart';
import 'package:bitsgap_mobx_auth/services/_services.dart';
import 'package:bitsgap_mobx_auth/store/_store.dart';
import 'package:flutter/material.dart';

class Facade {
  Facade({required this.storeStates, required this.storageService});

  final StorageService storageService;
  final StoreStates storeStates;
  final navigator = XRouteNavigator(routeBuilder: (widgetBuilder) => MaterialPageRoute(builder: widgetBuilder));
  final messenger = XMessenger();

  late final factory = AppFactory(this);
}

class AppFactory {
  AppFactory(this._facade);

  final Facade _facade;

  late final commands = CommandFactory(_facade);
  late final flows = FlowFactory(_facade);
}

class FlowFactory {
  FlowFactory(this._facade);

  final Facade _facade;

  XFlow makeAuth() => FlowAuth(_facade);
  XFlow makeStartup() => FlowStartup(_facade);
  XFlow makeMain() => FlowMain(_facade);
}

class CommandFactory {
  CommandFactory(this._facade);

  final Facade _facade;

  XCommand makeShowAuth() => ShowAuthCommand(_facade);
}
