/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';

import 'package:flutter_android/android_graphics.dart' show Bitmap;
import 'package:flutter_android/android_media.dart' show Face, FaceDetector;

////////////////////////////////////////////////////////////////////////////////

class FaceDetectorDemo extends StatefulWidget {
  @override
  State<FaceDetectorDemo> createState() => _FaceDetectorState();
}

////////////////////////////////////////////////////////////////////////////////

class _FaceDetectorState extends State<FaceDetectorDemo> {
  static const photo = AssetImage('images/einstein.png');

  final Image _image = Image(image: photo);
  FaceDetector _detector;

  _FaceDetectorState();

  @override
  void initState() {
    super.initState();
    _initPlatformState();
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Face Detection"),
      ),
      body: Center(child: _image),
    );
  }

  Future<void> _initPlatformState() async {
    _detector = FaceDetector(width: 280, height: 396, maxFaces: 1);
    print(await _detector.findFaces(Bitmap.fromAssetImage(photo))); // TODO
  }
}
