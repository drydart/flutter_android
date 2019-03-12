/* This is free and unencumbered software released into the public domain. */

import 'dart:async' show Future;
import 'dart:io' show Directory;

import 'package:flutter/services.dart' show MethodChannel;
import 'package:platform/platform.dart' show Platform, LocalPlatform;

const Platform _platform = LocalPlatform();

/// Provides access to environment variables.
///
/// See: https://developer.android.com/reference/android/os/Environment
abstract class Environment {
  static const MethodChannel _channel =
      MethodChannel('flutter_android/Environment');

  /// Standard directory in which to place any audio files that should be in the regular list of music for the user.
  ///
  /// See: https://developer.android.com/reference/android/os/Environment#DIRECTORY_MUSIC
  static const String DIRECTORY_MUSIC = "Music";

  /// Standard directory in which to place any audio files that should be in the list of podcasts that the user can select (not as regular music).
  ///
  /// See: https://developer.android.com/reference/android/os/Environment#DIRECTORY_PODCASTS
  static const String DIRECTORY_PODCASTS = "Podcasts";

  /// Standard directory in which to place any audio files that should be in the list of ringtones that the user can select (not as regular music).
  ///
  /// See: https://developer.android.com/reference/android/os/Environment#DIRECTORY_RINGTONES
  static const String DIRECTORY_RINGTONES = "Ringtones";

  /// Standard directory in which to place any audio files that should be in the list of alarms that the user can select (not as regular music).
  ///
  /// See: https://developer.android.com/reference/android/os/Environment#DIRECTORY_ALARMS
  static const String DIRECTORY_ALARMS = "Alarms";

  /// Standard directory in which to place any audio files that should be in the list of notifications that the user can select (not as regular music).
  ///
  /// See: https://developer.android.com/reference/android/os/Environment#DIRECTORY_NOTIFICATIONS
  static const String DIRECTORY_NOTIFICATIONS = "Notifications";

  /// Standard directory in which to place pictures that are available to the user.
  ///
  /// See: https://developer.android.com/reference/android/os/Environment#DIRECTORY_PICTURES
  static const String DIRECTORY_PICTURES = "Pictures";

  /// Standard directory in which to place movies that are available to the user.
  ///
  /// See: https://developer.android.com/reference/android/os/Environment#DIRECTORY_MOVIES
  static const String DIRECTORY_MOVIES = "Movies";

  /// Standard directory in which to place files that have been downloaded by the user.
  ///
  /// See: https://developer.android.com/reference/android/os/Environment#DIRECTORY_DOWNLOADS
  static const String DIRECTORY_DOWNLOADS = "Download";

  /// The traditional location for pictures and videos when mounting the device as a camera.
  ///
  /// See: https://developer.android.com/reference/android/os/Environment#DIRECTORY_DCIM
  static const String DIRECTORY_DCIM = "DCIM";

  /// Standard directory in which to place documents that have been created by the user.
  ///
  /// See: https://developer.android.com/reference/android/os/Environment#DIRECTORY_DOCUMENTS
  static const String DIRECTORY_DOCUMENTS = "Documents";

  /// Unknown storage state, such as when a path isn't backed by known storage media.
  ///
  /// See: https://developer.android.com/reference/android/os/Environment#MEDIA_UNKNOWN
  static const String MEDIA_UNKNOWN = "unknown";

  /// Storage state if the media is not present.
  ///
  /// See: https://developer.android.com/reference/android/os/Environment#MEDIA_REMOVED
  static const String MEDIA_REMOVED = "removed";

  /// Storage state if the media is present but not mounted.
  ///
  /// See: https://developer.android.com/reference/android/os/Environment#MEDIA_UNMOUNTED
  static const String MEDIA_UNMOUNTED = "unmounted";

  /// Storage state if the media is present and being disk-checked.
  ///
  /// See: https://developer.android.com/reference/android/os/Environment#MEDIA_CHECKING
  static const String MEDIA_CHECKING = "checking";

  /// Storage state if the media is present but is blank or is using an unsupported filesystem.
  ///
  /// See: https://developer.android.com/reference/android/os/Environment#MEDIA_NOFS
  static const String MEDIA_NOFS = "nofs";

  /// Storage state if the media is present and mounted at its mount point with read/write access.
  ///
  /// See: https://developer.android.com/reference/android/os/Environment#MEDIA_MOUNTED
  static const String MEDIA_MOUNTED = "mounted";

  /// Storage state if the media is present and mounted at its mount point with read-only access.
  ///
  /// See: https://developer.android.com/reference/android/os/Environment#MEDIA_MOUNTED_READ_ONLY
  static const String MEDIA_MOUNTED_READ_ONLY = "mounted_ro";

  /// Storage state if the media is present not mounted, and shared via USB mass storage.
  ///
  /// See: https://developer.android.com/reference/android/os/Environment#MEDIA_SHARED
  static const String MEDIA_SHARED = "shared";

  /// Storage state if the media was removed before it was unmounted.
  ///
  /// See: https://developer.android.com/reference/android/os/Environment#MEDIA_BAD_REMOVAL
  static const String MEDIA_BAD_REMOVAL = "bad_removal";

  /// Storage state if the media is present but cannot be mounted.
  ///
  /// See: https://developer.android.com/reference/android/os/Environment#MEDIA_UNMOUNTABLE
  static const String MEDIA_UNMOUNTABLE = "unmountable";

  /// Storage state if the media is in the process of being ejected.
  ///
  /// See: https://developer.android.com/reference/android/os/Environment#MEDIA_EJECTING
  static const String MEDIA_EJECTING = "ejecting";

  /// Return the user data directory.
  ///
  /// See: https://developer.android.com/reference/android/os/Environment#getDataDirectory()
  static Future<Directory> get dataDirectory async {
    assert(_platform.isAndroid);
    return Directory(await _channel.invokeMethod('getDataDirectory') as String);
  }

  /// Return the download/cache content directory.
  ///
  /// See: https://developer.android.com/reference/android/os/Environment#getDownloadCacheDirectory()
  static Future<Directory> get downloadCacheDirectory async {
    assert(_platform.isAndroid);
    return Directory(
        await _channel.invokeMethod('getDownloadCacheDirectory') as String);
  }

  /// Return the primary shared/external storage directory.
  ///
  /// This directory may not currently be accessible if it has been mounted by
  /// the user on their computer, has been removed from the device, or some
  /// other problem has happened. You can determine its current state with
  /// [externalStorageState].
  ///
  /// See: https://developer.android.com/reference/android/os/Environment#getExternalStorageDirectory()
  static Future<Directory> get externalStorageDirectory async {
    assert(_platform.isAndroid);
    return Directory(
        await _channel.invokeMethod('getExternalStorageDirectory') as String);
  }

  /// Returns the current state of the primary shared/external storage media.
  ///
  /// See: https://developer.android.com/reference/android/os/Environment#getExternalStorageState()
  static Future<String> get externalStorageState async {
    assert(_platform.isAndroid);
    return await _channel.invokeMethod('getExternalStorageState')
        as String; // TODO: enum values
  }

  /// Return root of the "system" partition holding the core Android OS. Always
  /// present and mounted read-only.
  ///
  /// See: https://developer.android.com/reference/android/os/Environment#getRootDirectory()
  static Future<Directory> get rootDirectory async {
    assert(_platform.isAndroid);
    return Directory(await _channel.invokeMethod('getRootDirectory') as String);
  }

  /// Returns whether the primary shared/external storage media is emulated.
  ///
  /// See: https://developer.android.com/reference/android/os/Environment#isExternalStorageEmulated()
  static Future<bool> get isExternalStorageEmulated async {
    assert(_platform.isAndroid);
    return await _channel.invokeMethod('isExternalStorageEmulated') as bool;
  }

  /// Returns whether the primary shared/external storage media is physically
  /// removable.
  ///
  /// See: https://developer.android.com/reference/android/os/Environment#isExternalStorageRemovable()
  static Future<bool> get isExternalStorageRemovable async {
    assert(_platform.isAndroid);
    return await _channel.invokeMethod('isExternalStorageRemovable') as bool;
  }
}
