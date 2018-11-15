/* This is free and unencumbered software released into the public domain. */

/// Contains classes to explore data returned through a content provider.
///
/// See: https://developer.android.com/reference/android/database/package-summary
///
/// {@canonicalFor cursor.Cursor}
/// {@canonicalFor database_utils.DatabaseUtils}
/// {@canonicalFor exceptions.CursorIndexOutOfBoundsException}
/// {@canonicalFor exceptions.SQLException}
library android_database;

export 'src/database/cursor.dart' show Cursor;
export 'src/database/database_utils.dart' show DatabaseUtils;
export 'src/database/exceptions.dart' show CursorIndexOutOfBoundsException, SQLException;
