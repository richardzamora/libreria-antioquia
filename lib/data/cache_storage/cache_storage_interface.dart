import 'dart:async';

abstract class CacheStorageInterface {
  Future<void> init();
  Future<String?> getString(String key);
  Future<void> setString(String key, String value);
  Future<Map<String, dynamic>> getObject(String key);
  Future<void> setObject(String key, Map<String, dynamic> value);
  Future<List<String>> getListString(String key);
  Future<void> setListString(String key, List<String> value);
}
