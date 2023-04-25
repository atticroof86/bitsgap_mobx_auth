import 'package:bitsgap_mobx_auth/storage/_storage.dart';
import 'package:flutter/cupertino.dart';

typedef AppPageEnh = AppPage<Data, States>;

abstract class AppPage<D, S> extends StatelessWidget {
  const AppPage({super.key, required this.data, required this.states});

  final D data;
  final S states;
}
