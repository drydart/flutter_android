/* This is free and unencumbered software released into the public domain. */

import 'package:platform/platform.dart' show Platform, LocalPlatform;

const Platform _platform = LocalPlatform();

/// Manages users and user details on a multi-user system.
///
/// See: https://developer.android.com/reference/android/os/UserManager
abstract class UserManager {

  /// Returns whether this device supports multiple users with their own login
  /// and customizable space.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager.html#supportsMultipleUsers()
  static Future<bool> supportsMultipleUsers() {
    assert(_platform.isAndroid);
    return null; // TODO
  }
}
