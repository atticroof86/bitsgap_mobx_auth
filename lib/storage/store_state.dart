import 'package:bitsgap_mobx_auth/domain/_domain.dart';
import 'package:mobx/mobx.dart';

part 'store_state.g.dart';

class StoreStates = StoreStatesImpl with _$StoreStates;

abstract class States {
  StateAuthEx get stateAuth;
}

abstract class StatesManager extends States {
  void prepare();
  void switchSignModeState();
  void showPending();
  void showLoading();
  void showResult({required bool success});
}

abstract class StoreStatesImpl with Store implements StatesManager {
  @observable
  StateAuthEx _stateAuth = const StateAuthEx(stateInput: StateAuth.signIn, stateOverlay: StateOverlay.pending);

  @override
  StateAuthEx get stateAuth => _stateAuth;

  @action
  @override
  void switchSignModeState() => _stateAuth.stateInput == StateAuth.signUp
      ? _stateAuth = _stateAuth.copyWith(stateInput: StateAuth.signIn)
      : _stateAuth = _stateAuth.copyWith(stateInput: StateAuth.signIn);

  @action
  @override
  void showPending() => _stateAuth = _stateAuth.copyWith(stateOverlay: StateOverlay.pending);

  @action
  @override
  void showLoading() => _stateAuth = _stateAuth.copyWith(stateOverlay: StateOverlay.loading);

  @action
  @override
  void showResult({required bool success}) =>
      _stateAuth = _stateAuth.copyWith(stateOverlay: success ? StateOverlay.success : StateOverlay.failure);

  @action
  @override
  void prepare() => _stateAuth = const StateAuthEx(stateInput: StateAuth.signIn, stateOverlay: StateOverlay.pending);
}
