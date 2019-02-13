/* This is free and unencumbered software released into the public domain. */

import '../graphics/bitmap.dart' show Bitmap;
import 'face.dart' show Face;

/// Identifies the faces of people in a [Bitmap] graphic object.
///
/// See: https://developer.android.com/reference/android/media/FaceDetector
class FaceDetector {
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
  FaceDetector({this.width, this.height, this.maxFaces = 1})
      : assert(width % 2 == 0);

  /// Finds all the faces found in a given [Bitmap].
  ///
  /// Returns an array of [Face] for each face found.
  ///
  /// The bitmap must be in 565 format (for now).
  ///
  /// See: https://developer.android.com/reference/android/media/FaceDetector#findFaces(android.graphics.Bitmap,%20android.media.FaceDetector.Face[])
  List<Face> findFaces(final Bitmap bitmap) {
    return <Face>[]; // TODO
  }
}
