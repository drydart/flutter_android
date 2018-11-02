/* This is free and unencumbered software released into the public domain. */

import 'dart:async';

import 'package:flutter/services.dart';

class FlutterAndroid {
  static const MethodChannel _channel =
      const MethodChannel('flutter_android');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
