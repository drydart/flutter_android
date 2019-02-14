/* This is free and unencumbered software released into the public domain. */

/// Provides classes that manage Bluetooth functionality, such as scanning for
/// devices, connecting with devices, and managing data transfer between
/// devices.
///
/// See: https://developer.android.com/reference/android/bluetooth/package-summary
/// See: https://developer.android.com/reference/android/bluetooth/le/package-summary
///
/// {@canonicalFor bluetooth_adapter.BluetoothAdapter}
/// {@canonicalFor bluetooth_device.BluetoothDevice}
/// {@canonicalFor bluetooth_headset.BluetoothHeadset}
/// {@canonicalFor bluetooth_le_scanner.BluetoothLeScanner}
/// {@canonicalFor bluetooth_manager.BluetoothManager}
library android_bluetooth;

export 'src/bluetooth/bluetooth_adapter.dart' show BluetoothAdapter;
export 'src/bluetooth/bluetooth_device.dart' show BluetoothDevice;
export 'src/bluetooth/bluetooth_headset.dart' show BluetoothHeadset;
export 'src/bluetooth/bluetooth_le_scanner.dart' show BluetoothLeScanner;
export 'src/bluetooth/bluetooth_manager.dart' show BluetoothManager;
