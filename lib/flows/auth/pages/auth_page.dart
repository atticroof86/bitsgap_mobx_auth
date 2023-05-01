import 'package:bitsgap_mobx_auth/domain/_domain.dart';
import 'package:bitsgap_mobx_auth/shared/_shared.dart';
import 'package:bitsgap_mobx_auth/store/_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

typedef SignInCallback = void Function(String username, String password);
typedef SignUpCallback = void Function(String username, String password, String email);

// enum AuthPageMode { skip, cancel }

class AuthPage extends StatelessWidget {
  AuthPage(
      {super.key, required this.statesData, required this.onSignIn, required this.onSignUp, required this.onSubmit});

  ColorScheme _scheme(BuildContext context) => Theme.of(context).colorScheme;

  final StatesData statesData;
  final VoidCallback onSignIn;
  final VoidCallback onSignUp;
  final Function(String name, String pwd) onSubmit;

  final _name = TextEditingController();
  final _pwd = TextEditingController();

  // я не проверяю в логике почту сейчас. так, поле для красоты и соответствию дизайну
  void _onSubmit() {
    final name = _name.text;
    final pwd = _pwd.text;
    _name.clear();
    _pwd.clear();
    onSubmit(name, pwd);
  }

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
              child: Observer(
                builder: (BuildContext context) => AnimatedCrossFade(
                    firstChild: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        8.h,
                        _buildContentAnimated(),
                        30.h,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: AppSmartButtonBar(
                            items: [
                              AppSmartButtonBarItem('Login', onSubmit: _onSubmit, onSelect: () {
                                // можем переносить значение, можем убирать
                                _name.clear();
                                _pwd.clear();
                                onSignIn();
                              }),
                              AppSmartButtonBarItem('Sign-up', onSubmit: _onSubmit, onSelect: () {
                                // можем переносить значение, можем убирать
                                _name.clear();
                                _pwd.clear();
                                onSignUp();
                              }),
                            ],
                          ),
                        ),
                        8.h
                      ],
                    ),
                    secondChild: Center(
                        child: SizedBox(
                            width: 48,
                            height: 48,
                            child: CircularProgressIndicator(color: Theme.of(context).colorScheme.onPrimary))),
                    duration: const Duration(milliseconds: 300),
                    crossFadeState: statesData.authPage.loading ? CrossFadeState.showSecond : CrossFadeState.showFirst),
              )),
          const Positioned(left: 24, top: 54, child: AppLogo()),
        ],
      ));

  Widget _buildContentAnimated() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Observer(
          builder: (BuildContext context) => Stack(clipBehavior: Clip.none, children: [
                _wrapSlideFade(context, -1, AuthPageMode.signIn, _SignIn(_name, _pwd)),
                _wrapSlideFade(context, 1, AuthPageMode.signUp, _SignUp(_name, _pwd)),
              ])));

  Widget _wrapSlideFade(BuildContext context, int direction, AuthPageMode target, Widget child) => AnimatedSlide(
      offset: Offset(statesData.authPage.mode == target ? 0 : direction * 1.1, 0),
      duration: const Duration(milliseconds: 300),
      child: child);
}

class _SignIn extends StatelessWidget {
  const _SignIn(this._name, this._pwd);

  final TextEditingController _name;
  final TextEditingController _pwd;

  @override
  Widget build(BuildContext context) => SizedBox(
      height: 162,
      child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        SizedBox(
            height: 46, child: TextField(controller: _name, decoration: const InputDecoration(hintText: 'Username'))),
        12.h,
        SizedBox(
            height: 46,
            child:
                TextField(controller: _pwd, obscureText: true, decoration: const InputDecoration(hintText: 'Password')))
      ]));
}

class _SignUp extends StatelessWidget {
  const _SignUp(this._name, this._pwd);

  final TextEditingController _name;
  final TextEditingController _pwd;

  @override
  Widget build(BuildContext context) => SizedBox(
      height: 162,
      // width: MediaQuery.of(context).size.width - 24,
      child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        const SizedBox(height: 46, child: TextField(decoration: InputDecoration(hintText: 'Email'))),
        12.h,
        SizedBox(
            height: 46, child: TextField(controller: _name, decoration: const InputDecoration(hintText: 'Username'))),
        12.h,
        SizedBox(
            height: 46,
            child:
                TextField(controller: _pwd, obscureText: true, decoration: const InputDecoration(hintText: 'Password')))
      ]));
}
