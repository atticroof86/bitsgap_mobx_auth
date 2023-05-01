import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum StorageKey { userName }

abstract class StorageService {
  factory StorageService.localShared() => _SharedPrefsStorageImpl._instance;

  Future<void> init();

  bool contains(StorageKey key);
  String? read(StorageKey key);
  Future<void> write(StorageKey key, String value);
  Future<void> clear();
}

class _SharedPrefsStorageImpl implements StorageService {
  static final _instance = _SharedPrefsStorageImpl();

  late final SharedPreferences _prefs;
  bool _ready = false;

  void _checkReady() {
    assert(_ready, 'Хранилище не готово. Нужно вызвать init().');
  }

  @override
  bool contains(StorageKey key) {
    _checkReady();
    debugPrint('check contains ${key.name}');
    debugPrint('check ${_prefs.getKeys()}');
    debugPrint('check ${_prefs.containsKey(key.name)}');
    return _prefs.containsKey(key.name);
  }

  @override
  String? read(StorageKey key) {
    _checkReady();
    return _prefs.getString(key.name);
  }

  @override
  Future<void> write(StorageKey key, String value) async {
    _checkReady();
    await _prefs.setString(key.name, value);
  }

  @override
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    _ready = true;
  }

  @override
  Future<void> clear() async {
    _checkReady();
    await _prefs.remove(StorageKey.userName.name);
    await _prefs.clear();
  }
}
