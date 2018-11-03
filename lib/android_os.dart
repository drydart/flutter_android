/* This is free and unencumbered software released into the public domain. */

/// Provides basic operating system services, message passing, and
/// inter-process communication on the device.
///
/// See: https://developer.android.com/reference/android/os/package-summary
library android_os;

import 'dart:async';
import 'dart:io' show Directory, File;

import 'package:flutter/services.dart';

/// Provides access to environment variables.
///
/// See: https://developer.android.com/reference/android/os/Environment
abstract class Environment {
  static const MethodChannel _channel = MethodChannel('flutter_android/Environment');

  /// Return the user data directory.
  ///
  /// See: https://developer.android.com/reference/android/os/Environment#getDataDirectory()
  static Future<Directory> get dataDirectory async {
    final String path = await _channel.invokeMethod('getDataDirectory');
    return Directory(path);
  }

  /// Return the download/cache content directory.
  ///
  /// See: https://developer.android.com/reference/android/os/Environment#getDownloadCacheDirectory()
  static Future<Directory> get downloadCacheDirectory async {
    final String path = await _channel.invokeMethod('getDownloadCacheDirectory');
    return Directory(path);
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
    final String path = await _channel.invokeMethod('getExternalStorageDirectory');
    return Directory(path);
  }

  /// Returns the current state of the primary shared/external storage media.
  ///
  /// See: https://developer.android.com/reference/android/os/Environment#getExternalStorageState()
  static Future<String> get externalStorageState async {
    final String value = await _channel.invokeMethod('getExternalStorageState');
    return value; // TODO: enum values
  }

  /// Return root of the "system" partition holding the core Android OS. Always
  /// present and mounted read-only.
  ///
  /// See: https://developer.android.com/reference/android/os/Environment#getRootDirectory()
  static Future<Directory> get rootDirectory async {
    final String path = await _channel.invokeMethod('getRootDirectory');
    return Directory(path);
  }

  /// Returns whether the primary shared/external storage media is emulated.
  ///
  /// See: https://developer.android.com/reference/android/os/Environment#isExternalStorageEmulated()
  static Future<bool> get isExternalStorageEmulated async {
    return await _channel.invokeMethod('isExternalStorageEmulated');
  }

  /// Returns whether the primary shared/external storage media is physically
  /// removable.
  ///
  /// See: https://developer.android.com/reference/android/os/Environment#isExternalStorageRemovable()
  static Future<bool> get isExternalStorageRemovable async {
    return await _channel.invokeMethod('isExternalStorageRemovable');
  }
}
