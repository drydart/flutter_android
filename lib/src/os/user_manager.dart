/* This is free and unencumbered software released into the public domain. */

import 'package:platform/platform.dart' show Platform, LocalPlatform;

const Platform _platform = LocalPlatform();

/// Manages users and user details on a multi-user system.
///
/// See: https://developer.android.com/reference/android/os/UserManager
class UserManager {
  /// Returns whether this device supports multiple users with their own login
  /// and customizable space.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#supportsMultipleUsers()
  static Future<bool> get supportsMultipleUsers {
    assert(_platform.isAndroid);
    return null; // TODO
  }
}
