#import "FlutterAndroidPlugin.h"
#import <flutter_android/flutter_android-Swift.h>

@implementation FlutterAndroidPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterAndroidPlugin registerWithRegistrar:registrar];
}
@end
