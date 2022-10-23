import 'package:ffcache/ffcache.dart';
import 'package:flutter/foundation.dart';
import '../interfaces/i_app_cache.dart';

class AppCacheManager implements ICacheManager {
  final FFCache _instance = FFCache();

  // Creates a store

  @override
  Future<void> deleteCacheValue(String key) async {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, String>> getAllCacheValues(String key) async {
    throw UnimplementedError();
  }

  @override
  Future<String?> getCacheValue(String key) async {
    String? value = "";
    try {
      value = await _instance.getString(key);
    } catch (error) {
      if (kDebugMode) {
        print("error fetching cached value: ${error.toString()}");
      }
    }
    return value;
  }

  @override
  Future<void> init() async {
    throw UnimplementedError();
  }

  @override
  void resetCache() {
    _instance.clear();
  }

  @override
  Future<void> writeCacheValue(
      String key, String value, Duration duration) async {
    await _instance.setStringWithTimeout(key, value, duration);
  }

  @override
  Future<bool> exits(String key) {
    return Future.value(_instance.has(key));
  }
}
