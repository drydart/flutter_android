/* This is free and unencumbered software released into the public domain. */

//import 'package:flutter/services.dart' show MethodChannel;

/// This class provides methods to perform scan related operations for Bluetooth
/// LE devices.
///
/// See: https://developer.android.com/reference/android/bluetooth/le/BluetoothLeScanner
abstract class BluetoothLeScanner {
  //static const MethodChannel _channel =
  //    MethodChannel('flutter_android/BluetoothLeScanner');

  /// Extra containing a list of ScanResults.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/le/BluetoothLeScanner#EXTRA_LIST_SCAN_RESULT
  static const String EXTRA_LIST_SCAN_RESULT =
      "android.bluetooth.le.extra.LIST_SCAN_RESULT";

  /// Optional extra indicating the error code, if any.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/le/BluetoothLeScanner#EXTRA_ERROR_CODE
  static const String EXTRA_ERROR_CODE =
      "android.bluetooth.le.extra.ERROR_CODE";

  /// Optional extra indicating the callback type, which will be one of CALLBACK_TYPE_* constants in `ScanSettings`.
  ///
  /// See: https://developer.android.com/reference/android/bluetooth/le/BluetoothLeScanner#EXTRA_CALLBACK_TYPE
  static const String EXTRA_CALLBACK_TYPE =
      "android.bluetooth.le.extra.CALLBACK_TYPE";
}
