import 'dart:math';

import 'package:bitsgap_mobx_auth/domain/_domain.dart';

const _infernalTimeout = Duration(milliseconds: 666);
final _rand = Random();

bool get _oops => _rand.nextInt(1000) % 13 == 0;

abstract class AppApi {
  Future<DtoUserResponse?> signIn(DtoAuthRequest dtoLoginRequest);
  Future<DtoUserResponse?> signUp(DtoAuthRequest dtoLoginRequest);
  Future signOut();
}

class AppFakeApi implements AppApi {
  @override
  Future<DtoUserResponse?> signIn(DtoAuthRequest dtoLoginRequest) async {
    await Future.delayed(_infernalTimeout);
    return _oops ? null : DtoUserResponse(token: 'awesomeToken', name: dtoLoginRequest.name);
  }

  @override
  Future signOut() => Future.delayed(_infernalTimeout);

  @override
  Future<DtoUserResponse?> signUp(DtoAuthRequest dtoLoginRequest) async {
    await Future.delayed(_infernalTimeout);
    return _oops ? null : DtoUserResponse(token: 'awesomeToken', name: dtoLoginRequest.name);
  }
}
