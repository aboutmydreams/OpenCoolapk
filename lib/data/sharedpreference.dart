import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

enum SharedPreferenceInitEvent { start, done }

class SharedPreference {
  SharedPreferences _prefs;
  StreamController<SharedPreferenceInitEvent> _streamCtr =
      StreamController<SharedPreferenceInitEvent>.broadcast();
  SharedPreference.init() {
    _streamCtr.sink.add(SharedPreferenceInitEvent.start);
    this.init();
    _instance = this;
  }
  init() async {
    _prefs = await SharedPreferences.getInstance();
    _streamCtr.sink.add(SharedPreferenceInitEvent.done);
  }

  setString(String key, String value) async {
    await prefs.setString(key, value);
  }

  getString(String key) {
    return prefs.getString(key);
  }

  static shutdown() {
    _instance._streamCtr.close();
  }

  static SharedPreference _instance;
  static SharedPreference get instance => _instance;
  static SharedPreferences get prefs => _instance._prefs;
  static StreamController get streamCtr => _instance._streamCtr;

  static removeUserLoginInfo() async {
    await SharedPreference.prefs.remove("sessid");
    await SharedPreference.prefs.remove("token");
    await SharedPreference.prefs.remove("uid");
    await SharedPreference.prefs.remove("un");
  }
}
