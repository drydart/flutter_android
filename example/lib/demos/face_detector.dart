/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';

import 'package:flutter_android/android_media.dart' show Face, FaceDetector;

////////////////////////////////////////////////////////////////////////////////

class FaceDetectorDemo extends StatefulWidget {
  @override
  State<FaceDetectorDemo> createState() => _FaceDetectorState();
}

////////////////////////////////////////////////////////////////////////////////

class _FaceDetectorState extends State<FaceDetectorDemo> {
  final detector = FaceDetector(width: 480, height: 640, maxFaces: 1);

  _FaceDetectorState();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Face Detection"),
      ),
      body: Center(child: Text("To be implemented.")), // TODO
    );
  }
}
