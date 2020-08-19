/* This is free and unencumbered software released into the public domain. */

import 'dart:io' show Platform;

/// Manages users and user details on a multi-user system.
///
/// See: https://developer.android.com/reference/android/os/UserManager
class UserManager {
  /// Specifies if a user is disallowed from adding and removing accounts.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#DISALLOW_MODIFY_ACCOUNTS
  static const String DISALLOW_MODIFY_ACCOUNTS = "no_modify_accounts";

  /// Specifies if a user is disallowed from changing Wi-Fi access points.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#DISALLOW_CONFIG_WIFI
  static const String DISALLOW_CONFIG_WIFI = "no_config_wifi";

  /// Specifies if a user is disallowed from changing the device language.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#DISALLOW_CONFIG_LOCALE
  static const String DISALLOW_CONFIG_LOCALE = "no_config_locale";

  /// Specifies if a user is disallowed from installing applications.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#DISALLOW_INSTALL_APPS
  static const String DISALLOW_INSTALL_APPS = "no_install_apps";

  /// Specifies if a user is disallowed from uninstalling applications.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#DISALLOW_UNINSTALL_APPS
  static const String DISALLOW_UNINSTALL_APPS = "no_uninstall_apps";

  /// Specifies if a user is disallowed from turning on location sharing.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#DISALLOW_SHARE_LOCATION
  static const String DISALLOW_SHARE_LOCATION = "no_share_location";

  /// Specifies if airplane mode is disallowed on the device.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#DISALLOW_AIRPLANE_MODE
  static const String DISALLOW_AIRPLANE_MODE = "no_airplane_mode";

  /// Specifies if a user is disallowed from configuring brightness.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#DISALLOW_CONFIG_BRIGHTNESS
  static const String DISALLOW_CONFIG_BRIGHTNESS = "no_config_brightness";

  /// Specifies if ambient display is disallowed for the user.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#DISALLOW_AMBIENT_DISPLAY
  static const String DISALLOW_AMBIENT_DISPLAY = "no_ambient_display";

  /// Specifies if a user is disallowed from changing screen off timeout.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#DISALLOW_CONFIG_SCREEN_TIMEOUT
  static const String DISALLOW_CONFIG_SCREEN_TIMEOUT =
      "no_config_screen_timeout";

  /// Specifies if a user is disallowed from enabling the "Unknown Sources" setting, that allows installation of apps from unknown sources.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#DISALLOW_INSTALL_UNKNOWN_SOURCES
  static const String DISALLOW_INSTALL_UNKNOWN_SOURCES =
      "no_install_unknown_sources";

  /// Specifies if a user is disallowed from configuring bluetooth.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#DISALLOW_CONFIG_BLUETOOTH
  static const String DISALLOW_CONFIG_BLUETOOTH = "no_config_bluetooth";

  /// Specifies if bluetooth is disallowed on the device.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#DISALLOW_BLUETOOTH
  static const String DISALLOW_BLUETOOTH = "no_bluetooth";

  /// Specifies if outgoing bluetooth sharing is disallowed on the device.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#DISALLOW_BLUETOOTH_SHARING
  static const String DISALLOW_BLUETOOTH_SHARING = "no_bluetooth_sharing";

  /// Specifies if a user is disallowed from transferring files over USB.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#DISALLOW_USB_FILE_TRANSFER
  static const String DISALLOW_USB_FILE_TRANSFER = "no_usb_file_transfer";

  /// Specifies if a user is disallowed from configuring user credentials.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#DISALLOW_CONFIG_CREDENTIALS
  static const String DISALLOW_CONFIG_CREDENTIALS = "no_config_credentials";

  /// When set on the primary user this specifies if the user can remove other users.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#DISALLOW_REMOVE_USER
  static const String DISALLOW_REMOVE_USER = "no_remove_user";

  /// Specifies if managed profiles of this user can be removed, other than by its profile owner.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#DISALLOW_REMOVE_MANAGED_PROFILE
  static const String DISALLOW_REMOVE_MANAGED_PROFILE =
      "no_remove_managed_profile";

  /// Specifies if a user is disallowed from enabling or accessing debugging features.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#DISALLOW_DEBUGGING_FEATURES
  static const String DISALLOW_DEBUGGING_FEATURES = "no_debugging_features";

  /// Specifies if a user is disallowed from configuring a VPN.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#DISALLOW_CONFIG_VPN
  static const String DISALLOW_CONFIG_VPN = "no_config_vpn";

  /// Specifies if a user is disallowed from enabling or disabling location providers.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#DISALLOW_CONFIG_LOCATION
  static const String DISALLOW_CONFIG_LOCATION = "no_config_location";

  /// Specifies if date, time and timezone configuring is disallowed.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#DISALLOW_CONFIG_DATE_TIME
  static const String DISALLOW_CONFIG_DATE_TIME = "no_config_date_time";

  /// Specifies if a user is disallowed from configuring Tethering & portable hotspots.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#DISALLOW_CONFIG_TETHERING
  static const String DISALLOW_CONFIG_TETHERING = "no_config_tethering";

  /// Specifies if a user is disallowed from resetting network settings from Settings.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#DISALLOW_NETWORK_RESET
  static const String DISALLOW_NETWORK_RESET = "no_network_reset";

  /// Specifies if a user is disallowed from factory resetting from Settings.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#DISALLOW_FACTORY_RESET
  static const String DISALLOW_FACTORY_RESET = "no_factory_reset";

  /// Specifies if a user is disallowed from adding new users.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#DISALLOW_ADD_USER
  static const String DISALLOW_ADD_USER = "no_add_user";

  /// Specifies if a user is disallowed from adding managed profiles.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#DISALLOW_ADD_MANAGED_PROFILE
  static const String DISALLOW_ADD_MANAGED_PROFILE = "no_add_managed_profile";

  /// Specifies if a user is disallowed from disabling application verification.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#ENSURE_VERIFY_APPS
  static const String ENSURE_VERIFY_APPS = "ensure_verify_apps";

  /// Specifies if a user is disallowed from configuring cell broadcasts.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#DISALLOW_CONFIG_CELL_BROADCASTS
  static const String DISALLOW_CONFIG_CELL_BROADCASTS =
      "no_config_cell_broadcasts";

  /// Specifies if a user is disallowed from configuring mobile networks.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#DISALLOW_CONFIG_MOBILE_NETWORKS
  static const String DISALLOW_CONFIG_MOBILE_NETWORKS =
      "no_config_mobile_networks";

  /// Specifies if a user is disallowed from modifying applications in Settings or launchers.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#DISALLOW_APPS_CONTROL
  static const String DISALLOW_APPS_CONTROL = "no_control_apps";

  /// Specifies if a user is disallowed from mounting physical external media.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#DISALLOW_MOUNT_PHYSICAL_MEDIA
  static const String DISALLOW_MOUNT_PHYSICAL_MEDIA = "no_physical_media";

  /// Specifies if a user is disallowed from adjusting microphone volume.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#DISALLOW_UNMUTE_MICROPHONE
  static const String DISALLOW_UNMUTE_MICROPHONE = "no_unmute_microphone";

  /// Specifies if a user is disallowed from adjusting the master volume.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#DISALLOW_ADJUST_VOLUME
  static const String DISALLOW_ADJUST_VOLUME = "no_adjust_volume";

  /// Specifies that the user is not allowed to make outgoing phone calls.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#DISALLOW_OUTGOING_CALLS
  static const String DISALLOW_OUTGOING_CALLS = "no_outgoing_calls";

  /// Specifies that the user is not allowed to send or receive SMS messages.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#DISALLOW_SMS
  static const String DISALLOW_SMS = "no_sms";

  /// Specifies if the user is not allowed to have fun.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#DISALLOW_FUN
  static const String DISALLOW_FUN = "no_fun";

  /// Specifies that windows besides app windows should not be created.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#DISALLOW_CREATE_WINDOWS
  static const String DISALLOW_CREATE_WINDOWS = "no_create_windows";

  /// Specifies that system error dialogs for crashed or unresponsive apps should not be shown.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#DISALLOW_SYSTEM_ERROR_DIALOGS
  static const String DISALLOW_SYSTEM_ERROR_DIALOGS = "no_system_error_dialogs";

  /// Specifies if what is copied in the clipboard of this profile can be pasted in related profiles.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#DISALLOW_CROSS_PROFILE_COPY_PASTE
  static const String DISALLOW_CROSS_PROFILE_COPY_PASTE =
      "no_cross_profile_copy_paste";

  /// Specifies if the user is not allowed to use NFC to beam out data from apps.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#DISALLOW_OUTGOING_BEAM
  static const String DISALLOW_OUTGOING_BEAM = "no_outgoing_beam";

  /// User restriction to disallow setting a wallpaper.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#DISALLOW_SET_WALLPAPER
  static const String DISALLOW_SET_WALLPAPER = "no_set_wallpaper";

  /// Specifies if the user is not allowed to reboot the device into safe boot mode.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#DISALLOW_SAFE_BOOT
  static const String DISALLOW_SAFE_BOOT = "no_safe_boot";

  /// Specifies if a user is not allowed to use cellular data when roaming.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#DISALLOW_DATA_ROAMING
  static const String DISALLOW_DATA_ROAMING = "no_data_roaming";

  /// Specifies if a user is not allowed to change their icon.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#DISALLOW_SET_USER_ICON
  static const String DISALLOW_SET_USER_ICON = "no_set_user_icon";

  /// Specifies that the managed profile is not allowed to have unified lock screen challenge with the primary user.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#DISALLOW_UNIFIED_PASSWORD
  static const String DISALLOW_UNIFIED_PASSWORD = "no_unified_password";

  /// Allows apps in the parent profile to handle web links from the managed profile.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#ALLOW_PARENT_PROFILE_APP_LINKING
  static const String ALLOW_PARENT_PROFILE_APP_LINKING =
      "allow_parent_profile_app_linking";

  /// Specifies if a user is not allowed to use Autofill Services.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#DISALLOW_AUTOFILL
  static const String DISALLOW_AUTOFILL = "no_autofill";

  /// Specifies if user switching is blocked on the current user.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#DISALLOW_USER_SWITCH
  static const String DISALLOW_USER_SWITCH = "no_user_switch";

  /// Specifies whether the user can share file / picture / data from the primary user into the managed profile, either by sending them from the primary side, or by picking up data within an app in the managed profile.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#DISALLOW_SHARE_INTO_MANAGED_PROFILE
  static const String DISALLOW_SHARE_INTO_MANAGED_PROFILE =
      "no_sharing_into_profile";

  /// Specifies whether the user is allowed to print.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#DISALLOW_PRINTING
  static const String DISALLOW_PRINTING = "no_printing";

  /// Application restriction key that is used to indicate the pending arrival of real restrictions for the app.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#KEY_RESTRICTIONS_PENDING
  static const String KEY_RESTRICTIONS_PENDING = "restrictions_pending";

  /// Error result indicating that this user is not allowed to add other users on this device.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#USER_CREATION_FAILED_NOT_PERMITTED
  static const int USER_CREATION_FAILED_NOT_PERMITTED = 1;

  /// Error result indicating that no more users can be created on this device.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#USER_CREATION_FAILED_NO_MORE_USERS
  static const int USER_CREATION_FAILED_NO_MORE_USERS = 2;

  /// Indicates user operation is successful.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#USER_OPERATION_SUCCESS
  static const int USER_OPERATION_SUCCESS = 0;

  /// Indicates user operation failed for unknown reason.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#USER_OPERATION_ERROR_UNKNOWN
  static const int USER_OPERATION_ERROR_UNKNOWN = 1;

  /// Indicates user operation failed because target user is a managed profile.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#USER_OPERATION_ERROR_MANAGED_PROFILE
  static const int USER_OPERATION_ERROR_MANAGED_PROFILE = 2;

  /// Indicates user operation failed because maximum running user limit has been reached.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#USER_OPERATION_ERROR_MAX_RUNNING_USERS
  static const int USER_OPERATION_ERROR_MAX_RUNNING_USERS = 3;

  /// Indicates user operation failed because the target user is in the foreground.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#USER_OPERATION_ERROR_CURRENT_USER
  static const int USER_OPERATION_ERROR_CURRENT_USER = 4;

  /// Indicates user operation failed because device has low data storage.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#USER_OPERATION_ERROR_LOW_STORAGE
  static const int USER_OPERATION_ERROR_LOW_STORAGE = 5;

  /// Indicates user operation failed because maximum user limit has been reached.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#USER_OPERATION_ERROR_MAX_USERS
  static const int USER_OPERATION_ERROR_MAX_USERS = 6;

  /// Returns whether this device supports multiple users with their own login
  /// and customizable space.
  ///
  /// See: https://developer.android.com/reference/android/os/UserManager#supportsMultipleUsers()
  static Future<bool> get supportsMultipleUsers {
    assert(Platform.isAndroid);
    return null; // TODO
  }
}
