/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/services.dart' show MethodChannel;
import 'package:meta/meta.dart' show required;

import '../graphics/bitmap.dart' show Bitmap;
import '../graphics/pointf.dart' show PointF;
import 'face.dart' show Face;

/// Identifies the faces of people in a [Bitmap] graphic object.
///
/// See: https://developer.android.com/reference/android/media/FaceDetector
class FaceDetector {
  static const MethodChannel _channel =
      MethodChannel('flutter_android/FaceDetector');

  /// The width of the images to be analyzed.
  final int width;

  /// The height of the images to be analyzed.
  final int height;

  /// The maximum number of faces to identify.
  final int maxFaces;

  /// Creates a FaceDetector, configured with the size of the images to be
  /// analyzed and the maximum number of faces that can be detected.
  ///
  /// These parameters cannot be changed once the object is constructed.
  /// Note that the width of the image must be even.
  ///
  /// See: https://developer.android.com/reference/android/media/FaceDetector#FaceDetector(int,%20int,%20int)
  FaceDetector({@required this.width, @required this.height, this.maxFaces = 1})
      : assert(width != null && width > 0 && width % 2 == 0),
        assert(height != null && height > 0);

  /// Finds all the faces found in a given [Bitmap].
  ///
  /// Returns an array of [Face] for each face found.
  ///
  /// See: https://developer.android.com/reference/android/media/FaceDetector#findFaces(android.graphics.Bitmap,%20android.media.FaceDetector.Face[])
  Future<List<Face>> findFaces(final Bitmap bitmap) async {
    final request = <String, dynamic>{
      'width': width,
      'height': height,
      'maxFaces': maxFaces,
      'bitmapName': bitmap.assetName, // TODO: support dynamic images as well
    };
    final response = await _channel.invokeMethod('findFaces', request);
    return response.cast<List<dynamic>>().map((final List<dynamic> input) {
      final result = input.cast<double>();
      return Face(
        confidence: result[0],
        midPoint: PointF(result[1], result[2]),
        eyesDistance: result[3],
        poseX: result[4],
        poseY: result[5],
        poseZ: result[6],
      );
    }).toList();
  }
}
