/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/services.dart' show MethodChannel;

/// Represents the local device Bluetooth adapter.
///
/// See: https://developer.android.com/reference/android/bluetooth/BluetoothAdapter
abstract class BluetoothAdapter {
  static const MethodChannel _channel =
      MethodChannel('flutter_android/BluetoothAdapter');
}
