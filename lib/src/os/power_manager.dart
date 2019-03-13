/* This is free and unencumbered software released into the public domain. */

/// This class gives you control of the power state of the device.
///
/// See: https://developer.android.com/reference/android/os/PowerManager
abstract class PowerManager {
  /// Wake lock level: Ensures that the CPU is running; the screen and keyboard backlight will be allowed to go off.
  ///
  /// See: https://developer.android.com/reference/android/os/PowerManager#PARTIAL_WAKE_LOCK
  static const int PARTIAL_WAKE_LOCK = 1;

  /// Wake lock level: Turns the screen off when the proximity sensor activates.
  ///
  /// See: https://developer.android.com/reference/android/os/PowerManager#PROXIMITY_SCREEN_OFF_WAKE_LOCK
  static const int PROXIMITY_SCREEN_OFF_WAKE_LOCK = 32;

  /// Wake lock flag: Turn the screen on when the wake lock is acquired.
  ///
  /// See: https://developer.android.com/reference/android/os/PowerManager#ACQUIRE_CAUSES_WAKEUP
  static const int ACQUIRE_CAUSES_WAKEUP = 268435456;

  /// Wake lock flag: When this wake lock is released, poke the user activity timer so the screen stays on for a little longer.
  ///
  /// See: https://developer.android.com/reference/android/os/PowerManager#ON_AFTER_RELEASE
  static const int ON_AFTER_RELEASE = 536870912;

  /// Flag for `WakeLock#release WakeLock.release(int)`: Defer releasing a `PROXIMITY_SCREEN_OFF_WAKE_LOCK` wake lock until the proximity sensor indicates that an object is not in close proximity.
  ///
  /// See: https://developer.android.com/reference/android/os/PowerManager#RELEASE_FLAG_WAIT_FOR_NO_PROXIMITY
  static const int RELEASE_FLAG_WAIT_FOR_NO_PROXIMITY = 1;

  /// Either the location providers shouldn't be affected by battery saver, or battery saver is off.
  ///
  /// See: https://developer.android.com/reference/android/os/PowerManager#LOCATION_MODE_NO_CHANGE
  static const int LOCATION_MODE_NO_CHANGE = 0;

  /// In this mode, the GPS based location provider should be disabled when battery saver is on and the device is non-interactive.
  ///
  /// See: https://developer.android.com/reference/android/os/PowerManager#LOCATION_MODE_GPS_DISABLED_WHEN_SCREEN_OFF
  static const int LOCATION_MODE_GPS_DISABLED_WHEN_SCREEN_OFF = 1;

  /// All location providers should be disabled when battery saver is on and the device is non-interactive.
  ///
  /// See: https://developer.android.com/reference/android/os/PowerManager#LOCATION_MODE_ALL_DISABLED_WHEN_SCREEN_OFF
  static const int LOCATION_MODE_ALL_DISABLED_WHEN_SCREEN_OFF = 2;

  /// In this mode, all the location providers will be kept available, but location fixes should only be provided to foreground apps.
  ///
  /// See: https://developer.android.com/reference/android/os/PowerManager#LOCATION_MODE_FOREGROUND_ONLY
  static const int LOCATION_MODE_FOREGROUND_ONLY = 3;

  /// Intent that is broadcast when the state of `isPowerSaveMode()` changes.
  ///
  /// See: https://developer.android.com/reference/android/os/PowerManager#ACTION_POWER_SAVE_MODE_CHANGED
  static const String ACTION_POWER_SAVE_MODE_CHANGED =
      "android.os.action.POWER_SAVE_MODE_CHANGED";

  /// Intent that is broadcast when the state of `isDeviceIdleMode()` changes.
  ///
  /// See: https://developer.android.com/reference/android/os/PowerManager#ACTION_DEVICE_IDLE_MODE_CHANGED
  static const String ACTION_DEVICE_IDLE_MODE_CHANGED =
      "android.os.action.DEVICE_IDLE_MODE_CHANGED";
}
