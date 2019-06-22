import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:opencoolapk/data/model/feed/inlist_feed.dart';

class FeedFeedItem extends StatelessWidget {
  final Feed entity;
  const FeedFeedItem(this.entity, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ctx = context;
    return Card(
      elevation: 0,
      shape: Border.all(width: 0, style: BorderStyle.none),
      child: InkWell(
        onTap: () {}, // 点击事件
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildFeedHead(ctx, entity),
              _buildFeedContent(ctx, entity),
              _buildFeedFooter(ctx, entity),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildFeedFooter(BuildContext ctx, Feed entity) {
    var ua = entity.source['userAction'];
    var cl = Theme.of(ctx).iconTheme.color.withOpacity(0.4);
    var tcl = Theme.of(ctx).primaryColor.withOpacity(0.8);
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        FlatButton.icon(
          onPressed: () {},
          icon: Icon(Icons.thumb_up,
              color: ua == null ? cl : ua['like'].toString() == "1" ? tcl : cl),
          label: Text("${entity.likenum} 赞",
              style: TextStyle(
                  color: ua == null
                      ? cl
                      : ua['like'].toString() == "1" ? tcl : cl)),
        ),
        FlatButton.icon(
          onPressed: () {},
          icon: Icon(Icons.comment, color: cl),
          label: Text("${entity.replynum} 回复", style: TextStyle(color: cl)),
        ),
        FlatButton.icon(
          onPressed: () {},
          icon: Icon(Icons.send, color: cl),
          label: Text("${entity.shareNum} 转发", style: TextStyle(color: cl)),
        ),
      ],
    );
  }

  static Widget _buildFeedHead(BuildContext ctx, Feed entity) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 9),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                entity.userAvatar,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(2, 0, 0, 0),
                  child: Text(
                    entity.username,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Html(
                  data: entity.infoHtml +
                      "  " +
                      entity.info +
                      "  " +
                      entity.deviceTitle,
                  padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                  defaultTextStyle:
                      TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
                )
              ],
            ),
          ),
          PopupMenuButton(
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: Theme.of(ctx).iconTheme.color.withOpacity(0.5),
            ),
            onSelected: (value) {
              switch (value) {
                case 4:
                  showModalBottomSheet(
                      context: ctx,
                      builder: (ctx) {
                        return Container(
                          padding: EdgeInsets.all(16),
                          child: TextField(
                            maxLines: 100,
                            controller: TextEditingController(
                                text: entity.toJson().toString()),
                          ),
                        );
                      });
                  break;
              }
            },
            itemBuilder: (ctx) {
              return [
                PopupMenuItem(
                  value: 1,
                  child: Text("收藏"),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Text("复制"),
                ),
                PopupMenuItem(
                  value: 3,
                  child: Text("举报"),
                ),
                PopupMenuItem(
                  value: 4,
                  child: Text("显示原数据"),
                ),
              ];
            },
          )
        ],
      ),
    );
  }

  static Widget _buildFeedContent(BuildContext ctx, Feed entity) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Html(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 7),
              data: entity.message,
              defaultTextStyle: TextStyle(
                  fontSize: 15.8,
                  color: Theme.of(ctx).textTheme.body1.color,
                  fontWeight: FontWeight.w600),
              linkStyle: TextStyle(color: Theme.of(ctx).primaryColor),
              onLinkTap: (v) {
                print(v);
              }),
          _buildContentImage(ctx, entity),
          entity.feedType == "comment"
              ? RawChip(
                  backgroundColor: Theme.of(ctx).primaryColor.withOpacity(0.1),
                  label: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage(entity.tpic),
                        radius: 8,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                      ),
                      Text(entity.ttitle)
                    ],
                  ))
              : const SizedBox(),
        ],
      ),
    );
  }

  static _buildContentImage(ctx, entity) {
    if (entity.pic.length < 4) return const SizedBox();
    var pxxp = entity.pic.substring(entity.pic.toString().indexOf("@") + 1,
        entity.pic.toString().lastIndexOf("."));
    var sr = (int.parse(pxxp.split("x")[0]) / int.parse(pxxp.split("x")[1]));
    // picArr
    var wid;
    if (sr < 1 && entity.picArr.length > 1) {
      var js = 0;
      wid = Row(
        children: entity.picArr.map<Widget>((pic) {
          js++;
          if (js <= ((MediaQuery.of(ctx).size.width / 300) > 3 ? 3 : MediaQuery.of(ctx).size.width / 300)) {
            return Expanded(
              child: Container(
                height: double.maxFinite,
                child: AspectRatio(
                  aspectRatio: sr < 0.5 ? 0.5 : sr,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(2, 0, 2, 0),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(6.0),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.network(
                          entity.pic,
                          width: double.minPositive,
                          filterQuality: FilterQuality.low,
                        ).image,
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        }).toList(),
      );
    } else {
      wid = AspectRatio(
        aspectRatio: sr < 0.5 ? 0.5 : sr,
        child: Image.network(
          entity.pic,
          filterQuality: FilterQuality.low,
        ),
      );
    }
    return LimitedBox(
      maxHeight: MediaQuery.of(ctx).size.height / 2.8,
      child: wid,
    );
  }
}
