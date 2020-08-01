#import "FlutterAndroidPlugin.h"
#if __has_include(<flutter_android/flutter_android-Swift.h>)
#import <flutter_android/flutter_android-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_android-Swift.h"
#endif

@implementation FlutterAndroidPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterAndroidPlugin registerWithRegistrar:registrar];
}
@end
