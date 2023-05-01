import 'package:bitsgap_mobx_auth/domain/_domain.dart';
import 'package:mobx/mobx.dart';

part 'store_states.g.dart';

class StoreStates = StoreStatesImpl with _$StoreStates;

abstract class StatesData {
  AuthPageState get authPage;
}

abstract class StoreStatesImpl with Store implements StatesData {
  @readonly
  AuthPageState _authPageState = AuthPageState.initial();

  @override
  AuthPageState get authPage => _authPageState;

  @action
  void showSignIn() => _authPageState = _authPageState.copyWith(mode: AuthPageMode.signIn);

  @action
  void showSignUp() => _authPageState = _authPageState.copyWith(mode: AuthPageMode.signUp);

  @action
  void showValid(bool value) => _authPageState = _authPageState.copyWith(valid: value);

  @action
  void showLoading(bool value) => _authPageState = _authPageState.copyWith(loading: value);

  @action
  void prepare() => _authPageState = AuthPageState.initial();
}
