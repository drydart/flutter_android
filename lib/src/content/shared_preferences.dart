/* This is free and unencumbered software released into the public domain. */

import 'dart:async' show Future;
import 'dart:io' show Platform;

import 'package:flutter/services.dart' show MethodChannel;

/// Interface for accessing and modifying preference data.
///
/// For any particular set of preferences, there is a single instance of this
/// class that all clients share.
///
/// See: https://developer.android.com/reference/android/content/SharedPreferences
abstract class SharedPreferences {
  /// See [Context.getSharedPreferences].
  static Future<SharedPreferences> open(final String name,
      [final int mode = 0]) async {
    return _SharedPreferences(name, mode).load();
  }

  /// Retrieves a value from the preferences.
  ///
  /// See: https://developer.android.com/reference/android/content/SharedPreferences#getBoolean(java.lang.String,%20boolean)
  T get<T>(String key, [T defaultValue]);

  /// Checks whether the preferences contains a preference.
  ///
  /// See: https://developer.android.com/reference/android/content/SharedPreferences#contains(java.lang.String)
  bool contains(String key) => get(key) != null;

  /// Retrieves all values from the preferences.
  ///
  /// See: https://developer.android.com/reference/android/content/SharedPreferences#getAll()
  Map<String, dynamic> getAll();

  /// Retrieves a boolean value from the preferences.
  ///
  /// See: https://developer.android.com/reference/android/content/SharedPreferences#getBoolean(java.lang.String,%20boolean)
  bool getBoolean(String key, [bool defaultValue]) => get(key, defaultValue);

  /// Retrieves a float value from the preferences.
  ///
  /// See: https://developer.android.com/reference/android/content/SharedPreferences#getFloat(java.lang.String,%20float)
  double getFloat(String key, [double defaultValue]) => get(key, defaultValue);

  /// Retrieves an int value from the preferences.
  ///
  /// See: https://developer.android.com/reference/android/content/SharedPreferences#getInt(java.lang.String,%20int)
  int getInt(String key, [int defaultValue]) => get(key, defaultValue);

  /// Retrieves a long value from the preferences.
  ///
  /// See: https://developer.android.com/reference/android/content/SharedPreferences#getLong(java.lang.String,%20long)
  int getLong(String key, [int defaultValue]) => get(key, defaultValue);

  /// Retrieves a string value from the preferences.
  ///
  /// See: https://developer.android.com/reference/android/content/SharedPreferences#getString(java.lang.String,%20java.lang.String)
  String getString(String key, [String defaultValue]) => get(key, defaultValue);

  /// Retrieves a set of string values from the preferences.
  ///
  /// See: https://developer.android.com/reference/android/content/SharedPreferences#getStringSet(java.lang.String,%20java.util.Set%3Cjava.lang.String%3E)
  Set<String> getStringSet(String key, [Set<String> defaultValue]) =>
      get(key, defaultValue);
}

class _SharedPreferences extends SharedPreferences {
  static const MethodChannel _channel =
      MethodChannel('flutter_android/SharedPreferences');

  final String name;
  final int mode;
  Map<String, dynamic> _cache;

  _SharedPreferences(this.name, this.mode);

  Future<SharedPreferences> load() async {
    assert(Platform.isAndroid);
    final request = <String, dynamic>{'name': name, 'mode': mode};
    _cache = (await _channel.invokeMethod('getAll', request)
            as Map<dynamic, dynamic>)
        .cast<String, dynamic>();
    return this;
  }

  @override
  T get<T>(String key, [T defaultValue]) {
    return _cache[key] ?? defaultValue;
  }

  @override
  Map<String, dynamic> getAll() {
    return Map.unmodifiable(_cache);
  }
}
