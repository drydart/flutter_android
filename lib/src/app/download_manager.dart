/* This is free and unencumbered software released into the public domain. */

import 'dart:async' show Future;

import 'package:flutter/services.dart' show MethodChannel;
import 'package:platform/platform.dart' show Platform, LocalPlatform;

const Platform _platform = LocalPlatform();

/// The download manager is a system service that handles long-running HTTP
/// downloads.
///
/// See: https://developer.android.com/reference/android/app/DownloadManager
class DownloadManager {
  static const MethodChannel _channel =
      MethodChannel('flutter_android/DownloadManager');

  /// Returns maximum size, in bytes, of downloads that may go over a mobile
  /// connection; or `null` if there's no limit.
  ///
  /// See: https://developer.android.com/reference/android/app/DownloadManager#getMaxBytesOverMobile(android.content.Context)
  static Future<int> get maxBytesOverMobile async {
    assert(_platform.isAndroid);
    return await _channel.invokeMethod('getMaxBytesOverMobile')
        as int; // TODO: implement backend
  }

  /// Returns recommended maximum size, in bytes, of downloads that may go over
  /// a mobile connection; or `null` if there's no recommended limit. The user
  /// will have the option to bypass this limit.
  ///
  /// See: https://developer.android.com/reference/android/app/DownloadManager#getRecommendedMaxBytesOverMobile(android.content.Context)
  static Future<int> get recommendedMaxBytesOverMobile async {
    assert(_platform.isAndroid);
    return await _channel.invokeMethod('getRecommendedMaxBytesOverMobile')
        as int; // TODO: implement backend
  }
}
