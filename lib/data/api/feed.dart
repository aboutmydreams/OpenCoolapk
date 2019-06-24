import 'package:opencoolapk/data/model/feed/detail.dart';
import 'package:opencoolapk/data/model/feed/indexV8_list.dart';
import 'package:opencoolapk/data/model/feed/reply.dart';

import 'api.dart';

class ReplyListSortType {
  static const LASTUPDATE_DESC = "lastupdate_desc";
  static const DATELINE_DESC = "dateline_desc";
  static const POPULAR = "popular";
}

class ReplyListFeedType {
  static const FEED = "feed";
}

class FeedApi {
  static Future<IndexV8List> indexV8({page: "1", lastItem: ""}) async {
    try {
      var resp = await Api.getI("/main/indexV8",
          params: {"page": page, "lastItem": lastItem});
      return Future.value(IndexV8List.fromJson(resp.data));
    } catch (e) {
      return Future.error(e);
    }
  }

  static Future<FeedDetail> detail(String feedId) async {
    try {
      var resp = await Api.getI("/feed/detail", params: {"id": feedId});
      return Future.value(FeedDetail.fromJson(resp.data['data']));
    } catch (e) {
      return Future.error(e);
    }
  }

  static Future<FeedReply> replies(String id,
      {page: "1",
      listType: ReplyListSortType.POPULAR,
      discussMode: "1",
      feedType: ReplyListFeedType.FEED,
      blockStatus: "0", // 0
      fromFeedAuthor: "0", // 只看作者
      firstItem: "",
      lastItem: ""}) async {
    try {
      var resp = await Api.getI("/feed/replyList", params: {
        "id": id,
        "page": page,
        "lastItem": lastItem,
        "listType": listType,
        "discussMode": discussMode,
        "feedType": feedType,
        "blockStatus": blockStatus,
        "fromFeedAuthor": fromFeedAuthor,
        "firstItem": firstItem
      });
      return Future.value(FeedReply.fromJson(resp.data));
    } catch (e) {
      return Future.error(e);
    }
  }
}
