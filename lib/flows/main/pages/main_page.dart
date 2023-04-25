import 'package:bitsgap_mobx_auth/base/_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class MainPage extends AppPageEnh {
  const MainPage(
      {super.key, required this.onSignOut, required this.onSignIn, required super.data, required super.states});

  final VoidCallback onSignOut;
  final VoidCallback onSignIn;

  @override
  Widget build(BuildContext context) => Scaffold(
      body: Observer(
          builder: (BuildContext context) => data.isAuth
              ? _ContentAuth(name: data.userInfo?.name ?? 'ой', onSignOut: onSignOut)
              : _ContentAnon(onSignIn: onSignIn)));
}

class _ContentAnon extends StatelessWidget {
  const _ContentAnon({super.key, required this.onSignIn});
  final VoidCallback onSignIn;

  @override
  Widget build(BuildContext context) => ElevatedButton(onPressed: onSignIn, child: const Text('войти'));
}

class _ContentAuth extends StatelessWidget {
  const _ContentAuth({super.key, required this.name, required this.onSignOut});
  final String name;
  final VoidCallback onSignOut;

  @override
  Widget build(BuildContext context) =>
      Column(children: [Text('привет $name'), ElevatedButton(onPressed: onSignOut, child: const Text('выйти'))]);
}
