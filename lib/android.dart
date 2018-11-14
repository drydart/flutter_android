/* This is free and unencumbered software released into the public domain. */

/// Android bindings for Flutter.
library android;

import 'dart:async' show Future;

import 'package:flutter/services.dart' show MethodChannel;
import 'package:platform/platform.dart' show Platform, LocalPlatform;

export 'android_app.dart';
export 'android_bluetooth.dart';
export 'android_content.dart';
export 'android_database.dart';
export 'android_hardware.dart';
export 'android_location.dart';
export 'android_media.dart';
export 'android_net.dart';
export 'android_nfc.dart';
export 'android_os.dart';
export 'android_provider.dart';
export 'android_security.dart';
export 'android_speech.dart';
export 'android_telephony.dart';
export 'android_view.dart';

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
