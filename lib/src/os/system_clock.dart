/* This is free and unencumbered software released into the public domain. */

/// Core timekeeping facilities.
///
/// See: https://developer.android.com/reference/android/os/SystemClock
abstract class SystemClock {
  /// Returns milliseconds running in the current thread.
  ///
  /// See: https://developer.android.com/reference/android/os/SystemClock#currentThreadTimeMillis()
  int get currentThreadTimeMillis {
    return null; // TODO
  }

  /// Returns milliseconds since boot, including time spent in sleep.
  ///
  /// See: https://developer.android.com/reference/android/os/SystemClock#elapsedRealtime()
  int get elapsedRealtime {
    return null; // TODO
  }

  /// Returns nanoseconds since boot, including time spent in sleep.
  ///
  /// See: https://developer.android.com/reference/android/os/SystemClock#elapsedRealtimeNanos()
  int get elapsedRealtimeNanos {
    return null; // TODO
  }

  /// Sets the current wall time, in milliseconds.
  ///
  /// Requires the calling process to have appropriate permissions.
  ///
  /// See: https://developer.android.com/reference/android/os/SystemClock#setCurrentTimeMillis(long)
  set currentThreadTimeMillis(final int millis) {
    return null; // TODO
  }

  /// Waits a given number of milliseconds (of [uptimeMillis]) before returning.
  ///
  /// See: https://developer.android.com/reference/android/os/SystemClock#sleep(long)
  void sleep(final int ms) {
    return null; // TODO
  }

  /// Returns milliseconds since boot, not counting time spent in deep sleep.
  ///
  /// See: https://developer.android.com/reference/android/os/SystemClock#uptimeMillis()
  int get uptimeMillis {
    return null; // TODO
  }
}
