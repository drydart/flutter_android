/* This is free and unencumbered software released into the public domain. */

/// Contains classes for accessing and publishing data on a device.
///
/// See: https://developer.android.com/reference/android/content/package-summary
library android_content;

import 'dart:async';

import 'package:flutter/services.dart';

/// This exception is thrown when a call to `Context.startActivity(Intent)` or
/// one of its variants fails because an `Activity` can not be found to execute
/// the given Intent.
///
/// See: https://developer.android.com/reference/android/content/ActivityNotFoundException
class ActivityNotFoundException extends PlatformException {}

/// Interface to global information about an application environment.
///
/// This is an abstract class whose implementation is provided by the Android
/// system. It allows access to application-specific resources and classes, as
/// well as up-calls for application-level operations such as launching
/// activities, broadcasting and receiving intents, etc.
///
/// See: https://developer.android.com/reference/android/content/Context
abstract class Context {
  static const MethodChannel _channel = MethodChannel('flutter_android/Context');

  /// Returns the absolute path to the application specific cache directory on
  /// the filesystem.
  ///
  /// See: https://developer.android.com/reference/android/content/Context.html#getCacheDir()
  static Future<String> get cacheDir async {
    final String result = await _channel.invokeMethod('getCacheDir');
    return result;
  }

  /// Returns the absolute path to the application specific cache directory on
  /// the filesystem designed for storing cached code.
  ///
  /// See: https://developer.android.com/reference/android/content/Context#getCodeCacheDir()
  static Future<String> get codeCacheDir async {
    final String result = await _channel.invokeMethod('getCodeCacheDir');
    return result;
  }

  /// Returns the absolute path to the directory on the filesystem where all
  /// private files belonging to this app are stored.
  ///
  /// See: https://developer.android.com/reference/android/content/Context.html#getDataDir()
  static Future<String> get dataDir async {
    final String result = await _channel.invokeMethod('getDataDir');
    return result;
  }

  /// Returns absolute path to application-specific directory on the primary
  /// shared/external storage device where the application can place cache files
  /// it owns. These files are internal to the application, and not typically
  /// visible to the user as media.
  ///
  /// See: https://developer.android.com/reference/android/content/Context#getExternalCacheDir()
  static Future<String> get externalCacheDir async {
    final String result = await _channel.invokeMethod('getExternalCacheDir');
    return result;
  }

  /// Returns the absolute path to the directory on the primary shared/external
  /// storage device where the application can place persistent files it owns.
  /// These files are internal to the applications, and not typically visible to
  /// the user as media.
  ///
  /// See: https://developer.android.com/reference/android/content/Context#getExternalFilesDir(java.lang.String)
  static Future<String> get externalFilesDir async {
    final String result = await _channel.invokeMethod('getExternalFilesDir');
    return result;
  }

  /// Returns the absolute path to the directory on the filesystem where files
  /// created with `openFileOutput(String, int)` are stored.
  ///
  /// See: https://developer.android.com/reference/android/content/Context#getFilesDir()
  static Future<String> get filesDir async {
    final String result = await _channel.invokeMethod('getFilesDir');
    return result;
  }

  /// Returns the absolute path to the directory where files placed under this
  /// directory will be excluded from automatic backup to remote storage.
  ///
  /// See: https://developer.android.com/reference/android/content/Context#getNoBackupFilesDir()
  static Future<String> get noBackupFilesDir async {
    final String result = await _channel.invokeMethod('getNoBackupFilesDir');
    return result;
  }

  /// Return the full path to this context's primary Android package. The
  /// Android package is a ZIP file which contains application's primary code
  /// and assets.
  ///
  /// See: https://developer.android.com/reference/android/content/Context#getPackageCodePath()
  static Future<String> get packageCodePath async {
    final String result = await _channel.invokeMethod('getPackageCodePath');
    return result;
  }

  /// Return the name of this application's package.
  ///
  /// See: https://developer.android.com/reference/android/content/Context#getPackageName()
  static Future<String> get packageName async {
    final String result = await _channel.invokeMethod('getPackageName');
    return result;
  }

  /// Return the full path to this context's primary Android package. The
  /// Android package is a ZIP file which contains the application's primary
  /// resources.
  ///
  /// See: https://developer.android.com/reference/android/content/Context#getPackageResourcePath()
  static Future<String> get packageResourcePath async {
    final String result = await _channel.invokeMethod('getPackageResourcePath');
    return result;
  }
}

/// An intent is an abstract description of an operation to be performed.
///
/// An [Intent] provides a facility for performing late runtime binding between
/// the code in different applications. Its most significant use is in the
/// launching of activities, where it can be thought of as the glue between
/// activities. It is basically a passive data structure holding an abstract
/// description of an action to be performed.
///
/// See: https://developer.android.com/reference/android/content/Intent
abstract class Intent {
}

/// Structured description of [Intent] values to be matched.
///
/// An [IntentFilter] can match against actions, categories, and data (either
/// via its type, scheme, and/or path) in an Intent. It also includes a
/// "priority" value which is used to order multiple matching filters.
///
/// See: https://developer.android.com/reference/android/content/IntentFilter
abstract class IntentFilter {
}

/// Interface for accessing and modifying preference data.
///
/// See: https://developer.android.com/reference/android/content/SharedPreferences
abstract class SharedPreferences {
}
