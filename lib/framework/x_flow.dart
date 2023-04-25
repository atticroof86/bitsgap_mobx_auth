import 'dart:async';

import 'package:flutter/foundation.dart';

abstract class XFlow<T> {
  XFlow();

  final _c = Completer<T>();

  @protected
  void flow([String? deepLink]);

  FutureOr<T> run([String? deepLink]) {
    flow(deepLink);
    return T == Null ? Future.value() : _c.future;
  }

  void resolve([T? result]) => _c.complete();
}
