/* This is free and unencumbered software released into the public domain. */

import 'dart:async' show Future;

/// Tools for managing OS processes.
///
/// See: https://developer.android.com/reference/android/os/Process
abstract class Process {
  /// Defines the UID/GID under which system code runs.
  ///
  /// See: https://developer.android.com/reference/android/os/Process#SYSTEM_UID
  static const int SYSTEM_UID = 1000;

  /// Defines the UID/GID under which the telephony code runs.
  ///
  /// See: https://developer.android.com/reference/android/os/Process#PHONE_UID
  static const int PHONE_UID = 1001;

  /// Defines the start of a range of UIDs (and GIDs), going from this number to
  /// `LAST_APPLICATION_UID` that are reserved for assigning to applications.
  ///
  /// See: https://developer.android.com/reference/android/os/Process#FIRST_APPLICATION_UID
  static const int FIRST_APPLICATION_UID = 10000;

  /// Last of application-specific UIDs starting at `FIRST_APPLICATION_UID`.
  ///
  /// See: https://developer.android.com/reference/android/os/Process#LAST_APPLICATION_UID
  static const int LAST_APPLICATION_UID = 19999;

  /// Standard priority of application threads.
  ///
  /// See: https://developer.android.com/reference/android/os/Process#THREAD_PRIORITY_DEFAULT
  static const int THREAD_PRIORITY_DEFAULT = 0;

  /// Lowest available thread priority.
  ///
  /// See: https://developer.android.com/reference/android/os/Process#THREAD_PRIORITY_LOWEST
  static const int THREAD_PRIORITY_LOWEST = 19;

  /// Standard priority background threads.
  ///
  /// See: https://developer.android.com/reference/android/os/Process#THREAD_PRIORITY_BACKGROUND
  static const int THREAD_PRIORITY_BACKGROUND = 10;

  /// Standard priority of threads that are currently running a user interface that the user is interacting with.
  ///
  /// See: https://developer.android.com/reference/android/os/Process#THREAD_PRIORITY_FOREGROUND
  static const int THREAD_PRIORITY_FOREGROUND = -2;

  /// Standard priority of system display threads, involved in updating the user interface.
  ///
  /// See: https://developer.android.com/reference/android/os/Process#THREAD_PRIORITY_DISPLAY
  static const int THREAD_PRIORITY_DISPLAY = -4;

  /// Standard priority of the most important display threads, for compositing the screen and retrieving input events.
  ///
  /// See: https://developer.android.com/reference/android/os/Process#THREAD_PRIORITY_URGENT_DISPLAY
  static const int THREAD_PRIORITY_URGENT_DISPLAY = -8;

  /// Standard priority of video threads.
  ///
  /// See: https://developer.android.com/reference/android/os/Process#THREAD_PRIORITY_VIDEO
  static const int THREAD_PRIORITY_VIDEO = -10;

  /// Standard priority of audio threads.
  ///
  /// See: https://developer.android.com/reference/android/os/Process#THREAD_PRIORITY_AUDIO
  static const int THREAD_PRIORITY_AUDIO = -16;

  /// Standard priority of the most important audio threads.
  ///
  /// See: https://developer.android.com/reference/android/os/Process#THREAD_PRIORITY_URGENT_AUDIO
  static const int THREAD_PRIORITY_URGENT_AUDIO = -19;

  /// Minimum increment to make a priority more favorable.
  ///
  /// See: https://developer.android.com/reference/android/os/Process#THREAD_PRIORITY_MORE_FAVORABLE
  static const int THREAD_PRIORITY_MORE_FAVORABLE = -1;

  /// Minimum increment to make a priority less favorable.
  ///
  /// See: https://developer.android.com/reference/android/os/Process#THREAD_PRIORITY_LESS_FAVORABLE
  static const int THREAD_PRIORITY_LESS_FAVORABLE = 1;

  /// See: https://developer.android.com/reference/android/os/Process#SIGNAL_QUIT
  static const int SIGNAL_QUIT = 3;

  /// See: https://developer.android.com/reference/android/os/Process#SIGNAL_KILL
  static const int SIGNAL_KILL = 9;

  /// See: https://developer.android.com/reference/android/os/Process#SIGNAL_USR1
  static const int SIGNAL_USR1 = 10;

  /// Returns whether the current process is a 64-bit runtime.
  ///
  /// See: https://developer.android.com/reference/android/os/Process#is64Bit()
  static Future<bool> get is64Bit {
    return null; // TODO
  }

  /// Returns whether the current process is in an isolated sandbox.
  ///
  /// See: https://developer.android.com/reference/android/os/Process#isIsolated()
  static Future<bool> get isIsolated {
    return null; // TODO
  }
}
