import 'package:opencoolapk/data/model/user.dart';

enum Action { LOGGED, LOGOUT }

class GlobalState {
  UserInfo user;
  bool get logged => user != null;

  UserInfo get nowUser => user;

  GlobalState.init() {
    user = null;
    _instance = this;
  }

  static GlobalState _instance;
  static get instance => _instance;

  static GlobalState reducer(GlobalState state, action) {
    switch (action) {
      case Action.LOGGED:
        // 此时相关cookie已经保存了，用户数据也在login页面获取了，且已经设置上了
        break;
    }
    return state;
  }
}
