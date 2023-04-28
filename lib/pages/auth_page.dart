import 'package:bitsgap_mobx_auth/shared/_shared.dart';
import 'package:bitsgap_mobx_auth/store/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

typedef SignInCallback = void Function(String username, String password);
typedef SignUpCallback = void Function(String username, String password, String email);

enum AuthPageMode { skip, cancel }

class AuthPage extends StatelessWidget {
  AuthPage({super.key});

  ColorScheme _scheme(BuildContext context) => Theme.of(context).colorScheme;

  final store = StoreState();

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: _scheme(context).background,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(child: ColoredBox(color: _scheme(context).background)),
          const AppHeader(),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                8.h,
                _buildContentAnimated(),
                30.h,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: AppSmartButtonBar(
                    items: [
                      AppSmartButtonBarItem('Login', onSubmit: () {}, onSelect: () => store.showSignIn()),
                      AppSmartButtonBarItem('Sign-up', onSubmit: () {}, onSelect: () => store.showSignUp()),
                    ],
                  ),
                ),
                8.h
              ],
            ),
          ),
          const Positioned(left: 24, top: 54, child: AppLogo()),
        ],
      ));

  Widget _buildContentAnimated() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Observer(
          builder: (BuildContext context) => Stack(clipBehavior: Clip.none, children: [
                _wrapSlideFade(context, -1, StateAuth.signIn, const _SignIn()),
                _wrapSlideFade(context, 1, StateAuth.signUp, const _SignUp()),
              ])));

  Widget _wrapSlideFade(BuildContext context, int direction, StateAuth target, Widget child) => AnimatedSlide(
      offset: Offset(store.stateAuth == target ? 0 : direction * 1.1, 0),
      duration: const Duration(milliseconds: 300),
      child: child);
}

class _SignIn extends StatelessWidget {
  const _SignIn();

  @override
  Widget build(BuildContext context) => SizedBox(
      height: 162,
      child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        const SizedBox(height: 46, child: TextField(decoration: InputDecoration(hintText: 'Username'))),
        12.h,
        const SizedBox(
            height: 46, child: TextField(obscureText: true, decoration: InputDecoration(hintText: 'Password')))
      ]));
}

class _SignUp extends StatelessWidget {
  const _SignUp();

  @override
  Widget build(BuildContext context) => SizedBox(
      height: 162,
      // width: MediaQuery.of(context).size.width - 24,
      child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        const SizedBox(height: 46, child: TextField(decoration: InputDecoration(hintText: 'Email'))),
        12.h,
        const SizedBox(height: 46, child: TextField(decoration: InputDecoration(hintText: 'Username'))),
        12.h,
        const SizedBox(
            height: 46, child: TextField(obscureText: true, decoration: InputDecoration(hintText: 'Password')))
      ]));
}
