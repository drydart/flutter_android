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
  List<Face> _faces = <Face>[];

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
      body: Center(
        child: CustomPaint(
          child: _image,
          foregroundPainter: _FaceDetectorPainter(faces: _faces),
        ),
      ),
    );
  }

  Future<void> _initPlatformState() async {
    _detector = FaceDetector(width: 280, height: 396, maxFaces: 1);
    final faces = await _detector.findFaces(Bitmap.fromAssetImage(photo));
    setState(() {
      _faces = faces;
    });
  }
}

////////////////////////////////////////////////////////////////////////////////

class _FaceDetectorPainter extends CustomPainter {
  final List<Face> faces;

  _FaceDetectorPainter({this.faces});

  @override
  void paint(final Canvas canvas, final Size size) {
    const eyeRadius = 12.0;
    final line = Paint()
        ..color = Colors.blue
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2;

    for (final face in faces) {
      if (face.confidence < Face.CONFIDENCE_THRESHOLD) continue;

      final midPoint = Offset(face.midPoint.x, face.midPoint.y);
      final leftEye = midPoint.translate(-(face.eyesDistance/2), 0);
      final rightEye = midPoint.translate((face.eyesDistance/2), 0);
      final noseBridge = Path()
        ..moveTo(leftEye.dx+eyeRadius, leftEye.dy)
        ..quadraticBezierTo(midPoint.dx, midPoint.dy-eyeRadius, rightEye.dx-eyeRadius, rightEye.dy);
      canvas.drawCircle(leftEye, eyeRadius, line);
      canvas.drawCircle(rightEye, eyeRadius, line);
      canvas.drawPath(noseBridge, line);
    }
  }

  @override
  bool shouldRepaint(_FaceDetectorPainter oldDelegate) => false;
}
