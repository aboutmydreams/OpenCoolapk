import 'package:flutter/material.dart' show runApp;
import 'package:flutter/material.dart';
import 'package:opencoolapk/main.dart' show OpenCoolapk;
import 'package:flutter/foundation.dart' show debugDefaultTargetPlatformOverride;

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(OpenCoolapk());
}