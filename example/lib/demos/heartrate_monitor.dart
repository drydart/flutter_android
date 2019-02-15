/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';

import 'package:flutter_android/android_hardware.dart';

////////////////////////////////////////////////////////////////////////////////

class HeartrateMonitorDemo extends StatefulWidget {
  @override
  State<HeartrateMonitorDemo> createState() => _HeartrateMonitorState();
}

////////////////////////////////////////////////////////////////////////////////

class _HeartrateMonitorState extends State<HeartrateMonitorDemo> {
  @override
  void initState() {
    super.initState();
    _initPlatformState();
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Heart-Rate Monitor"),
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
