/* This is free and unencumbered software released into the public domain. */

import 'dart:async' show Future;

/// Tools for managing OS processes.
///
/// See: https://developer.android.com/reference/android/os/Process
abstract class Process {
  /// Defines the start of a range of UIDs (and GIDs), going from this number to
  /// [LAST_APPLICATION_UID] that are reserved for assigning to applications.
  ///
  /// See: https://developer.android.com/reference/android/os/Process.html#FIRST_APPLICATION_UID
  static const int FIRST_APPLICATION_UID = 10000;

  /// Last of application-specific UIDs starting at [FIRST_APPLICATION_UID].
  ///
  /// See: https://developer.android.com/reference/android/os/Process.html#LAST_APPLICATION_UID
  static const int LAST_APPLICATION_UID = 19999;

  /// Defines the UID/GID under which the telephony code runs.
  ///
  /// See: https://developer.android.com/reference/android/os/Process.html#PHONE_UID
  static const int PHONE_UID = 1001;

  // See: https://developer.android.com/reference/android/os/Process.html#SIGNAL_KILL
  static const int SIGNAL_KILL = 9;

  // See: https://developer.android.com/reference/android/os/Process.html#SIGNAL_QUIT
  static const int SIGNAL_QUIT = 3;

  // See: https://developer.android.com/reference/android/os/Process.html#SIGNAL_USR1
  static const int SIGNAL_USR1 = 10;

  /// Defines the UID/GID under which system code runs.
  ///
  /// See: https://developer.android.com/reference/android/os/Process.html#SYSTEM_UID
  static const int SYSTEM_UID = 1000;

  /// Returns whether the current process is a 64-bit runtime.
  ///
  /// See: https://developer.android.com/reference/android/os/Process.html#is64Bit()
  static Future<bool> get is64Bit {
    return null; // TODO
  }

  /// Returns whether the current process is in an isolated sandbox.
  ///
  /// See: https://developer.android.com/reference/android/os/Process.html#isIsolated()
  static Future<bool> get isIsolated {
    return null; // TODO
  }
}
