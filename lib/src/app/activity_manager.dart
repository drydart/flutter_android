/* This is free and unencumbered software released into the public domain. */

import 'dart:async' show Future;
import 'dart:io' show Platform;

import 'package:flutter/services.dart' show MethodChannel;

/// Gives information about, and interacts with, activities, services, and the
/// containing process.
///
/// See: https://developer.android.com/reference/android/app/ActivityManager
class ActivityManager {
  static const MethodChannel _channel =
      MethodChannel('flutter_android/ActivityManager');

  /// Returns `true` if device is running in a test harness.
  ///
  /// See: https://developer.android.com/reference/android/app/ActivityManager#isRunningInTestHarness()
  static Future<bool> get isRunningInTestHarness async {
    assert(Platform.isAndroid);
    return await _channel.invokeMethod('isRunningInTestHarness') as bool;
  }
}
