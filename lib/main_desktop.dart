import 'package:flutter/material.dart' show runApp;
import 'package:flutter/material.dart';
import 'package:opencoolapk/main.dart' show OpenCoolapk;
import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;
import 'package:opencoolapk/redux/global.dart';
import 'package:redux/redux.dart';

import 'data/api/api.dart';

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  Api.init();
  final store = Store<GlobalState>(reducer, initialState: GlobalState.init());
  runApp(OpenCoolapk(store));
}

GlobalState reducer(GlobalState state, action) {
  switch (action) {
    case Action.LOGIN:
      break;
  }
  return state;
}
