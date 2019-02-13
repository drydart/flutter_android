/* This is free and unencumbered software released into the public domain. */

/// Provides low level graphics tools such as canvases, color filters, points,
/// and rectangles that let you handle drawing to the screen directly.
///
/// See: https://developer.android.com/reference/android/graphics/package-summary
///
/// {@canonicalFor bitmap.Bitmap}
/// {@canonicalFor point.Point}
/// {@canonicalFor pointf.PointF}
library android_graphics;

export 'src/graphics/bitmap.dart' show Bitmap;
export 'src/graphics/point.dart' show Point;
export 'src/graphics/pointf.dart' show PointF;
