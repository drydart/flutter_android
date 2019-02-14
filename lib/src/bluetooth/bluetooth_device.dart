/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/services.dart' show MethodChannel;

/// Represents a remote Bluetooth device.
///
/// See: https://developer.android.com/reference/android/bluetooth/BluetoothDevice
abstract class BluetoothDevice {
  static const MethodChannel _channel =
      MethodChannel('flutter_android/BluetoothDevice');
}
