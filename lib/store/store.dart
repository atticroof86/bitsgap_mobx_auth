import 'package:mobx/mobx.dart';

part 'store.g.dart';

enum StateAuth { signIn, signUp }

class StoreState = StoreStateImpl with _$StoreState;

abstract class StoreStateImpl with Store {
  @readonly
  StateAuth _stateAuth = StateAuth.signIn;
  StateAuth get stateAuth => _stateAuth;

  @action
  void showSignIn() => _stateAuth = StateAuth.signIn;

  @action
  void showSignUp() => _stateAuth = StateAuth.signUp;
}
