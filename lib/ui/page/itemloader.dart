import 'package:flutter/material.dart';
import 'package:opencoolapk/data/model/feed/inlist_feed.dart';
import 'package:opencoolapk/data/model/card/image_carousel_card_1.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:opencoolapk/data/model/feed/indexV8_list.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;

class FeedItem extends StatelessWidget {
  Data entity;

  FeedItem(this.entity);

  @override
  Widget build(BuildContext context) {
    return FeedItemLoader.fromSingleData(context, entity);
  }
}

class FeedItemLoader {
  static Widget fromSingleData(BuildContext ctx, Data entity) {
    switch (entity.entityType) {
      case "card":
        switch (entity.entityTemplate) {
          case "imageCarouselCard_1":
            return _buildCarouselCard(
                ctx, ImageCarouselCard.fromJson(entity.source));
            break;
        }
        break;
      case "feed":
        switch (entity.entityTemplate) {
          case "feed":
            return _buildFeedFeedItem(ctx, Feed.fromJson(entity.source));
            break;
        }
        break;
    }
    return Card(
      elevation: 0,
      shape: Border.all(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("未实现的"),
          Text(entity.title),
          Text(entity.entityType),
          Text(entity.entityTemplate)
        ],
      ),
    );
  }

  static Widget _buildFeedFeedItem(BuildContext ctx, Feed entity) {
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
              backgroundImage: NetworkImage(entity.userAvatar),
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
                color: Theme.of(ctx).textTheme.body1.color,
                fontWeight: FontWeight.w600),
            linkStyle: TextStyle(color: Theme.of(ctx).primaryColor),
            onLinkTap: (v) {},
            customRender: (node, child) {},
          ),
          Builder(builder: (ctx) {
            if (entity.pic.length < 4) return Container();
            var pxxp = entity.pic.substring(
                entity.pic.toString().indexOf("@") + 1,
                entity.pic.toString().lastIndexOf("."));
            var sr =
                (int.parse(pxxp.split("x")[0]) / int.parse(pxxp.split("x")[1]));
            // picArr
            var wid;
            if (sr < 1 && entity.picArr.length > 1) {
              var js = 0;
              wid = Row(
                children: entity.picArr.map((pic) {
                  js++;
                  if (js <= MediaQuery.of(ctx).size.width / 150) {
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
                                      image: NetworkImage(pic)),
                                ))),
                      ),
                    );
                  } else {
                    return Container();
                  }
                }).toList(),
              );
            } else {
              wid = AspectRatio(
                  aspectRatio: sr < 0.5 ? 0.5 : sr,
                  child: Container(
                      decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(6.0),
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(entity.pic)),
                  )));
            }
            return LimitedBox(
              maxHeight: MediaQuery.of(ctx).size.height / 2.8,
              child: wid,
            );
          }),
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
              : Container(),
        ],
      ),
    );
  }

  static Widget _buildCarouselCard(BuildContext ctx, ImageCarouselCard entity) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(ctx).cardTheme.color,
      ),
      padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
      child: CarouselSlider(
        viewportFraction: 0.95,
        aspectRatio: 28.4 / 9,
        enlargeCenterPage: true,
        autoPlay: true,
        items: entity.entities.map((e) {
          return Builder(
            builder: (ctx) {
              return InkWell(
                  child: Container(
                    width: MediaQuery.of(ctx).size.width,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        image: DecorationImage(image: NetworkImage(e.pic))),
                  ),
                  onTap: () {
                    Scaffold.of(ctx).showSnackBar(SnackBar(
                      content: Text("还没实现"),
                      action: SnackBarAction(
                        label: "ok",
                        onPressed: () {},
                      ),
                    ));
                  });
            },
          );
        }).toList(),
      ),
    );
  }
}
