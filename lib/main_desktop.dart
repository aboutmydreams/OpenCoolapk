import 'package:flutter/material.dart' show runApp;
import 'package:flutter/material.dart';
import 'package:opencoolapk/main.dart' show OpenCoolapk;
import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;
import 'package:opencoolapk/redux/global.dart';
import 'package:redux/redux.dart';

import 'data/api/api.dart';

// hover使用这个文件作为入口
// hover: https://github.com/go-flutter-desktop/hover

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  Api.init();
  final store = Store<GlobalState>(GlobalState.reducer, initialState: GlobalState.init());
  runApp(OpenCoolapk(store));
}
