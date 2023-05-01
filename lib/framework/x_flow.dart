import 'dart:async';

import 'package:flutter/foundation.dart';

abstract class XFlow<T> {
  Future<T> run([String? deepLink]);
}

abstract class XFlowImpl<T> implements XFlow<T> {
  final _c = Completer<T>();

  @protected
  void flow([String? deepLink]);

  @override
  Future<T> run([String? deepLink]) {
    flow(deepLink);
    return _c.future;
  }

  void resolve([T? result]) => _c.complete(result);
}
