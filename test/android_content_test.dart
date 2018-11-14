/* This is free and unencumbered software released into the public domain. */

import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_android/android_app.dart';
import 'package:flutter_android/android_content.dart' show Context;
import 'package:flutter_android/android_os.dart';

void main() {
  group("android_content", () {
    test("Context.getSystemService('') returns null", () {
      expect(Context.getSystemService(''), equals(null));
    });
    test("Context.getSystemService(Context.ACTIVITY_SERVICE) returns a ActivityManager", () {
      expect(Context.getSystemService(Context.ACTIVITY_SERVICE), isInstanceOf<ActivityManager>());
    });
    test("Context.getSystemService(Context.ALARM_SERVICE) returns a AlarmManager", () {
      expect(Context.getSystemService(Context.ALARM_SERVICE), isInstanceOf<AlarmManager>());
    });
    test("Context.getSystemService(Context.BATTERY_SERVICE) returns a BatteryManager", () {
      expect(Context.getSystemService(Context.BATTERY_SERVICE), isInstanceOf<BatteryManager>());
    });
    test("Context.getSystemService(Context.DOWNLOAD_SERVICE) returns a DownloadManager", () {
      expect(Context.getSystemService(Context.DOWNLOAD_SERVICE), isInstanceOf<DownloadManager>());
    });
    test("Context.getSystemService(Context.HARDWARE_PROPERTIES_SERVICE) returns a HardwarePropertiesManager", () {
      expect(Context.getSystemService(Context.HARDWARE_PROPERTIES_SERVICE), isInstanceOf<HardwarePropertiesManager>());
    });
    test("Context.getSystemService(Context.KEYGUARD_SERVICE) returns a KeyguardManager", () {
      expect(Context.getSystemService(Context.KEYGUARD_SERVICE), isInstanceOf<KeyguardManager>());
    });
    test("Context.getSystemService(Context.NOTIFICATION_SERVICE) returns a NotificationManager", () {
      expect(Context.getSystemService(Context.NOTIFICATION_SERVICE), isInstanceOf<NotificationManager>());
    });
    test("Context.getSystemService(Context.POWER_SERVICE) returns a PowerManager", () {
      expect(Context.getSystemService(Context.POWER_SERVICE), isInstanceOf<PowerManager>());
    });
    test("Context.getSystemService(Context.SEARCH_SERVICE) returns a SearchManager", () {
      expect(Context.getSystemService(Context.SEARCH_SERVICE), isInstanceOf<SearchManager>());
    });
    test("Context.getSystemService(Context.USER_SERVICE) returns a UserManager", () {
      expect(Context.getSystemService(Context.USER_SERVICE), isInstanceOf<UserManager>());
    });
    test("Context.getSystemService(Context.VIBRATOR_SERVICE) returns a Vibrator", () {
      expect(Context.getSystemService(Context.VIBRATOR_SERVICE), isInstanceOf<Vibrator>());
    });
    test("Context.getSystemService(Context.WALLPAPER_SERVICE) returns a WallpaperManager", () {
      expect(Context.getSystemService(Context.WALLPAPER_SERVICE), isInstanceOf<WallpaperManager>());
    });
  });
}
