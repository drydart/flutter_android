/* This is free and unencumbered software released into the public domain. */

import 'dart:ui' show Image;

import 'package:flutter/painting.dart' show AssetImage;

import '../os/parcelable.dart' show Parcelable;

/// Bitmap image.
///
/// See: https://developer.android.com/reference/android/graphics/Bitmap
abstract class Bitmap implements Parcelable {
  static Bitmap fromImage(final Image image) {
    return _ImageBitmap(image);
  }

  static Bitmap fromAssetImage(final AssetImage asset) {
    return _AssetBitmap(asset);
  }

  String get assetName => null;

  /// The bitmap's height.
  int get height;

  /// The bitmap's width.
  int get width;

  /// Returns the bitmap's height.
  int getHeight() => height;

  /// Returns the bitmap's width.
  int getWidth() => width;

  /// Creates an image from this bitmap.
  Image toImage();
}

class _ImageBitmap extends Bitmap {
  final Image image;

  _ImageBitmap(this.image) : assert(image != null);

  @override
  int get height => image.height;

  @override
  int get width => image.width;

  @override
  Image toImage() => image;
}

class _AssetBitmap extends Bitmap {
  final AssetImage asset;

  _AssetBitmap(this.asset) : assert(asset != null);

  @override
  String get assetName => asset.assetName;

  @override
  int get height => null; // TODO

  @override
  int get width => null; // TODO

  @override
  Image toImage() => null; // TODO
}
