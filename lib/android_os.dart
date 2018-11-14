/* This is free and unencumbered software released into the public domain. */

/// Provides basic operating system services, message passing, and
/// inter-process communication on the device.
///
/// See: https://developer.android.com/reference/android/os/package-summary
///
/// {@canonicalFor battery_manager.BatteryManager}
/// {@canonicalFor build.Build}
/// {@canonicalFor environment.Environment}
/// {@canonicalFor hardware_properties_manager.HardwarePropertiesManager}
/// {@canonicalFor parcel.Parcel}
/// {@canonicalFor parcelable.Parcelable}
/// {@canonicalFor power_manager.PowerManager}
/// {@canonicalFor process.Process}
/// {@canonicalFor stat_fs.StatFs}
/// {@canonicalFor system_clock.SystemClock}
/// {@canonicalFor user_manager.UserManager}
/// {@canonicalFor vibration_effect.VibrationEffect}
/// {@canonicalFor vibrator.Vibrator}
library android_os;

export 'src/os/battery_manager.dart' show BatteryManager;
export 'src/os/build.dart' show Build;
export 'src/os/environment.dart' show Environment;
export 'src/os/exceptions.dart';
export 'src/os/hardware_properties_manager.dart' show HardwarePropertiesManager;
export 'src/os/parcel.dart' show Parcel;
export 'src/os/parcelable.dart' show Parcelable;
export 'src/os/power_manager.dart' show PowerManager;
export 'src/os/process.dart' show Process;
export 'src/os/stat_fs.dart' show StatFs;
export 'src/os/system_clock.dart' show SystemClock;
export 'src/os/user_manager.dart' show UserManager;
export 'src/os/vibration_effect.dart' show VibrationEffect;
export 'src/os/vibrator.dart' show Vibrator;
