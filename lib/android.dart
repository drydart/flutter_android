/* This is free and unencumbered software released into the public domain. */

/// Android bindings for Flutter.
library android;

import 'dart:async' show Future;

import 'package:flutter/services.dart' show MethodChannel;
import 'package:platform/platform.dart' show Platform, LocalPlatform;

export 'android_app.dart';
export 'android_content.dart';
export 'android_os.dart';

const Platform _platform = LocalPlatform();

/// Android metadata.
abstract class Android {
  static const MethodChannel _channel = MethodChannel('flutter_android/Android');

  /// Returns the Android platform version.
  static Future<String> get platformVersion async {
    assert(_platform.isAndroid);
    return await _channel.invokeMethod('getPlatformVersion');
  }
}
