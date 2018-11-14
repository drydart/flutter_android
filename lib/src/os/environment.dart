/* This is free and unencumbered software released into the public domain. */

import 'dart:async' show Future;
import 'dart:io' show Directory;

import 'package:flutter/services.dart' show MethodChannel;

/// Provides access to environment variables.
///
/// See: https://developer.android.com/reference/android/os/Environment
abstract class Environment {
  static const MethodChannel _channel = MethodChannel('flutter_android/Environment');

  /// Return the user data directory.
  ///
  /// See: https://developer.android.com/reference/android/os/Environment#getDataDirectory()
  static Future<Directory> get dataDirectory async {
    return Directory(await _channel.invokeMethod('getDataDirectory') as String);
  }

  /// Return the download/cache content directory.
  ///
  /// See: https://developer.android.com/reference/android/os/Environment#getDownloadCacheDirectory()
  static Future<Directory> get downloadCacheDirectory async {
    return Directory(await _channel.invokeMethod('getDownloadCacheDirectory') as String);
  }

  /// Return the primary shared/external storage directory.
  ///
  /// This directory may not currently be accessible if it has been mounted by
  /// the user on their computer, has been removed from the device, or some
  /// other problem has happened. You can determine its current state with
  /// [externalStorageState].
  ///
  /// See: https://developer.android.com/reference/android/os/Environment#getExternalStorageDirectory()
  static Future<Directory> get externalStorageDirectory async {
    return Directory(await _channel.invokeMethod('getExternalStorageDirectory') as String);
  }

  /// Returns the current state of the primary shared/external storage media.
  ///
  /// See: https://developer.android.com/reference/android/os/Environment#getExternalStorageState()
  static Future<String> get externalStorageState async {
    return await _channel.invokeMethod('getExternalStorageState') as String; // TODO: enum values
  }

  /// Return root of the "system" partition holding the core Android OS. Always
  /// present and mounted read-only.
  ///
  /// See: https://developer.android.com/reference/android/os/Environment#getRootDirectory()
  static Future<Directory> get rootDirectory async {
    return Directory(await _channel.invokeMethod('getRootDirectory') as String);
  }

  /// Returns whether the primary shared/external storage media is emulated.
  ///
  /// See: https://developer.android.com/reference/android/os/Environment#isExternalStorageEmulated()
  static Future<bool> get isExternalStorageEmulated async {
    return await _channel.invokeMethod('isExternalStorageEmulated') as bool;
  }

  /// Returns whether the primary shared/external storage media is physically
  /// removable.
  ///
  /// See: https://developer.android.com/reference/android/os/Environment#isExternalStorageRemovable()
  static Future<bool> get isExternalStorageRemovable async {
    return await _channel.invokeMethod('isExternalStorageRemovable') as bool;
  }
}
