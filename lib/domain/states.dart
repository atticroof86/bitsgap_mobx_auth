import 'package:freezed_annotation/freezed_annotation.dart';

part 'states.freezed.dart';

enum AuthPageMode { signIn, signUp }

@freezed
class AuthPageState with _$AuthPageState {
  const factory AuthPageState({required bool loading, required bool valid, required AuthPageMode mode}) =
      _AuthPageState;

  factory AuthPageState.initial() => const AuthPageState(loading: false, valid: true, mode: AuthPageMode.signIn);
}
