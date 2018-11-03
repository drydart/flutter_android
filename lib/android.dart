/* This is free and unencumbered software released into the public domain. */

library android;

import 'dart:async';

import 'package:flutter/services.dart';

export 'android_content.dart';

/// Android metadata.
abstract class Android {
  static const MethodChannel _channel = MethodChannel('flutter_android/Android');

  /// Returns the Android platform version.
  static Future<String> get platformVersion async {
    return await _channel.invokeMethod('getPlatformVersion');
  }
}
