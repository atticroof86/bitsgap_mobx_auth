import 'package:bitsgap_mobx_auth/shared/_shared.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
    required this.onSignOut,
    required this.username,
  });

  final VoidCallback onSignOut;
  final String username;

  @override
  Widget build(BuildContext context) => Scaffold(body: _ContentAuth(name: username, onSignOut: onSignOut));
}

class _ContentAuth extends StatelessWidget {
  const _ContentAuth({required this.name, required this.onSignOut});
  final String name;
  final VoidCallback onSignOut;

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.all(48.0),
      child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Center(child: Text('Привет $name!!1')),
            24.h,
            SizedBox(
                height: 48,
                child: ElevatedButton(
                    onPressed: onSignOut,
                    child: const Center(child: Text('Выйти', style: TextStyle(color: Colors.white)))))
          ])));
}
