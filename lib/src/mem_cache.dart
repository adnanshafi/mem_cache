/// {@template mem_cache}
///
/// A Simple In Memory Cache Client to reduce firebase hits
///
/// {@endtemplate}

class MemCache {
  /// {@macro mem_cache}
  MemCache() : _cache = <String, Object>{};

  /// Key - value store for storing commonly accessed objects
  final Map<String, Object> _cache;

  /// Write a value to the cache
  ///
  /// `key` : key to be used to store the value
  ///
  /// `value` : object to be cached
  void put<T extends Object>({required String key, required T value}) {
    _cache[key] = value;
  }

  /// Read a generic value from cache
  ///
  /// returns null if [key] not found or type mismatch
  ///
  /// `key` : key of the object to be read
  T? get<T extends Object>({required String key}) {
    final value = _cache[key];
    if (value is T) return value;
    return null;
  }
}
