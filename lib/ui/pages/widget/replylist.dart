import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/image_properties.dart';
import 'package:opencoolapk/data/api/feed.dart';
import 'package:opencoolapk/data/model/feed/reply.dart' show Data;
import 'package:opencoolapk/ui/pages/widget/picbox.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FeedReplyList extends StatefulWidget {
  final String feedId;
  FeedReplyList(this.feedId, {Key key}) : super(key: key);

  _ReplyListState createState() => _ReplyListState();
}

class _ReplyListState extends State<FeedReplyList> {
  int page = 1;
  List<Data> replies = [];

  String get firstItem {
    return replies.length > 0 ? replies[0].entityId.toString() : "";
  }

  String get lastItem {
    return replies.length > 0
        ? replies[replies.length - 1].entityId.toString()
        : "";
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<Null> fetchData(
      {page: "1",
      refresh: true,
      authorOnly: false,
      String sortType: ReplyListSortType.POPULAR}) async {
    if (refresh) {
      this.replies.removeWhere((test) {
        return true;
      });
    }
    var resp = await FeedApi.replies(widget.feedId,
        page: page,
        firstItem: firstItem,
        lastItem: lastItem,
        listType: sortType,
        fromFeedAuthor: authorOnly ? "1" : "0");
    if (resp.data.length <= 0) {
      setState(() {
        this.replies.add(Data(message: "没有了~"));
      });
      return;
    }
    setState(() {
      this.replies.addAll(resp.data);
      this.replies.add(Data(message: "加载更多"));
    });
  }

  Future<Null> nextPage() async {
    replies.removeLast();
    page++;
    await fetchData(page: page.toString(), refresh: false);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, idx) {
        return Divider();
      },
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: replies.length,
      itemBuilder: (context, pos) {
        return Container(
          child: FeedReplyItem(replies[pos], nextPage, (targetId) {
            // 回复窗口构建;
            showBottomSheet(
                context: context,
                builder: (context) {
                  //TODO: 回复
                  return Card(
                    child: Container(
                      padding: EdgeInsets.all(16),
                      width: double.maxFinite,
                      child: Text("回复功能待实现. targetId$targetId"),
                    ),
                  );
                });
          }),
        );
      },
    );
  }
}

class FeedReplyItem extends StatelessWidget {
  final Function loadMore;
  final Data replyData;
  final Function(String targetId) onReplyInputBuild;
  const FeedReplyItem(this.replyData, this.loadMore, this.onReplyInputBuild,
      {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (replyData.username == null) {
      return Container(
        margin: EdgeInsets.only(bottom: 66),
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        width: double.maxFinite,
        child: FlatButton(
          child: Text(replyData.message),
          onPressed: loadMore,
        ),
      );
    }
    return Container(
      child: Card(
        elevation: 0,
        child: InkWell(
          onTap: () {
            onReplyInputBuild(replyData.entityId.toString());
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                    replyData.userAvatar,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(5),
                    ),
                    Text(
                      replyData.username + ":",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    Padding(
                      padding: EdgeInsets.all(3),
                    ),
                    Html(
                      data: replyData.message,
                      defaultTextStyle: TextStyle(fontSize: 15),
                      linkStyle: TextStyle(
                        color: Theme.of(context).primaryColor.withOpacity(0.9),
                      ),
                      onLinkTap: (value) {
                        // TODO: handler
                        if (value.startsWith("http")) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("复制链接"),
                                content: TextField(
                                  controller:
                                      TextEditingController(text: value),
                                ),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text("取消"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  )
                                ],
                              );
                            },
                          );
                        }
                      },
                    ),
                    replyData.pic.length >= 3
                        ? InkWell(
                            child: LimitedBox(
                              maxHeight:
                                  MediaQuery.of(context).size.height / 3.2,
                              child: Image.network(replyData.pic),
                            ),
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return PicBox([replyData.pic]);
                              }));
                            },
                          )
                        : const SizedBox(),
                    Padding(
                      padding: EdgeInsets.all(5),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 12),
                      color: Theme.of(context).primaryColor.withOpacity(0.07),
                      child: _innerReply(onReplyInputBuild),
                    ),
                  ],
                ),
              ),
              PopupMenuButton(
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      value: "test",
                      child: Text("test"),
                    )
                  ];
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  _innerReply(onReplyInputBuild) {
    return Builder(
      builder: (context) {
        var rereplies = replyData.replyRows;
        return ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          separatorBuilder: (context, idx) {
            return Divider(
              height: 4,
            );
          },
          itemCount: rereplies.length,
          itemBuilder: (context, pos) {
            var nowRereply = rereplies[pos];
            return InkWell(
                onTap: () {
                  onReplyInputBuild(nowRereply.entityId.toString());
                },
                child: Html(
                  padding: EdgeInsets.all(4),
                  data: ("<a>" + nowRereply.username + "</a>") +
                      (" 回复 <a>" + nowRereply.rusername + ": </a>") +
                      (nowRereply.message == "[图片]"
                          ? "<a href='图片'>[图片]</a><img src='${nowRereply.pic}'/>"
                          : nowRereply.message),
                  linkStyle: TextStyle(
                    color: Theme.of(context).primaryColor.withOpacity(0.9),
                  ),
                  onLinkTap: (value) {
                    if (value == "图片") {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return PicBox([nowRereply.pic]);
                      }));
                    }
                    // TODO: handle tap event
                  },
                  imageProperties: ImageProperties(
                      fit: BoxFit.contain,
                      width: double.maxFinite,
                      height: 66,
                      alignment: Alignment.topLeft),
                ));
          },
        );
      },
    );
  }
}
