import 'package:libreria_antioquia/data/cache_storage/cache_storage_interface.dart';
import 'package:libreria_antioquia/data/cache_storage/share_pref_impl.dart';

class MainConfig {
  CacheStorageInterface cacheStorage = SharePrefImpl();
}
