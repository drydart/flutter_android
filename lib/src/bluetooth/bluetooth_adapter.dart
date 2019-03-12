/* This is free and unencumbered software released into the public domain. */

//import 'package:flutter/services.dart' show MethodChannel;

/// Represents the local device Bluetooth adapter.
///
/// See: https://developer.android.com/reference/android/bluetooth/BluetoothAdapter
abstract class BluetoothAdapter {
  //static const MethodChannel _channel =
  //    MethodChannel('flutter_android/BluetoothAdapter');

  /// Sentinel error value for this class.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothAdapter#ERROR
  static const int ERROR = -2147483648;

  /// Broadcast Action: The state of the local Bluetooth adapter has been changed.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothAdapter#ACTION_STATE_CHANGED
  static const String ACTION_STATE_CHANGED = "android.bluetooth.adapter.action.STATE_CHANGED";

  /// Used as an int extra field in `ACTION_STATE_CHANGED` intents to request the current power state.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothAdapter#EXTRA_STATE
  static const String EXTRA_STATE = "android.bluetooth.adapter.extra.STATE";

  /// Used as an int extra field in `ACTION_STATE_CHANGED` intents to request the previous power state.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothAdapter#EXTRA_PREVIOUS_STATE
  static const String EXTRA_PREVIOUS_STATE = "android.bluetooth.adapter.extra.PREVIOUS_STATE";

  /// Indicates the local Bluetooth adapter is off.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothAdapter#STATE_OFF
  static const int STATE_OFF = 10;

  /// Indicates the local Bluetooth adapter is turning on.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothAdapter#STATE_TURNING_ON
  static const int STATE_TURNING_ON = 11;

  /// Indicates the local Bluetooth adapter is on, and ready for use.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothAdapter#STATE_ON
  static const int STATE_ON = 12;

  /// Indicates the local Bluetooth adapter is turning off.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothAdapter#STATE_TURNING_OFF
  static const int STATE_TURNING_OFF = 13;

  /// Activity Action: Show a system activity that requests discoverable mode.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothAdapter#ACTION_REQUEST_DISCOVERABLE
  static const String ACTION_REQUEST_DISCOVERABLE = "android.bluetooth.adapter.action.REQUEST_DISCOVERABLE";

  /// Used as an optional int extra field in `ACTION_REQUEST_DISCOVERABLE` intents to request a specific duration for discoverability in seconds.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothAdapter#EXTRA_DISCOVERABLE_DURATION
  static const String EXTRA_DISCOVERABLE_DURATION = "android.bluetooth.adapter.extra.DISCOVERABLE_DURATION";

  /// Activity Action: Show a system activity that allows the user to turn on Bluetooth.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothAdapter#ACTION_REQUEST_ENABLE
  static const String ACTION_REQUEST_ENABLE = "android.bluetooth.adapter.action.REQUEST_ENABLE";

  /// Broadcast Action: Indicates the Bluetooth scan mode of the local Adapter has changed.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothAdapter#ACTION_SCAN_MODE_CHANGED
  static const String ACTION_SCAN_MODE_CHANGED = "android.bluetooth.adapter.action.SCAN_MODE_CHANGED";

  /// Used as an int extra field in `ACTION_SCAN_MODE_CHANGED` intents to request the current scan mode.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothAdapter#EXTRA_SCAN_MODE
  static const String EXTRA_SCAN_MODE = "android.bluetooth.adapter.extra.SCAN_MODE";

  /// Used as an int extra field in `ACTION_SCAN_MODE_CHANGED` intents to request the previous scan mode.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothAdapter#EXTRA_PREVIOUS_SCAN_MODE
  static const String EXTRA_PREVIOUS_SCAN_MODE = "android.bluetooth.adapter.extra.PREVIOUS_SCAN_MODE";

  /// Indicates that both inquiry scan and page scan are disabled on the local Bluetooth adapter.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothAdapter#SCAN_MODE_NONE
  static const int SCAN_MODE_NONE = 20;

  /// Indicates that inquiry scan is disabled, but page scan is enabled on the local Bluetooth adapter.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothAdapter#SCAN_MODE_CONNECTABLE
  static const int SCAN_MODE_CONNECTABLE = 21;

  /// Indicates that both inquiry scan and page scan are enabled on the local Bluetooth adapter.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothAdapter#SCAN_MODE_CONNECTABLE_DISCOVERABLE
  static const int SCAN_MODE_CONNECTABLE_DISCOVERABLE = 23;

  /// Broadcast Action: The local Bluetooth adapter has started the remote device discovery process.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothAdapter#ACTION_DISCOVERY_STARTED
  static const String ACTION_DISCOVERY_STARTED = "android.bluetooth.adapter.action.DISCOVERY_STARTED";

  /// Broadcast Action: The local Bluetooth adapter has finished the device discovery process.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothAdapter#ACTION_DISCOVERY_FINISHED
  static const String ACTION_DISCOVERY_FINISHED = "android.bluetooth.adapter.action.DISCOVERY_FINISHED";

  /// Broadcast Action: The local Bluetooth adapter has changed its friendly Bluetooth name.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothAdapter#ACTION_LOCAL_NAME_CHANGED
  static const String ACTION_LOCAL_NAME_CHANGED = "android.bluetooth.adapter.action.LOCAL_NAME_CHANGED";

  /// Used as a String extra field in `ACTION_LOCAL_NAME_CHANGED` intents to request the local Bluetooth name.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothAdapter#EXTRA_LOCAL_NAME
  static const String EXTRA_LOCAL_NAME = "android.bluetooth.adapter.extra.LOCAL_NAME";

  /// Intent used to broadcast the change in connection state of the local Bluetooth adapter to a profile of the remote device.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothAdapter#ACTION_CONNECTION_STATE_CHANGED
  static const String ACTION_CONNECTION_STATE_CHANGED = "android.bluetooth.adapter.action.CONNECTION_STATE_CHANGED";

  /// Extra used by `ACTION_CONNECTION_STATE_CHANGED`.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothAdapter#EXTRA_CONNECTION_STATE
  static const String EXTRA_CONNECTION_STATE = "android.bluetooth.adapter.extra.CONNECTION_STATE";

  /// Extra used by `ACTION_CONNECTION_STATE_CHANGED`.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothAdapter#EXTRA_PREVIOUS_CONNECTION_STATE
  static const String EXTRA_PREVIOUS_CONNECTION_STATE = "android.bluetooth.adapter.extra.PREVIOUS_CONNECTION_STATE";

  /// The profile is in disconnected state.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothAdapter#STATE_DISCONNECTED
  static const int STATE_DISCONNECTED = 0;

  /// The profile is in connecting state.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothAdapter#STATE_CONNECTING
  static const int STATE_CONNECTING = 1;

  /// The profile is in connected state.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothAdapter#STATE_CONNECTED
  static const int STATE_CONNECTED = 2;

  /// The profile is in disconnecting state.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothAdapter#STATE_DISCONNECTING
  static const int STATE_DISCONNECTING = 3;
}
