import 'package:bitsgap_mobx_auth/domain/_domain.dart';
import 'package:mobx/mobx.dart';

part 'store_data.g.dart';

class StoreData = DataImpl with _$StoreData;

abstract class Data {
  UserInfo? get userInfo;
  bool get isAuth;
}

abstract class DataManager extends Data {
  void signIn(UserInfo info);
  void signOut();
}

abstract class DataImpl with Store implements DataManager {
  @observable
  UserInfo? _info;

  @override
  UserInfo? get userInfo => _info;

  @action
  @override
  void signIn(UserInfo info) => _info = info;

  @action
  @override
  void signOut() => _info = null;

  @override
  bool get isAuth => _info != null;
}
