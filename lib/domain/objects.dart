import 'package:freezed_annotation/freezed_annotation.dart';

import 'enums.dart';

part 'objects.g.dart';

part 'objects.freezed.dart';

@freezed
class StateAuthEx with _$StateAuthEx {
  const factory StateAuthEx({
    required StateAuth stateInput,
    required StateOverlay stateOverlay,
  }) = _StateAuthEx;
}

@freezed
class UserInfo with _$UserInfo {
  const factory UserInfo({
    required String token,
    required String name,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) => _$UserInfoFromJson(json);
}

@JsonSerializable(createToJson: false)
class DtoUserResponse {
  DtoUserResponse({required this.token, required this.name});
  final String token;
  final String name;

  factory DtoUserResponse.fromJson(Map<String, dynamic> json) => _$DtoUserResponseFromJson(json);
}

@JsonSerializable(createFactory: false)
class DtoAuthRequest {
  DtoAuthRequest({required this.name, required this.password});
  final String name;
  final String password;

  Map<String, dynamic> toJson() => _$DtoAuthRequestToJson(this);
}
