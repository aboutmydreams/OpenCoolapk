import 'package:opencoolapk/data/model/feed/indexV8_list.dart';

import 'api.dart';

class FeedApi {
  static Future<IndexV8List> indexV8({page: "1", lastItem: ""}) async {
    try {
      var resp = await Api.getI("/main/indexV8", params: {"page": page, "lastItem": lastItem});
      return Future.value(IndexV8List.fromJson(resp.data));
    } catch (e) {
      return Future.error(e);
    }
  }
}
