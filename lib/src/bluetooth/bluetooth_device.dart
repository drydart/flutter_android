/* This is free and unencumbered software released into the public domain. */

//import 'package:flutter/services.dart' show MethodChannel;

/// Represents a remote Bluetooth device.
///
/// See: https://developer.android.com/reference/android/bluetooth/BluetoothDevice
abstract class BluetoothDevice {
  //static const MethodChannel _channel =
  //    MethodChannel('flutter_android/BluetoothDevice');

  /// Sentinel error value for this class.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothDevice#ERROR
  static const int ERROR = -2147483648;

  /// TODO: Change API to not broadcast RSSI if not available (incoming connection).
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothDevice#ACTION_FOUND
  static const String ACTION_FOUND = "android.bluetooth.device.action.FOUND";

  /// Broadcast Action: Bluetooth class of a remote device has changed.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothDevice#ACTION_CLASS_CHANGED
  static const String ACTION_CLASS_CHANGED =
      "android.bluetooth.device.action.CLASS_CHANGED";

  /// Broadcast Action: Indicates a low level (ACL) connection has been established with a remote device.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothDevice#ACTION_ACL_CONNECTED
  static const String ACTION_ACL_CONNECTED =
      "android.bluetooth.device.action.ACL_CONNECTED";

  /// Broadcast Action: Indicates that a low level (ACL) disconnection has been requested for a remote device, and it will soon be disconnected.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothDevice#ACTION_ACL_DISCONNECT_REQUESTED
  static const String ACTION_ACL_DISCONNECT_REQUESTED =
      "android.bluetooth.device.action.ACL_DISCONNECT_REQUESTED";

  /// Broadcast Action: Indicates a low level (ACL) disconnection from a remote device.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothDevice#ACTION_ACL_DISCONNECTED
  static const String ACTION_ACL_DISCONNECTED =
      "android.bluetooth.device.action.ACL_DISCONNECTED";

  /// Broadcast Action: Indicates the friendly name of a remote device has been retrieved for the first time, or changed since the last retrieval.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothDevice#ACTION_NAME_CHANGED
  static const String ACTION_NAME_CHANGED =
      "android.bluetooth.device.action.NAME_CHANGED";

  /// contain a hidden extra field EXTRA_REASON with the result code.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothDevice#ACTION_BOND_STATE_CHANGED
  static const String ACTION_BOND_STATE_CHANGED =
      "android.bluetooth.device.action.BOND_STATE_CHANGED";

  /// Used as a Parcelable `BluetoothDevice` extra field in every intent broadcast by this class.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothDevice#EXTRA_DEVICE
  static const String EXTRA_DEVICE = "android.bluetooth.device.extra.DEVICE";

  /// Used as a String extra field in `ACTION_NAME_CHANGED` and `ACTION_FOUND` intents.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothDevice#EXTRA_NAME
  static const String EXTRA_NAME = "android.bluetooth.device.extra.NAME";

  /// Used as an optional short extra field in `ACTION_FOUND` intents.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothDevice#EXTRA_RSSI
  static const String EXTRA_RSSI = "android.bluetooth.device.extra.RSSI";

  /// Used as a Parcelable `BluetoothClass` extra field in `ACTION_FOUND` and `ACTION_CLASS_CHANGED` intents.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothDevice#EXTRA_CLASS
  static const String EXTRA_CLASS = "android.bluetooth.device.extra.CLASS";

  /// Used as an int extra field in `ACTION_BOND_STATE_CHANGED` intents.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothDevice#EXTRA_BOND_STATE
  static const String EXTRA_BOND_STATE =
      "android.bluetooth.device.extra.BOND_STATE";

  /// Used as an int extra field in `ACTION_BOND_STATE_CHANGED` intents.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothDevice#EXTRA_PREVIOUS_BOND_STATE
  static const String EXTRA_PREVIOUS_BOND_STATE =
      "android.bluetooth.device.extra.PREVIOUS_BOND_STATE";

  /// Indicates the remote device is not bonded (paired).
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothDevice#BOND_NONE
  static const int BOND_NONE = 10;

  /// Indicates bonding (pairing) is in progress with the remote device.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothDevice#BOND_BONDING
  static const int BOND_BONDING = 11;

  /// Indicates the remote device is bonded (paired).
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothDevice#BOND_BONDED
  static const int BOND_BONDED = 12;

  /// Used as an int extra field in `ACTION_PAIRING_REQUEST` intents to indicate pairing method used.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothDevice#EXTRA_PAIRING_VARIANT
  static const String EXTRA_PAIRING_VARIANT =
      "android.bluetooth.device.extra.PAIRING_VARIANT";

  /// Used as an int extra field in `ACTION_PAIRING_REQUEST` intents as the value of passkey.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothDevice#EXTRA_PAIRING_KEY
  static const String EXTRA_PAIRING_KEY =
      "android.bluetooth.device.extra.PAIRING_KEY";

  /// Bluetooth device type, Unknown.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothDevice#DEVICE_TYPE_UNKNOWN
  static const int DEVICE_TYPE_UNKNOWN = 0;

  /// Bluetooth device type, Classic - BR/EDR devices.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothDevice#DEVICE_TYPE_CLASSIC
  static const int DEVICE_TYPE_CLASSIC = 1;

  /// Bluetooth device type, Low Energy - LE-only.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothDevice#DEVICE_TYPE_LE
  static const int DEVICE_TYPE_LE = 2;

  /// Bluetooth device type, Dual Mode - BR/EDR/LE.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothDevice#DEVICE_TYPE_DUAL
  static const int DEVICE_TYPE_DUAL = 3;

  /// Broadcast Action: This intent is used to broadcast the `UUID` wrapped as a `android.os.ParcelUuid` of the remote device after it has been fetched.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothDevice#ACTION_UUID
  static const String ACTION_UUID = "android.bluetooth.device.action.UUID";

  /// TODO: is this actually useful?.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothDevice#ACTION_NAME_FAILED
  static const String ACTION_NAME_FAILED =
      "android.bluetooth.device.action.NAME_FAILED";

  /// Broadcast Action: This intent is used to broadcast PAIRING REQUEST Requires `android.Manifest.permission#BLUETOOTH_ADMIN` to receive.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothDevice#ACTION_PAIRING_REQUEST
  static const String ACTION_PAIRING_REQUEST =
      "android.bluetooth.device.action.PAIRING_REQUEST";

  /// The user will be prompted to enter a pin or an app will enter a pin for user.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothDevice#PAIRING_VARIANT_PIN
  static const int PAIRING_VARIANT_PIN = 0;

  /// The user will be prompted to confirm the passkey displayed on the screen or an app will confirm the passkey for the user.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothDevice#PAIRING_VARIANT_PASSKEY_CONFIRMATION
  static const int PAIRING_VARIANT_PASSKEY_CONFIRMATION = 2;

  /// Used as an extra field in `ACTION_UUID` intents, Contains the `android.os.ParcelUuid`s of the remote device which is a parcelable version of `UUID`.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothDevice#EXTRA_UUID
  static const String EXTRA_UUID = "android.bluetooth.device.extra.UUID";

  /// No preference of physical transport for GATT connections to remote dual-mode devices.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothDevice#TRANSPORT_AUTO
  static const int TRANSPORT_AUTO = 0;

  /// Prefer BR/EDR transport for GATT connections to remote dual-mode devices.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothDevice#TRANSPORT_BREDR
  static const int TRANSPORT_BREDR = 1;

  /// Prefer LE transport for GATT connections to remote dual-mode devices.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothDevice#TRANSPORT_LE
  static const int TRANSPORT_LE = 2;

  /// Bluetooth LE 1M PHY.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothDevice#PHY_LE_1M
  static const int PHY_LE_1M = 1;

  /// Bluetooth LE 2M PHY.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothDevice#PHY_LE_2M
  static const int PHY_LE_2M = 2;

  /// Bluetooth LE Coded PHY.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothDevice#PHY_LE_CODED
  static const int PHY_LE_CODED = 3;

  /// Bluetooth LE 1M PHY mask.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothDevice#PHY_LE_1M_MASK
  static const int PHY_LE_1M_MASK = 1;

  /// Bluetooth LE 2M PHY mask.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothDevice#PHY_LE_2M_MASK
  static const int PHY_LE_2M_MASK = 2;

  /// Bluetooth LE Coded PHY mask.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothDevice#PHY_LE_CODED_MASK
  static const int PHY_LE_CODED_MASK = 4;

  /// No preferred coding when transmitting on the LE Coded PHY.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothDevice#PHY_OPTION_NO_PREFERRED
  static const int PHY_OPTION_NO_PREFERRED = 0;

  /// Prefer the S=2 coding to be used when transmitting on the LE Coded PHY.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothDevice#PHY_OPTION_S2
  static const int PHY_OPTION_S2 = 1;

  /// Prefer the S=8 coding to be used when transmitting on the LE Coded PHY.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothDevice#PHY_OPTION_S8
  static const int PHY_OPTION_S8 = 2;

  /// See: https://developer.android.com/reference/android/bluetooth/BluetoothDevice#CREATOR
  //static const Parcelable.Creator<BluetoothDevice> CREATOR = null; // TODO
}
