import 'package:opencoolapk/data/model/user.dart';

import 'api.dart';

class UserApi {
  static Future<UserInfo> getLoggedUserInfo(uid) async {
    try {
      var resp = await Api.getI("/user/space", params: {"uid": uid});
      if (resp.data['message'] == null) {
        return Future.value(UserInfo.fromJson(resp.data['data']));
      } else {
        throw new Exception(resp.data['message']);
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  static Future<NotLoginUserInfo> getUserInfo(uid) async {
    try {
      var resp = await Api.getI("/user/space", params: {"uid": uid});
      if (resp.data['message'] == null) {
        return Future.value(NotLoginUserInfo.fromJson(resp.data['data']));
      } else {
        throw new Exception(resp.data['message']);
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
