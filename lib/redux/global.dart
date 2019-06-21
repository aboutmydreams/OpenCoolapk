import 'dart:async';

import 'package:opencoolapk/data/model/user.dart';

enum Action {
  LOGIN,
  LOGOUT
}

class GlobalState {

  UserInfo _user;
  bool get logged => _user != null;

  UserInfo get  nowUser => _user;

  GlobalState.init() {
    _user = null;
  }

  static GlobalState _instance;
  static get instance => _instance;
}