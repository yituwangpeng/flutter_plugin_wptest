import 'dart:async';

import 'package:flutter/services.dart';

enum ToastDuration {
  short, long
}

class FlutterPluginWptest {
  static const MethodChannel _channel =
      const MethodChannel('flutter_plugin_wptest');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<bool> alert(String msg, ToastDuration duration) async {
    var argument = {
      'content': msg,
      'duration': duration.toString()
    };
    // 本地方法是一个异步调用
    // 方法里面处理的方法名
    var success = await _channel.invokeMethod('alert', argument);
    return success;
  }
}
