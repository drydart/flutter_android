/* This is free and unencumbered software released into the public domain. */

import 'dart:async';
import 'package:flutter/material.dart';

import 'demos/bluetooth_scanner.dart' show BluetoothScannerDemo;
import 'demos/face_detector.dart' show FaceDetectorDemo;
import 'demos/heartrate_monitor.dart' show HeartrateMonitorDemo;

////////////////////////////////////////////////////////////////////////////////

class DemoDescription {
  final String title;
  final String subtitle;
  final WidgetBuilder widget;

  const DemoDescription({this.title, this.subtitle, this.widget});
}

////////////////////////////////////////////////////////////////////////////////

final Map<String, DemoDescription> demos = <String, DemoDescription>{
  'bluetooth_scanner': DemoDescription(
    title: "Bluetooth scanning",
    subtitle: "Using android_bluetooth.BluetoothLeScanner.",
    widget: (context) => BluetoothScannerDemo(),
  ),
  'face_detector': DemoDescription(
    title: "Face detection",
    subtitle: "Using android_media.FaceDetector.",
    widget: (context) => FaceDetectorDemo(),
  ),
  'heartrate_monitor': DemoDescription(
    title: "Heart-rate monitoring",
    subtitle: "Using android_hardware.SensorManager.",
    widget: (context) => HeartrateMonitorDemo(),
  ),
};

////////////////////////////////////////////////////////////////////////////////

class DemoTab extends StatefulWidget {
  @override
  State<DemoTab> createState() => _DemoTabState();
}

////////////////////////////////////////////////////////////////////////////////

class _DemoTabState extends State<DemoTab> {
  @override
  void initState() {
    super.initState();
    _initPlatformState();
  }

  @override
  Widget build(final BuildContext context) {
    final demoKeys = demos.keys.toList();
    return ListView.separated(
      padding: EdgeInsets.all(8.0),
      itemCount: demoKeys.length,
      itemBuilder: (final BuildContext context, final int index) {
        final demoKey = demoKeys[index];
        final demo = demos[demoKey];
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: demo.widget,
            ));
          },
          child: ListTile(
            leading: Icon(Icons.play_circle_outline),
            title: Text(demo.title),
            subtitle: Text(demo.subtitle),
          ),
        );
      },
      separatorBuilder: (final BuildContext context, final int index) {
        return Divider();
      },
    );
  }

  Future<void> _initPlatformState() async {
    // TODO
  }
}
