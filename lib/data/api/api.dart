import 'dart:io';
import 'package:uuid/uuid.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:cookie_jar/cookie_jar.dart';

class Api {
  static CookieJar cjar = PersistCookieJar(dir: "./cookies");
  static final Dio dio = Dio();
  static bool _inited = false;

  static init() {
    cjar = CookieJar(ignoreExpires: true);
    dio.interceptors.add(CookieManager(cjar)); // 妈的，没用的东西
    cjar.saveFromResponse(Uri.https("api.coolapk.com", ""), [
      Cookie("CONTAINERID",
          "4e5f0b1a2e32f938a6519f55dd77765b70002fbb8133e5730bbe80f581b8e536|XQhuo|XQhue"),
      Cookie("sec_tc", "AQAAAJSicE9VgAEAq1MWyuDtcSLw+WlZ")
    ]);

    dio.options.connectTimeout = 3000;
    dio.options.receiveTimeout = 3000;
    dio.options.sendTimeout = 3000;
    dio.options.baseUrl = "https://api.coolapk.com/v6";
    print("api init");
    _inited = true;
  }

  static setCookie(uri, key, value) {
    cjar.saveFromResponse(uri, [Cookie(key, value)]);
  }

  static setCookies(uri, List<Cookie> cookies) {
    cjar.saveFromResponse(uri, cookies);
  }

  static Future<Response> getI(path,
      {Map<String, dynamic> params,
      Map<String, dynamic> data,
      ContentType ctype}) {
    if (!_inited) init();
    return dio.get(
      path,
      queryParameters: params,
      options: Options(
          cookies: cjar.loadForRequest(Uri.parse(dio.options.baseUrl + path)),
          headers: buildHeader(),
          contentType: ctype ?? ContentType.json),
    );
  }

  static Future<Response> getUri(Uri uri, {ResponseType responseType}) {
    if (!_inited) init();
    return dio.getUri(uri,
        options: Options(
            cookies: cjar.loadForRequest(uri),
            headers: buildHeader(),
            responseType: responseType));
  }

  static Future<Response> postUri(Uri uri,
      {Map<String, dynamic> data, ContentType ctype, needHeader: true}) {
    if (!_inited) init();
    return dio.postUri(
      uri,
      data: FormData.from(data),
      options: Options(
        cookies: cjar.loadForRequest(uri),
          headers: needHeader ? buildHeader() : {},
          contentType:
              ctype ?? ContentType.parse("application/x-www-form-urlencoded")),
    );
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
        cookies: cjar.loadForRequest(Uri.parse(dio.options.baseUrl + path)),
          headers: buildHeader(),
          contentType:
              ctype ?? ContentType.parse("application/x-www-form-urlencoded")),
    );
  }

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
}
