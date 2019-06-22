import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:opencoolapk/data/model/feed/indexV8_list.dart';

import 'api.dart';

class AuthApi {
  static Future<IndexV8List> login(AuthRequest authRequest) async {
    try {
      var resp = await Api.postUri(Uri.https("account.coolapk.com", "/auth/loginByCoolapk"), data: {
        "submit": "1",
        "requestHash": authRequest.requestHash,
        "login": authRequest.account,
        "password": authRequest.passwd,
        "captcha": authRequest.captcha,
        "randomNumber": authRequest.randNum
      }, needHeader: false);
      return Future.value(IndexV8List.fromJson(resp.data));
    }catch(e) {
      return Future.error(e);
    }
  }
}

class AuthRequest {

  String account;
  String passwd;
  String captcha;

  String requestHash;

  String randNum = Random().nextInt(9999999).toString();

  String getCaptchaImageUrl() {
    return Uri.https("account.coolapk.com", "/auth/showCaptchaImage").toString();
  }

  List<Cookie> getHeader() {
    return Api.cjar.loadForRequest(Uri.https("coolapk.com", ""));
  }

  // 必须
  Future<String> getRequestHash() async {
    try {
      var resp = await Api.getUri(Uri.https("account.coolapk.com", "/auth/loginByCoolapk"));
      this.requestHash = jsonDecode(resp.data)["requestHash"];
      return Future.value(requestHash);
    }catch(e) {
      return Future.error(e);
    }
  }
}
