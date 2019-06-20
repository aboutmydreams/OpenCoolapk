import 'dart:convert';
import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:uuid/uuid.dart';

class Api {
  static CookieJar cjar = CookieJar();
  static Dio dio = Dio();
  static bool _inited = false;

  static buildHeader() {
    return {
      "X-App-Id": "com.coolapk.market",
      "X-Requested-With": "XMLHttpRequest",
      "X-Api-Version": "9",
      "X-App-Code": "1902151",
      "X-App-Version": "9.0.2",
      "X-Sdk-Int": "22",
      "X-Sdk-Locale": "zh-CN",
      "X-App-Token": buildToken()
    };
  }

  static String buildToken() {
    var t = "token://com.coolapk.market/c67ef5943784d09750dcfbb31020f0ab?";
    var did = Uuid().v4();
    var pn = "com.coolapk.market";

    var ts = (DateTime.now().millisecondsSinceEpoch / 1000).round();
    var salt = t +
        md5.convert(utf8.encode(ts.toString())).toString() +
        "\$" +
        did +
        "&" +
        pn;
    var saltMd5 =
        md5.convert(utf8.encode(base64.encode(utf8.encode(salt)))).toString();
    var hexTime = "0x" + ts.toRadixString(16);
    return saltMd5 + did + hexTime;
  }

  static Future<Response> get(path,
      {Map<String, dynamic> params,
      Map<String, dynamic> data,
      ContentType ctype}) {
    if (!_inited) init();
    return dio.get(
      path,
      queryParameters: params,
      options: Options(
          headers: buildHeader(), contentType: ctype ?? ContentType.json),
    );
  }

  static Future<Response> getUri(Uri uri) {
    if (!_inited) init();
    return dio.getUri(uri, options: Options(headers: buildHeader()));
  }

  static init() {
    cjar = CookieJar(ignoreExpires: true);
    dio.interceptors.add(CookieManager(cjar));
    cjar.saveFromResponse(Uri.https("api.coolapk.com", ""), [
      Cookie("CONTAINERID",
          "4e5f0b1a2e32f938a6519f55dd77765b70002fbb8133e5730bbe80f581b8e536|XQhuo|XQhue"),
      Cookie("sec_tc", "AQAAAJSicE9VgAEAq1MWyuDtcSLw+WlZ")
    ]);

    dio.options.connectTimeout = 2000;
    dio.options.receiveTimeout = 2000;
    dio.options.sendTimeout = 2000;
    dio.options.baseUrl = "https://api.coolapk.com/v6";
    _inited = true;
  }

  static post(path,
      {Map<String, dynamic> params,
      Map<String, dynamic> data,
      ContentType ctype}) {
    if (!_inited) init();
    return dio.post(
      path,
      data: FormData.from(data),
      queryParameters: params,
      options: Options(
          headers: buildHeader(),
          contentType:
              ctype ?? ContentType.parse("application/x-www-form-urlencoded")),
    );
  }

  static Future<Response> postUri(Uri uri,
      {Map<String, dynamic> data, ContentType ctype}) {
    if (!_inited) init();
    return dio.postUri(
      uri,
      data: FormData.from(data),
      options: Options(
          headers: buildHeader(),
          contentType:
              ctype ?? ContentType.parse("application/x-www-form-urlencoded")),
    );
  }
}
