/* This is free and unencumbered software released into the public domain. */

/// Retrieve overall information about the space on a filesystem.
///
/// This is a wrapper for Unix `statvfs()`.
///
/// See: https://developer.android.com/reference/android/os/StatFs
class StatFs {
  /// The filesystem path being examined.
  final String path;

  /// Construct a new `StatFs` for looking at the stats of the filesystem at
  /// path.
  ///
  /// Upon construction, the stat of the file system will be performed, and the
  /// values retrieved available from the methods on this class.
  ///
  /// See: https://developer.android.com/reference/android/os/StatFs#StatFs(java.lang.String)
  StatFs(this.path);

  /// The number of blocks that are free on the file system and available to
  /// applications.
  ///
  /// See: https://developer.android.com/reference/android/os/StatFs#getAvailableBlocksLong()
  int get availableBlocks {
    return null; // TODO
  }

  /// The number of bytes that are free on the file system and available to
  /// applications.
  ///
  /// See: https://developer.android.com/reference/android/os/StatFs#getAvailableBytes()
  int get availableBytes {
    return null; // TODO
  }

  /// The total number of blocks on the file system.
  ///
  /// See: https://developer.android.com/reference/android/os/StatFs#getBlockCountLong()
  int get blockCount {
    return null; // TODO
  }

  /// The size, in bytes, of a block on the file system.
  ///
  /// See: https://developer.android.com/reference/android/os/StatFs#getBlockSizeLong()
  int get blockSize {
    return null; // TODO
  }

  /// The total number of blocks that are free on the file system, including
  /// reserved blocks (that are not available to normal applications).
  ///
  /// See: https://developer.android.com/reference/android/os/StatFs#getFreeBlocksLong()
  int get freeBlocks {
    return null; // TODO
  }

  /// The number of bytes that are free on the file system, including reserved
  /// blocks (that are not available to normal applications).
  ///
  /// See: https://developer.android.com/reference/android/os/StatFs#getFreeBytes()
  int get freeBytes {
    return null; // TODO
  }

  /// The total number of bytes supported by the file system.
  ///
  /// See: https://developer.android.com/reference/android/os/StatFs#getTotalBytes()
  int get totalBytes {
    return null; // TODO
  }
}
