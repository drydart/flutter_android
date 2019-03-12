/* This is free and unencumbered software released into the public domain. */

//import 'package:flutter/services.dart' show MethodChannel;

/// Public API for controlling the Bluetooth Headset Service.
///
/// See: https://developer.android.com/reference/android/bluetooth/BluetoothHeadset
abstract class BluetoothHeadset {
  //static const MethodChannel _channel =
  //    MethodChannel('flutter_android/BluetoothHeadset');

  /// Intent used to broadcast the change in connection state of the Headset profile.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothHeadset#ACTION_CONNECTION_STATE_CHANGED
  static const String ACTION_CONNECTION_STATE_CHANGED =
      "android.bluetooth.headset.profile.action.CONNECTION_STATE_CHANGED";

  /// Intent used to broadcast the change in the Audio Connection state of the A2DP profile.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothHeadset#ACTION_AUDIO_STATE_CHANGED
  static const String ACTION_AUDIO_STATE_CHANGED =
      "android.bluetooth.headset.profile.action.AUDIO_STATE_CHANGED";

  /// Intent used to broadcast that the headset has posted a vendor-specific event.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothHeadset#ACTION_VENDOR_SPECIFIC_HEADSET_EVENT
  static const String ACTION_VENDOR_SPECIFIC_HEADSET_EVENT =
      "android.bluetooth.headset.action.VENDOR_SPECIFIC_HEADSET_EVENT";

  /// A String extra field in `ACTION_VENDOR_SPECIFIC_HEADSET_EVENT` intents that contains the name of the vendor-specific command.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothHeadset#EXTRA_VENDOR_SPECIFIC_HEADSET_EVENT_CMD
  static const String EXTRA_VENDOR_SPECIFIC_HEADSET_EVENT_CMD =
      "android.bluetooth.headset.extra.VENDOR_SPECIFIC_HEADSET_EVENT_CMD";

  /// An int extra field in `ACTION_VENDOR_SPECIFIC_HEADSET_EVENT` intents that contains the AT command type of the vendor-specific command.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothHeadset#EXTRA_VENDOR_SPECIFIC_HEADSET_EVENT_CMD_TYPE
  static const String EXTRA_VENDOR_SPECIFIC_HEADSET_EVENT_CMD_TYPE =
      "android.bluetooth.headset.extra.VENDOR_SPECIFIC_HEADSET_EVENT_CMD_TYPE";

  /// AT command type READ used with `EXTRA_VENDOR_SPECIFIC_HEADSET_EVENT_CMD_TYPE` For example, AT+VGM?.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothHeadset#AT_CMD_TYPE_READ
  static const int AT_CMD_TYPE_READ = 0;

  /// AT command type TEST used with `EXTRA_VENDOR_SPECIFIC_HEADSET_EVENT_CMD_TYPE` For example, AT+VGM=?.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothHeadset#AT_CMD_TYPE_TEST
  static const int AT_CMD_TYPE_TEST = 1;

  /// AT command type SET used with `EXTRA_VENDOR_SPECIFIC_HEADSET_EVENT_CMD_TYPE` For example, AT+VGM=<args>.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothHeadset#AT_CMD_TYPE_SET
  static const int AT_CMD_TYPE_SET = 2;

  /// AT command type BASIC used with `EXTRA_VENDOR_SPECIFIC_HEADSET_EVENT_CMD_TYPE` For example, ATD.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothHeadset#AT_CMD_TYPE_BASIC
  static const int AT_CMD_TYPE_BASIC = 3;

  /// AT command type ACTION used with `EXTRA_VENDOR_SPECIFIC_HEADSET_EVENT_CMD_TYPE` For example, AT+CHUP.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothHeadset#AT_CMD_TYPE_ACTION
  static const int AT_CMD_TYPE_ACTION = 4;

  /// A Parcelable String array extra field in `ACTION_VENDOR_SPECIFIC_HEADSET_EVENT` intents that contains the arguments to the vendor-specific command.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothHeadset#EXTRA_VENDOR_SPECIFIC_HEADSET_EVENT_ARGS
  static const String EXTRA_VENDOR_SPECIFIC_HEADSET_EVENT_ARGS =
      "android.bluetooth.headset.extra.VENDOR_SPECIFIC_HEADSET_EVENT_ARGS";

  /// The intent category to be used with `ACTION_VENDOR_SPECIFIC_HEADSET_EVENT` for the companyId.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothHeadset#VENDOR_SPECIFIC_HEADSET_EVENT_COMPANY_ID_CATEGORY
  static const String VENDOR_SPECIFIC_HEADSET_EVENT_COMPANY_ID_CATEGORY =
      "android.bluetooth.headset.intent.category.companyid";

  /// A vendor-specific command for unsolicited result code.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothHeadset#VENDOR_RESULT_CODE_COMMAND_ANDROID
  static const String VENDOR_RESULT_CODE_COMMAND_ANDROID = "+ANDROID";

  /// Headset state when SCO audio is not connected.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothHeadset#STATE_AUDIO_DISCONNECTED
  static const int STATE_AUDIO_DISCONNECTED = 10;

  /// Headset state when SCO audio is connecting.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothHeadset#STATE_AUDIO_CONNECTING
  static const int STATE_AUDIO_CONNECTING = 11;

  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothHeadset#STATE_AUDIO_CONNECTED
  static const int STATE_AUDIO_CONNECTED = 12;
}
