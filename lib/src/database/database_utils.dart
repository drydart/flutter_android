/* This is free and unencumbered software released into the public domain. */

import 'dart:async' show Future;

import 'package:platform/platform.dart' show Platform, LocalPlatform;

import 'cursor.dart' show Cursor;

const Platform _platform = LocalPlatform();

/// Static utility methods for dealing with databases and [Cursor]s.
///
/// See: https://developer.android.com/reference/android/database/DatabaseUtils
abstract class DatabaseUtils {

  /// Prints the contents of a [Cursor]'s current row to standard output.
  ///
  /// See: https://developer.android.com/reference/android/database/DatabaseUtils.html#dumpCurrentRow(android.database.Cursor)
  static Future<void> dumpCurrentRow(final Cursor cursor) async {
    assert(_platform.isAndroid);
    // TODO
  }

  /// Prints the contents of a [Cursor]'s current row to a string.
  ///
  /// See: https://developer.android.com/reference/android/database/DatabaseUtils.html#dumpCurrentRowToString(android.database.Cursor)
  static Future<String> dumpCurrentRowToString(final Cursor cursor) async {
    assert(_platform.isAndroid);
    return null; // TODO
  }

  /// Prints the contents of a [Cursor] to standard output.
  ///
  /// The position is restored after printing.
  ///
  /// See: https://developer.android.com/reference/android/database/DatabaseUtils.html#dumpCursor(android.database.Cursor)
  static Future<void> dumpCursor(final Cursor cursor) async {
    assert(_platform.isAndroid);
    // TODO
  }

  /// Prints the contents of a [Cursor] to a string.
  ///
  /// The position is restored after printing.
  ///
  /// See: https://developer.android.com/reference/android/database/DatabaseUtils.html#dumpCursorToString(android.database.Cursor)
  static Future<String> dumpCursorToString(final Cursor cursor) async {
    assert(_platform.isAndroid);
    return null; // TODO
  }
}
