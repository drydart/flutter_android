/* This is free and unencumbered software released into the public domain. */

import 'dart:async' show Future;
import 'dart:typed_data' show Uint8List;

import '../os/bundle.dart' show Bundle;

/// This interface provides random read-write access to the result set returned
/// by a database query.
///
/// Cursor implementations are not required to be synchronized so code using a
/// [Cursor] from multiple threads should perform its own synchronization when
/// using the [Cursor].
///
/// See: https://developer.android.com/reference/android/database/Cursor
abstract class Cursor extends Iterable<Map<String, dynamic>> {
  /// Value returned by [getType()] if the specified column type is blob.
  ///
  /// See: https://developer.android.com/reference/android/database/Cursor#FIELD_TYPE_BLOB
  static const int FIELD_TYPE_BLOB = 4;

  /// Value returned by [getType()] if the specified column type is float.
  ///
  /// See: https://developer.android.com/reference/android/database/Cursor#FIELD_TYPE_FLOAT
  static const int FIELD_TYPE_FLOAT = 2;

  /// Value returned by [getType()] if the specified column type is integer.
  ///
  /// See: https://developer.android.com/reference/android/database/Cursor#FIELD_TYPE_INTEGER
  static const int FIELD_TYPE_INTEGER = 1;

  /// Value returned by [getType()] if the specified column is null.
  ///
  /// See: https://developer.android.com/reference/android/database/Cursor#FIELD_TYPE_NULL
  static const int FIELD_TYPE_NULL = 0;

  /// Value returned by [getType()] if the specified column type is string.
  ///
  /// See: https://developer.android.com/reference/android/database/Cursor#FIELD_TYPE_STRING
  static const int FIELD_TYPE_STRING = 3;

  /// The total number of columns.
  ///
  /// This is simply a Dart-idiomatic getter alias for [getColumnCount()].
  int get columnCount => getColumnCount();

  /// The names of all of the columns in the result set in the order in which
  /// they were listed in the result.
  ///
  /// This is simply a Dart-idiomatic getter alias for [getColumnNames()].
  List<String> get columnNames => getColumnNames();

  /// The number of rows in the cursor.
  ///
  /// This is simply a Dart-idiomatic getter alias for [getCount()].
  int get count => getCount();

  /// A bundle of extra values.
  ///
  /// This is simply a Dart-idiomatic getter alias for [getExtras()].
  Bundle get extras => getExtras();

  @override
  bool get isEmpty => getCount() == 0;

  @override
  int get length => getCount();

  /// The URI at which notifications of changes in this cursor's data will be
  /// delivered.
  ///
  /// This is simply a Dart-idiomatic getter alias for [getNotificationUri()].
  Uri get notificationUri => getNotificationUri();

  /// The current position of the cursor in the row set.
  ///
  /// This is simply a Dart-idiomatic getter alias for [getPosition()].
  int get position => getPosition();

  /// Closes the cursor, releasing all of its resources and making it completely
  /// invalid.
  ///
  /// See: https://developer.android.com/reference/android/database/Cursor#close()
  Future<void> close() => Future.value();

  /// Returns the value of the requested column.
  dynamic get(final int columnIndex);

  /// Returns the value of the requested column as a byte array.
  ///
  /// See: https://developer.android.com/reference/android/database/Cursor#getBlob(int)
  Uint8List getBlob(final int columnIndex) => get(columnIndex);

  /// Returns the total number of columns.
  ///
  /// See: https://developer.android.com/reference/android/database/Cursor#getColumnCount()
  int getColumnCount() => getColumnNames().length;

  /// Returns the zero-based index for the given column name, or -1 if the
  /// column doesn't exist.
  ///
  /// See: https://developer.android.com/reference/android/database/Cursor#getColumnIndex(java.lang.String)
  int getColumnIndex(final String columnName) =>
      getColumnNames().indexOf(columnName);

  /// Returns the column name at the given zero-based column index.
  ///
  /// See: https://developer.android.com/reference/android/database/Cursor#getColumnName(int)
  String getColumnName(final int columnIndex) => getColumnNames()[columnIndex];

  /// Returns a string array holding the names of all of the columns in the
  /// result set in the order in which they were listed in the result.
  ///
  /// See: https://developer.android.com/reference/android/database/Cursor#getColumnNames()
  List<String> getColumnNames();

  /// Returns the number of rows in the cursor.
  ///
  /// See: https://developer.android.com/reference/android/database/Cursor#getCount()
  int getCount();

  /// Returns the value of the requested column as a double.
  ///
  /// See: https://developer.android.com/reference/android/database/Cursor#getDouble(int)
  double getDouble(final int columnIndex) => get(columnIndex);

  /// Returns a bundle of extra values.
  ///
  /// See: https://developer.android.com/reference/android/database/Cursor#getExtras()
  Bundle getExtras() => Bundle.EMPTY;

  /// Returns the value of the requested column as a float.
  ///
  /// See: https://developer.android.com/reference/android/database/Cursor#getFloat(int)
  double getFloat(final int columnIndex) => getDouble(columnIndex);

  /// Returns the value of the requested column as an int.
  ///
  /// See: https://developer.android.com/reference/android/database/Cursor#getInt(int)
  int getInt(final int columnIndex) => get(columnIndex);

  /// Returns the value of the requested column as a long.
  ///
  /// See: https://developer.android.com/reference/android/database/Cursor#getLong(int)
  int getLong(final int columnIndex) => getInt(columnIndex);

  /// Return the URI at which notifications of changes in this cursor's data
  /// will be delivered.
  ///
  /// See: https://developer.android.com/reference/android/database/Cursor#getNotificationUri()
  Uri getNotificationUri() => null;

  /// Returns the current position of the cursor in the row set.
  ///
  /// The value is zero-based. When the row set is first returned the cursor
  /// will be at position -1, which is before the first row. After the last row
  /// is returned another call to [moveToNext()] will leave the cursor past the
  /// last entry, at a position of [count].
  ///
  /// See: https://developer.android.com/reference/android/database/Cursor#getPosition()
  int getPosition();

  /// Returns the value of the requested column as a short.
  ///
  /// See: https://developer.android.com/reference/android/database/Cursor#getShort(int)
  int getShort(final int columnIndex) => getInt(columnIndex);

  /// Returns the value of the requested column as a string.
  ///
  /// See: https://developer.android.com/reference/android/database/Cursor#getString(int)
  String getString(final int columnIndex) => get(columnIndex);

  /// Returns data type of the given column's value.
  ///
  /// See: https://developer.android.com/reference/android/database/Cursor#getType(int)
  int getType(final int columnIndex) {
    final dynamic value = get(columnIndex);
    if (value == null) return FIELD_TYPE_NULL;
    if (value is int) return FIELD_TYPE_INTEGER;
    if (value is double) return FIELD_TYPE_FLOAT;
    if (value is String) return FIELD_TYPE_STRING;
    if (value is Uint8List) return FIELD_TYPE_BLOB;
    assert(false); // unreachable
    return null;
  }

  /// Returns whether the cursor is pointing to the position after the last row.
  ///
  /// See: https://developer.android.com/reference/android/database/Cursor#isAfterLast()
  bool get isAfterLast => getPosition() >= getCount();

  /// Returns whether the cursor is pointing to the position before the first
  /// row.
  ///
  /// See: https://developer.android.com/reference/android/database/Cursor#isBeforeFirst()
  bool get isBeforeFirst => getPosition() < 0;

  /// Returns `true` if the cursor is closed.
  ///
  /// See: https://developer.android.com/reference/android/database/Cursor#isClosed()
  bool get isClosed;

  /// Returns whether the cursor is pointing to the first row.
  ///
  /// See: https://developer.android.com/reference/android/database/Cursor#isFirst()
  bool get isFirst => getPosition() == 0;

  /// Returns whether the cursor is pointing to the last row.
  ///
  /// See: https://developer.android.com/reference/android/database/Cursor#isLast()
  bool get isLast => getPosition() == getCount() - 1;

  /// Returns `true` if the value in the indicated column is null.
  ///
  /// See: https://developer.android.com/reference/android/database/Cursor#isNull(int)
  bool isNull(final int columnIndex) => get(columnIndex) == null;

  /// Moves the cursor by a relative amount, forward or backward, from the
  /// current position.
  ///
  /// This method will return `true` if the requested destination was reachable,
  /// otherwise, it returns `false`.
  ///
  /// See: https://developer.android.com/reference/android/database/Cursor#move(int)
  bool move(final int offset) => moveToPosition(getPosition() + offset);

  /// Moves the cursor to the first row.
  ///
  /// See: https://developer.android.com/reference/android/database/Cursor#moveToFirst()
  bool moveToFirst() => getCount() > 0 && moveToPosition(0);

  /// Moves the cursor to the last row.
  ///
  /// See: https://developer.android.com/reference/android/database/Cursor#moveToLast()
  bool moveToLast() => getCount() > 0 && moveToPosition(getCount() - 1);

  /// Moves the cursor to the next row.
  ///
  /// This method will return false if the cursor is already past the last entry
  /// in the result set.
  ///
  /// See: https://developer.android.com/reference/android/database/Cursor#moveToNext()
  bool moveToNext() =>
      (getPosition() < getCount()) && move(1) && (getPosition() < getCount());

  /// Moves the cursor to an absolute position.
  ///
  /// The valid range of values is -1 <= [position] <= [count].
  ///
  /// See: https://developer.android.com/reference/android/database/Cursor#moveToPosition(int)
  bool moveToPosition(final int position);

  /// Moves the cursor to the previous row.
  ///
  /// See: https://developer.android.com/reference/android/database/Cursor#moveToPrevious()
  bool moveToPrevious() => (getPosition() >= 0) && move(-1);

  /// An iterator over the rows of this cursor.
  ///
  /// The rows are iterated from the current row to the last row.
  ///
  /// Note that this implementation does not support concurrent iterators,
  /// since the returned iterator mutates the cursor state.
  Iterator<Map<String, dynamic>> get iterator {
    return _CursorIterator(this);
  }
}

class _CursorIterator extends Iterator<Map<String, dynamic>> {
  final Cursor cursor;
  final List<String> _columnNames;
  Map<String, dynamic> _currentRow;

  _CursorIterator(this.cursor) : _columnNames = cursor.getColumnNames();

  @override
  bool moveNext() {
    if (!cursor.moveToNext()) {
      _currentRow = null;
      return false;
    }

    _currentRow = <String, dynamic>{};
    for (var columnIndex = 0;
        columnIndex < _columnNames.length;
        columnIndex++) {
      _currentRow[_columnNames[columnIndex]] = cursor.get(columnIndex);
    }
    return true;
  }

  @override
  Map<String, dynamic> get current => _currentRow;
}
