import 'package:libreria_antioquia/data/cache_storage/cache_storage_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharePrefImpl extends CacheStorageInterface {
  static final SharePrefImpl _sharePrefs = SharePrefImpl._internal();
  factory SharePrefImpl() {
    return _sharePrefs;
  }
  SharePrefImpl._internal();

  late SharedPreferences _prefs;

  @override
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  Future<Map<String, dynamic>> getObject(String key) async {
    return json.decode(_prefs.getString(key) ?? '{}') as Map<String, dynamic>;
  }

  @override
  Future<String?> getString(String key) async {
    return _prefs.getString(key);
  }

  @override
  Future<void> setObject(String key, Map<String, dynamic> value) async {
    _prefs.setString(key, json.encode(value));
  }

  @override
  Future<void> setString(String key, String value) async {
    _prefs.setString(key, value);
  }
}
