import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;
import 'package:flutter/material.dart' show runApp;
import 'package:flutter/material.dart';
import 'package:opencoolapk/main.dart' show OpenCoolapk;

// hover使用这个文件作为入口
// hover: https://github.com/go-flutter-desktop/hover

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(OpenCoolapk());
}
