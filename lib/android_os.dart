/* This is free and unencumbered software released into the public domain. */

/// Provides basic operating system services, message passing, and
/// inter-process communication on the device.
///
/// See: https://developer.android.com/reference/android/os/package-summary
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
