/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';

import 'package:flutter_android/android_bluetooth.dart';

////////////////////////////////////////////////////////////////////////////////

class BluetoothScannerDemo extends StatefulWidget {
  @override
  State<BluetoothScannerDemo> createState() => _BluetoothScannerState();
}

////////////////////////////////////////////////////////////////////////////////

class _BluetoothScannerState extends State<BluetoothScannerDemo> {
  @override
  void initState() {
    super.initState();
    _initPlatformState();
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bluetooth Scanner"),
      ),
      body: Center(
        child: Text("To be implemented"), // TODO
      ),
    );
  }

  Future<void> _initPlatformState() async {
    // TODO
  }
}
