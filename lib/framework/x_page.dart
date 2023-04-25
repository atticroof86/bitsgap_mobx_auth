import 'package:flutter/widgets.dart';

typedef XPageState<T> = T Function();

abstract class XStatefulPage<T> extends XPage {
  const XStatefulPage({super.key, required this.getState});

  final XPageState<T> getState;
}

abstract class XPage extends StatelessWidget {
  const XPage({super.key});
}
