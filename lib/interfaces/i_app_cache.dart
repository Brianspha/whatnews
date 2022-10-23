/// @dev contains method signatures that write to Cache/cache
///
abstract class ICacheManager {
  //@dev initialised before calling any other function
  Future<void> init();

  ///@dev gets all app Cache values
  ///@returns a Mapping which contains all the values with their keys
  Future<Map<String, String>> getAllCacheValues(String key);

  ///@dev Checks if key exists in cache
  ///@returns bool
  Future<bool> exits(String key);

  /// @dev gets a value associated with the give key
  /// @param key - The key to be used to search for the associated value
  /// @returns the value associated with the key in String format
  Future<String?> getCacheValue(String key);

  /// @dev deletes a value associated with the current key
  /// @param key- The key to be used to delete the associated key-value
  void deleteCacheValue(String key);

  /// @dev writes to the current Cache instance
  /// @param key - The key to be used to associate the value with
  /// @param value the value to be stored
  /// @duration The duration which the cache is to be kept for in cache
  Future<void> writeCacheValue(String key, String value, Duration duration);

  /// @dev deletes all key-values from the current Cache instance
  void resetCache();
}
