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
  /// See: https://developer.android.com/reference/android/database/DatabaseUtils#dumpCurrentRow(android.database.Cursor)
  static Future<void> dumpCurrentRow(final Cursor cursor) async {
    assert(_platform.isAndroid);

    print(await dumpCurrentRowToString(cursor));
  }

  /// Prints the contents of a [Cursor]'s current row to a string.
  ///
  /// See: https://developer.android.com/reference/android/database/DatabaseUtils#dumpCurrentRowToString(android.database.Cursor)
  static Future<String> dumpCurrentRowToString(final Cursor cursor) async {
    assert(_platform.isAndroid);

    final buffer = StringBuffer();
    await dumpCurrentRowToStringBuffer(cursor, buffer);
    return buffer.toString();
  }

  /// Prints the contents of a [Cursor]'s current row to a string buffer.
  ///
  /// See: https://developer.android.com/reference/android/database/DatabaseUtils#dumpCurrentRowToString(android.database.Cursor)
  static Future<void> dumpCurrentRowToStringBuffer(
      final Cursor cursor, final StringBuffer buffer) async {
    assert(_platform.isAndroid);

    buffer.write("[");
    for (var columnIndex = 0;
        columnIndex < cursor.getColumnCount();
        columnIndex++) {
      if (columnIndex > 0) buffer.write(", ");
      switch (cursor.getType(columnIndex)) {
        case Cursor.FIELD_TYPE_NULL:
          buffer.write("null");
          break;
        case Cursor.FIELD_TYPE_INTEGER:
          buffer.write(cursor.getLong(columnIndex));
          break;
        case Cursor.FIELD_TYPE_FLOAT:
          buffer.write(cursor.getDouble(columnIndex));
          break;
        case Cursor.FIELD_TYPE_STRING:
          buffer.write(cursor.getString(columnIndex));
          break;
        case Cursor.FIELD_TYPE_BLOB:
          buffer.write(cursor.getBlob(columnIndex));
          break;
        default:
          assert(false); // unreachable
          throw AssertionError();
      }
    }
    buffer.write("]");
  }

  /// Prints the contents of a [Cursor] to standard output.
  ///
  /// The position is restored after printing.
  ///
  /// See: https://developer.android.com/reference/android/database/DatabaseUtils#dumpCursor(android.database.Cursor)
  static Future<void> dumpCursor(final Cursor cursor) async {
    assert(_platform.isAndroid);

    final position = cursor.getPosition();
    while (cursor.moveToNext()) {
      print(await dumpCurrentRowToString(cursor));
    }
    cursor.moveToPosition(position);
  }

  /// Prints the contents of a [Cursor] to a string.
  ///
  /// The position is restored after printing.
  ///
  /// See: https://developer.android.com/reference/android/database/DatabaseUtils#dumpCursorToString(android.database.Cursor)
  static Future<String> dumpCursorToString(final Cursor cursor) async {
    assert(_platform.isAndroid);

    final buffer = StringBuffer();

    final position = cursor.getPosition();
    while (cursor.moveToNext()) {
      await dumpCurrentRowToStringBuffer(cursor, buffer);
      buffer.writeln();
    }
    cursor.moveToPosition(position);

    return buffer.toString();
  }
}
