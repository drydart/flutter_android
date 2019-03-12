/* This is free and unencumbered software released into the public domain. */

import 'dart:ui' show Color;

import '../os/parcelable.dart' show Parcelable;

/// Provides information about the colors of a wallpaper.
///
/// Exposes the 3 most visually representative colors of a wallpaper.
///
/// See: https://developer.android.com/reference/android/app/WallpaperColors
class WallpaperColors implements Parcelable {
  /// The most visually representative color of the wallpaper.
  ///
  /// See: https://developer.android.com/reference/android/app/WallpaperColors#getPrimaryColor()
  final Color primaryColor;

  /// The second most preeminent color of the wallpaper.
  ///
  /// See: https://developer.android.com/reference/android/app/WallpaperColors#getSecondaryColor()
  final Color secondaryColor;

  /// The third most preeminent color of the wallpaper.
  ///
  /// See: https://developer.android.com/reference/android/app/WallpaperColors#getTertiaryColor()
  final Color tertiaryColor;

  /// Constructs a new object from three colors.
  ///
  /// See: https://developer.android.com/reference/android/app/WallpaperColors#WallpaperColors(android.graphics.Color,%20android.graphics.Color,%20android.graphics.Color)
  WallpaperColors(this.primaryColor, this.secondaryColor, this.tertiaryColor);
}
