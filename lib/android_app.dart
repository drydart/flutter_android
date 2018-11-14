/* This is free and unencumbered software released into the public domain. */

/// Contains high-level classes encapsulating the overall Android application
/// model.
///
/// See: https://developer.android.com/reference/android/app/package-summary
library android_app;

export 'src/app/activity.dart' show Activity;
export 'src/app/activity_manager.dart' show ActivityManager;
export 'src/app/alarm_manager.dart' show AlarmManager;
export 'src/app/download_manager.dart' show DownloadManager;
export 'src/app/exceptions.dart' show AuthenticationRequiredException;
export 'src/app/keyguard_manager.dart' show KeyguardManager;
export 'src/app/notification.dart' show Notification;
export 'src/app/notification_builder.dart' show NotificationBuilder;
export 'src/app/notification_manager.dart' show NotificationManager;
export 'src/app/search_manager.dart' show SearchManager;
export 'src/app/wallpaper_colors.dart' show WallpaperColors;
export 'src/app/wallpaper_info.dart' show WallpaperInfo;
export 'src/app/wallpaper_manager.dart' show WallpaperManager;
