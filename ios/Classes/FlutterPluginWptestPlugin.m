#import "FlutterPluginWptestPlugin.h"

@implementation FlutterPluginWptestPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutter_plugin_wptest"
            binaryMessenger:[registrar messenger]];
  FlutterPluginWptestPlugin* instance = [[FlutterPluginWptestPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else if ([@"alert" isEqualToString:call.method]) {
      NSString *message = call.arguments[@"content"];
      if (message.length == 0) {
          return;
      }
      UIAlertView *alerView = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
      [alerView show];
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
