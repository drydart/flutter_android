/* This is free and unencumbered software released into the public domain. */

import 'dart:ui' show Image;

import '../os/parcelable.dart' show Parcelable;

/// Bitmap image.
///
/// See: https://developer.android.com/reference/android/graphics/Bitmap
class Bitmap implements Parcelable {
  final Image image;

  const Bitmap.fromImage(this.image);

  /// Returns the bitmap's height.
  int getHeight() => image.height;

  /// Returns the bitmap's width.
  int getWidth() => image.width;

  /// Creates an image from this bitmap.
  Image toImage() => image;
}
