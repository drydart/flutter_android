/* This is free and unencumbered software released into the public domain. */

import 'dart:async' show Future;
import 'dart:io' show Directory, File;

import 'package:flutter/services.dart' show MethodChannel;
import 'package:platform/platform.dart' show Platform, LocalPlatform;

import '../app/activity_manager.dart' show ActivityManager;
import '../app/alarm_manager.dart' show AlarmManager;
import '../app/download_manager.dart' show DownloadManager;
import '../app/keyguard_manager.dart' show KeyguardManager;
import '../app/notification_manager.dart' show NotificationManager;
import '../app/search_manager.dart' show SearchManager;
import '../app/wallpaper_manager.dart' show WallpaperManager;

import '../os/battery_manager.dart' show BatteryManager;
import '../os/hardware_properties_manager.dart' show HardwarePropertiesManager;
import '../os/power_manager.dart' show PowerManager;
import '../os/user_manager.dart' show UserManager;
import '../os/vibrator.dart' show Vibrator;

import 'shared_preferences.dart' show SharedPreferences;

const Platform _platform = LocalPlatform();

/// Interface to global information about an application environment.
///
/// This is an abstract class whose implementation is provided by the Android
/// system. It allows access to application-specific resources and classes, as
/// well as up-calls for application-level operations such as launching
/// activities, broadcasting and receiving intents, etc.
///
/// See: https://developer.android.com/reference/android/content/Context
abstract class Context {
  static const MethodChannel _channel = MethodChannel('flutter_android/Context');

  /// See: https://developer.android.com/reference/android/content/Context#ACCESSIBILITY_SERVICE
  static const String ACCESSIBILITY_SERVICE = "accessibility";

  /// See: https://developer.android.com/reference/android/content/Context#ACCOUNT_SERVICE
  static const String ACCOUNT_SERVICE = "account";

  /// See: https://developer.android.com/reference/android/content/Context#ACTIVITY_SERVICE
  static const String ACTIVITY_SERVICE = "activity";

  /// See: https://developer.android.com/reference/android/content/Context#ALARM_SERVICE
  static const String ALARM_SERVICE = "alarm";

  /// See: https://developer.android.com/reference/android/content/Context#APPWIDGET_SERVICE
  static const String APPWIDGET_SERVICE = "appwidget";

  /// See: https://developer.android.com/reference/android/content/Context#APP_OPS_SERVICE
  static const String APP_OPS_SERVICE = "appops";

  /// See: https://developer.android.com/reference/android/content/Context#AUDIO_SERVICE
  static const String AUDIO_SERVICE = "audio";

  /// See: https://developer.android.com/reference/android/content/Context#BATTERY_SERVICE
  static const String BATTERY_SERVICE = "batterymanager";

  /// See: https://developer.android.com/reference/android/content/Context#BLUETOOTH_SERVICE
  static const String BLUETOOTH_SERVICE = "bluetooth";

  /// See: https://developer.android.com/reference/android/content/Context#CAMERA_SERVICE
  static const String CAMERA_SERVICE = "camera";

  /// See: https://developer.android.com/reference/android/content/Context#CAPTIONING_SERVICE
  static const String CAPTIONING_SERVICE = "captioning";

  /// See: https://developer.android.com/reference/android/content/Context#CARRIER_CONFIG_SERVICE
  static const String CARRIER_CONFIG_SERVICE = "carrier_config";

  /// See: https://developer.android.com/reference/android/content/Context#CLIPBOARD_SERVICE
  static const String CLIPBOARD_SERVICE = "clipboard";

  /// See: https://developer.android.com/reference/android/content/Context#COMPANION_DEVICE_SERVICE
  static const String COMPANION_DEVICE_SERVICE = "companiondevice";

  /// See: https://developer.android.com/reference/android/content/Context#CONNECTIVITY_SERVICE
  static const String CONNECTIVITY_SERVICE = "connectivity";

  /// See: https://developer.android.com/reference/android/content/Context#CONSUMER_IR_SERVICE
  static const String CONSUMER_IR_SERVICE = "consumer_ir";

  /// See: https://developer.android.com/reference/android/content/Context#CROSS_PROFILE_APPS_SERVICE
  static const String CROSS_PROFILE_APPS_SERVICE = "crossprofileapps";

  /// See: https://developer.android.com/reference/android/content/Context#DEVICE_POLICY_SERVICE
  static const String DEVICE_POLICY_SERVICE = "device_policy";

  /// See: https://developer.android.com/reference/android/content/Context#DISPLAY_SERVICE
  static const String DISPLAY_SERVICE = "display";

  /// See: https://developer.android.com/reference/android/content/Context#DOWNLOAD_SERVICE
  static const String DOWNLOAD_SERVICE = "download";

  /// See: https://developer.android.com/reference/android/content/Context#DROPBOX_SERVICE
  static const String DROPBOX_SERVICE = "dropbox";

  /// See: https://developer.android.com/reference/android/content/Context#EUICC_SERVICE
  static const String EUICC_SERVICE = "euicc";

  /// See: https://developer.android.com/reference/android/content/Context#FINGERPRINT_SERVICE
  static const String FINGERPRINT_SERVICE = "fingerprint";

  /// See: https://developer.android.com/reference/android/content/Context#HARDWARE_PROPERTIES_SERVICE
  static const String HARDWARE_PROPERTIES_SERVICE = "hardware_properties";

  /// See: https://developer.android.com/reference/android/content/Context#INPUT_METHOD_SERVICE
  static const String INPUT_METHOD_SERVICE = "input_method";

  /// See: https://developer.android.com/reference/android/content/Context#INPUT_SERVICE
  static const String INPUT_SERVICE = "input";

  /// See: https://developer.android.com/reference/android/content/Context#IPSEC_SERVICE
  static const String IPSEC_SERVICE = "ipsec";

  /// See: https://developer.android.com/reference/android/content/Context#JOB_SCHEDULER_SERVICE
  static const String JOB_SCHEDULER_SERVICE = "jobscheduler";

  /// See: https://developer.android.com/reference/android/content/Context#KEYGUARD_SERVICE
  static const String KEYGUARD_SERVICE = "keyguard";

  /// See: https://developer.android.com/reference/android/content/Context#LAUNCHER_APPS_SERVICE
  static const String LAUNCHER_APPS_SERVICE = "launcherapps";

  /// See: https://developer.android.com/reference/android/content/Context#LAYOUT_INFLATER_SERVICE
  static const String LAYOUT_INFLATER_SERVICE = "layout_inflater";

  /// See: https://developer.android.com/reference/android/content/Context#LOCATION_SERVICE
  static const String LOCATION_SERVICE = "location";

  /// See: https://developer.android.com/reference/android/content/Context#MEDIA_PROJECTION_SERVICE
  static const String MEDIA_PROJECTION_SERVICE = "media_projection";

  /// See: https://developer.android.com/reference/android/content/Context#MEDIA_ROUTER_SERVICE
  static const String MEDIA_ROUTER_SERVICE = "media_router";

  /// See: https://developer.android.com/reference/android/content/Context#MEDIA_SESSION_SERVICE
  static const String MEDIA_SESSION_SERVICE = "media_session";

  /// See: https://developer.android.com/reference/android/content/Context#MIDI_SERVICE
  static const String MIDI_SERVICE = "midi";

  /// See: https://developer.android.com/reference/android/content/Context#NETWORK_STATS_SERVICE
  static const String NETWORK_STATS_SERVICE = "netstats";

  /// See: https://developer.android.com/reference/android/content/Context#NFC_SERVICE
  static const String NFC_SERVICE = "nfc";

  /// See: https://developer.android.com/reference/android/content/Context#NOTIFICATION_SERVICE
  static const String NOTIFICATION_SERVICE = "notification";

  /// See: https://developer.android.com/reference/android/content/Context#NSD_SERVICE
  static const String NSD_SERVICE = "servicediscovery";

  /// See: https://developer.android.com/reference/android/content/Context#POWER_SERVICE
  static const String POWER_SERVICE = "power";

  /// See: https://developer.android.com/reference/android/content/Context#PRINT_SERVICE
  static const String PRINT_SERVICE = "print";

  /// See: https://developer.android.com/reference/android/content/Context#RESTRICTIONS_SERVICE
  static const String RESTRICTIONS_SERVICE = "restrictions";

  /// See: https://developer.android.com/reference/android/content/Context#SEARCH_SERVICE
  static const String SEARCH_SERVICE = "search";

  /// See: https://developer.android.com/reference/android/content/Context#SENSOR_SERVICE
  static const String SENSOR_SERVICE = "sensor";

  /// See: https://developer.android.com/reference/android/content/Context#SHORTCUT_SERVICE
  static const String SHORTCUT_SERVICE = "shortcut";

  /// See: https://developer.android.com/reference/android/content/Context#STORAGE_SERVICE
  static const String STORAGE_SERVICE = "storage";

  /// See: https://developer.android.com/reference/android/content/Context#STORAGE_STATS_SERVICE
  static const String STORAGE_STATS_SERVICE = "storagestats";

  /// See: https://developer.android.com/reference/android/content/Context#SYSTEM_HEALTH_SERVICE
  static const String SYSTEM_HEALTH_SERVICE = "systemhealth";

  /// See: https://developer.android.com/reference/android/content/Context#TELECOM_SERVICE
  static const String TELECOM_SERVICE = "telecom";

  /// See: https://developer.android.com/reference/android/content/Context#TELEPHONY_SERVICE
  static const String TELEPHONY_SERVICE = "phone";

  /// See: https://developer.android.com/reference/android/content/Context#TELEPHONY_SUBSCRIPTION_SERVICE
  static const String TELEPHONY_SUBSCRIPTION_SERVICE = "telephony_subscription_service";

  /// See: https://developer.android.com/reference/android/content/Context#TEXT_CLASSIFICATION_SERVICE
  static const String TEXT_CLASSIFICATION_SERVICE = "textclassification";

  /// See: https://developer.android.com/reference/android/content/Context#TEXT_SERVICES_MANAGER_SERVICE
  static const String TEXT_SERVICES_MANAGER_SERVICE = "textservices";

  /// See: https://developer.android.com/reference/android/content/Context#TV_INPUT_SERVICE
  static const String TV_INPUT_SERVICE = "tv_input";

  /// See: https://developer.android.com/reference/android/content/Context#UI_MODE_SERVICE
  static const String UI_MODE_SERVICE = "uimode";

  /// See: https://developer.android.com/reference/android/content/Context#USAGE_STATS_SERVICE
  static const String USAGE_STATS_SERVICE = "usagestats";

  /// See: https://developer.android.com/reference/android/content/Context#USB_SERVICE
  static const String USB_SERVICE = "usb";

  /// See: https://developer.android.com/reference/android/content/Context#USER_SERVICE
  static const String USER_SERVICE = "user";

  /// See: https://developer.android.com/reference/android/content/Context#VIBRATOR_SERVICE
  static const String VIBRATOR_SERVICE = "vibrator";

  /// See: https://developer.android.com/reference/android/content/Context#WALLPAPER_SERVICE
  static const String WALLPAPER_SERVICE = "wallpaper";

  /// See: https://developer.android.com/reference/android/content/Context#WIFI_AWARE_SERVICE
  static const String WIFI_AWARE_SERVICE = "wifiaware";

  /// See: https://developer.android.com/reference/android/content/Context#WIFI_P2P_SERVICE
  static const String WIFI_P2P_SERVICE = "wifip2p";

  /// See: https://developer.android.com/reference/android/content/Context#WIFI_RTT_RANGING_SERVICE
  static const String WIFI_RTT_RANGING_SERVICE = "wifirtt";

  /// See: https://developer.android.com/reference/android/content/Context#WIFI_SERVICE
  static const String WIFI_SERVICE = "wifi";

  /// See: https://developer.android.com/reference/android/content/Context#WINDOW_SERVICE
  static const String WINDOW_SERVICE = "window";

  /// Returns the handle to a system-level service by name.
  ///
  /// The class of the returned object varies by the requested name.
  /// Returns the service or `null` if the name does not exist.
  ///
  /// See: https://developer.android.com/reference/android/content/Context.html#getSystemService(java.lang.String)
  static dynamic getSystemService(final String name) {
    assert(_platform.isAndroid);
    switch (name) {
      case ACTIVITY_SERVICE:
        return ActivityManager();
      case ALARM_SERVICE:
        return AlarmManager();
      case BATTERY_SERVICE:
        return BatteryManager();
      case DOWNLOAD_SERVICE:
        return DownloadManager();
      case HARDWARE_PROPERTIES_SERVICE:
        return HardwarePropertiesManager();
      case KEYGUARD_SERVICE:
        return KeyguardManager();
      case NOTIFICATION_SERVICE:
        return NotificationManager();
      case POWER_SERVICE:
        return PowerManager();
      case SEARCH_SERVICE:
        return SearchManager();
      case USER_SERVICE:
        return UserManager();
      case VIBRATOR_SERVICE:
        return Vibrator();
      case WALLPAPER_SERVICE:
        return WallpaperManager();
      default:
        return null; // unknown service
    }
  }

  /// Returns the absolute path to the application specific cache directory on
  /// the filesystem.
  ///
  /// See: https://developer.android.com/reference/android/content/Context.html#getCacheDir()
  static Future<Directory> get cacheDir async {
    assert(_platform.isAndroid);
    return Directory(await _channel.invokeMethod('getCacheDir') as String);
  }

  /// Returns the absolute path to the application specific cache directory on
  /// the filesystem designed for storing cached code.
  ///
  /// See: https://developer.android.com/reference/android/content/Context#getCodeCacheDir()
  static Future<Directory> get codeCacheDir async {
    assert(_platform.isAndroid);
    return Directory(await _channel.invokeMethod('getCodeCacheDir') as String);
  }

  /// Returns the absolute path to the directory on the filesystem where all
  /// private files belonging to this app are stored.
  ///
  /// See: https://developer.android.com/reference/android/content/Context.html#getDataDir()
  static Future<Directory> get dataDir async {
    assert(_platform.isAndroid);
    return Directory(await _channel.invokeMethod('getDataDir') as String);
  }

  /// Returns absolute path to application-specific directory on the primary
  /// shared/external storage device where the application can place cache files
  /// it owns. These files are internal to the application, and not typically
  /// visible to the user as media.
  ///
  /// See: https://developer.android.com/reference/android/content/Context#getExternalCacheDir()
  static Future<Directory> get externalCacheDir async {
    assert(_platform.isAndroid);
    return Directory(await _channel.invokeMethod('getExternalCacheDir') as String);
  }

  /// Returns the absolute path to the directory on the primary shared/external
  /// storage device where the application can place persistent files it owns.
  /// These files are internal to the applications, and not typically visible to
  /// the user as media.
  ///
  /// See: https://developer.android.com/reference/android/content/Context#getExternalFilesDir(java.lang.String)
  static Future<Directory> get externalFilesDir async {
    assert(_platform.isAndroid);
    return Directory(await _channel.invokeMethod('getExternalFilesDir') as String);
  }

  /// Returns the absolute path to the directory on the filesystem where files
  /// created with `openFileOutput(String, int)` are stored.
  ///
  /// See: https://developer.android.com/reference/android/content/Context#getFilesDir()
  static Future<Directory> get filesDir async {
    assert(_platform.isAndroid);
    return Directory(await _channel.invokeMethod('getFilesDir') as String);
  }

  /// Returns the absolute path to the directory where files placed under this
  /// directory will be excluded from automatic backup to remote storage.
  ///
  /// See: https://developer.android.com/reference/android/content/Context#getNoBackupFilesDir()
  static Future<Directory> get noBackupFilesDir async {
    assert(_platform.isAndroid);
    return Directory(await _channel.invokeMethod('getNoBackupFilesDir') as String);
  }

  /// Return the full path to this context's primary Android package. The
  /// Android package is a ZIP file which contains application's primary code
  /// and assets.
  ///
  /// See: https://developer.android.com/reference/android/content/Context#getPackageCodePath()
  static Future<File> get packageCodePath async {
    assert(_platform.isAndroid);
    return File(await _channel.invokeMethod('getPackageCodePath') as String);
  }

  /// Return the name of this application's package.
  ///
  /// See: https://developer.android.com/reference/android/content/Context#getPackageName()
  static Future<String> get packageName async {
    assert(_platform.isAndroid);
    return await _channel.invokeMethod('getPackageName') as String;
  }

  /// Return the full path to this context's primary Android package. The
  /// Android package is a ZIP file which contains the application's primary
  /// resources.
  ///
  /// See: https://developer.android.com/reference/android/content/Context#getPackageResourcePath()
  static Future<File> get packageResourcePath async {
    assert(_platform.isAndroid);
    return File(await _channel.invokeMethod('getPackageResourcePath') as String);
  }

  /// Retrieves and holds the contents of the preferences file `name`, returning
  /// a [SharedPreferences] through which you can retrieve and modify its
  /// values.
  ///
  /// For compatibility with the `shared_preferences` Flutter plugin, use the name
  /// "FlutterSharedPreferences".
  ///
  /// See: https://developer.android.com/reference/android/content/Context#getSharedPreferences(java.lang.String,%20int)
  static Future<SharedPreferences> getSharedPreferences(final String name, [final int mode = 0]) {
    return SharedPreferences.open(name, mode);
  }
}
