import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:opencoolapk/data/api/feed.dart';
import 'package:opencoolapk/data/model/feed/reply.dart' show Data;

class FeedReplyList extends StatefulWidget {
  final String feedId;
  FeedReplyList(this.feedId, {Key key}) : super(key: key);

  _ReplyListState createState() => _ReplyListState();
}

class _ReplyListState extends State<FeedReplyList> {
  int page;
  List<Data> replies = [];

  String get firstItem {
    return replies.length > 0 ? replies[0].entityId : "";
  }

  String get lastItem {
    return replies.length > 0 ? replies[replies.length - 1].entityId : "";
  }

  @override
  void initState() {
    super.initState();
  }

  Future<List<Data>> fetchData(page,
      {refresh: false,
      authorOnly: false,
      String sortType: ReplyListSortType.POPULAR}) async {
    if (refresh) {
      this.replies.removeWhere((test) {
        return true;
      });
    }
    return (await FeedApi.replies(widget.feedId,
            page: page,
            firstItem: firstItem,
            lastItem: lastItem,
            listType: sortType,
            fromFeedAuthor: authorOnly ? "1" : "0"))
        .data;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snap) {
        if (snap.hasData) {
          this.replies.addAll(snap.data);
          return ListView.separated(
            separatorBuilder: (context, idx) {
              return Divider();
            },
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: replies.length,
            itemBuilder: (context, pos) {
              return Container(
                child: FeedReplyItem(replies[pos]),
              );
            },
          );
        } else if (snap.hasError) {
          return Container(
            child: Center(
              child: Text("获取失败:" + snap.error.toString()),
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
      future: fetchData("1"),
    );
  }
}

class FeedReplyItem extends StatelessWidget {
  final Data replyData;
  const FeedReplyItem(this.replyData, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 0,
        child: InkWell(
          onTap: () {
            // TODO: handle click
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
                        ? LimitedBox(
                            maxHeight: MediaQuery.of(context).size.height / 3.2,
                            child: Image.network(replyData.pic),
                          )
                        : const SizedBox(),
                    Padding(
                      padding: EdgeInsets.all(5),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 12),
                      color: Theme.of(context).primaryColor.withOpacity(0.07),
                      child: _innerReply(),
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

  _innerReply() {
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
            return Html(
              padding: EdgeInsets.all(4),
              data: "<a>" +
                  nowRereply.username +
                  "</a>" +
                  " 回复 " +
                  "<a>" +
                  nowRereply.rusername +
                  ": " +
                  "</a>" +
                  nowRereply.message,
              linkStyle: TextStyle(
                color: Theme.of(context).primaryColor.withOpacity(0.9),
              ),
              onLinkTap: (value) {
                // TODO: handle tap event
              },
            );
          },
        );
      },
    );
  }
}
