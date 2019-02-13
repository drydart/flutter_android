/* This is free and unencumbered software released into the public domain. */

import 'dart:async';
import 'package:flutter/material.dart';

////////////////////////////////////////////////////////////////////////////////

final Map<String, String> demos = <String, String>{
  "Face detection": "Using android_media.FaceDetector.",
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
        final String demoTitle = demoKeys[index];
        final String demoSubtitle = demos[demoTitle];
        return GestureDetector(
          onTap: () => _launchDemo(demoTitle),
          child: ListTile(
            leading: Icon(Icons.play_circle_outline),
            title: Text(demoTitle),
            subtitle: Text(demoSubtitle),
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

  void _launchDemo(final String demoTitle) {
    switch (demoTitle) {
      case "Face detection":
        Navigator.of(context).pushNamed('/face_detection');
        break;
      default:
        break;
    }
  }
}
