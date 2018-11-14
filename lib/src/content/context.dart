/* This is free and unencumbered software released into the public domain. */

import 'dart:async' show Future;
import 'dart:io' show Directory, File;

import 'package:flutter/services.dart' show MethodChannel;

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
  static Future<Directory> get cacheDir async {
    return Directory(await _channel.invokeMethod('getCacheDir') as String);
  }

  /// Returns the absolute path to the application specific cache directory on
  /// the filesystem designed for storing cached code.
  ///
  /// See: https://developer.android.com/reference/android/content/Context#getCodeCacheDir()
  static Future<Directory> get codeCacheDir async {
    return Directory(await _channel.invokeMethod('getCodeCacheDir') as String);
  }

  /// Returns the absolute path to the directory on the filesystem where all
  /// private files belonging to this app are stored.
  ///
  /// See: https://developer.android.com/reference/android/content/Context.html#getDataDir()
  static Future<Directory> get dataDir async {
    return Directory(await _channel.invokeMethod('getDataDir') as String);
  }

  /// Returns absolute path to application-specific directory on the primary
  /// shared/external storage device where the application can place cache files
  /// it owns. These files are internal to the application, and not typically
  /// visible to the user as media.
  ///
  /// See: https://developer.android.com/reference/android/content/Context#getExternalCacheDir()
  static Future<Directory> get externalCacheDir async {
    return Directory(await _channel.invokeMethod('getExternalCacheDir') as String);
  }

  /// Returns the absolute path to the directory on the primary shared/external
  /// storage device where the application can place persistent files it owns.
  /// These files are internal to the applications, and not typically visible to
  /// the user as media.
  ///
  /// See: https://developer.android.com/reference/android/content/Context#getExternalFilesDir(java.lang.String)
  static Future<Directory> get externalFilesDir async {
    return Directory(await _channel.invokeMethod('getExternalFilesDir') as String);
  }

  /// Returns the absolute path to the directory on the filesystem where files
  /// created with `openFileOutput(String, int)` are stored.
  ///
  /// See: https://developer.android.com/reference/android/content/Context#getFilesDir()
  static Future<Directory> get filesDir async {
    return Directory(await _channel.invokeMethod('getFilesDir') as String);
  }

  /// Returns the absolute path to the directory where files placed under this
  /// directory will be excluded from automatic backup to remote storage.
  ///
  /// See: https://developer.android.com/reference/android/content/Context#getNoBackupFilesDir()
  static Future<Directory> get noBackupFilesDir async {
    return Directory(await _channel.invokeMethod('getNoBackupFilesDir') as String);
  }

  /// Return the full path to this context's primary Android package. The
  /// Android package is a ZIP file which contains application's primary code
  /// and assets.
  ///
  /// See: https://developer.android.com/reference/android/content/Context#getPackageCodePath()
  static Future<File> get packageCodePath async {
    return File(await _channel.invokeMethod('getPackageCodePath') as String);
  }

  /// Return the name of this application's package.
  ///
  /// See: https://developer.android.com/reference/android/content/Context#getPackageName()
  static Future<String> get packageName async {
    return await _channel.invokeMethod('getPackageName') as String;
  }

  /// Return the full path to this context's primary Android package. The
  /// Android package is a ZIP file which contains the application's primary
  /// resources.
  ///
  /// See: https://developer.android.com/reference/android/content/Context#getPackageResourcePath()
  static Future<File> get packageResourcePath async {
    return File(await _channel.invokeMethod('getPackageResourcePath') as String);
  }
}
