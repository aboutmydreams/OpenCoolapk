import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:opencoolapk/data/model/card/feed_scroll_card.dart';

class FeedScrollCardItemTypeAnswer extends StatelessWidget {
  final FeedScrollCardTypeAnswer entity;
  const FeedScrollCardItemTypeAnswer(this.entity, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _Item(
        this.entity.entities.map((e) {
          return _ItemData(e.userInfo, e.title, e.message, e.info, e.infoHtml,
              e.deviceTitle);
        }).toList(),
        "精彩回答");
  }
}

class FeedScrollCardItemTypeQuestion extends StatelessWidget {
  final FeedScrollCardTypeQuestion entity;
  const FeedScrollCardItemTypeQuestion(this.entity, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _Item(
        this.entity.entities.map((e) {
          return _ItemData(e.userInfo, e.title, e.message, e.info, e.infoHtml,
              e.deviceTitle);
        }).toList(),
        "等你来答");
  }
}

class _ItemData {
  final UserInfo userInfo;
  final String title;
  final String content;
  final String infoHtml;
  final String info;
  final String deviceTitle;
  _ItemData(this.userInfo, this.title, this.content, this.info, this.infoHtml,
      this.deviceTitle);
}

class _Item extends StatelessWidget {
  final List<_ItemData> datas;
  final String topTitle;
  const _Item(this.datas, this.topTitle, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.3,
      child: Card(
        elevation: 0,
        child: Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Text(
                        topTitle,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_right),
                    onPressed: () {
                      // 显示更多
                    },
                  )
                ],
              ),
              Expanded(
                // 下半部分
                child: ListView(
                  padding: EdgeInsets.only(right: 12),
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  semanticChildCount: datas.length,
                  children: datas.map<Widget>((data) {
                    return _buildCardDetail(context, data);
                  }).toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardDetail(context, _ItemData data) {
    return Padding(
      padding: EdgeInsets.only(left: 12),
      child: Card(
        elevation: 0,
        shape: Border.all(width: 1, color: Theme.of(context).dividerColor),
        child: InkWell(
          child: AspectRatio(
            aspectRatio: 1.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 8, 0, 0),
                  child: _buildCardDetailHead(context, data),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 6),
                  child: Text(
                    data.title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Divider(),
                Expanded(
                    child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Html(
                    data: data.content,
                    padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                    linkStyle: TextStyle(color: Theme.of(context).primaryColor),
                    onLinkTap: (value) {
                      // TODO: handle link tap
                    },
                  ),
                ))
              ],
            ),
          ),
          onTap: () {
            // TODO: card tap event
          },
        ),
      ),
    );
  }

  Widget _buildCardDetailHead(context, _ItemData data) {
    UserInfo entity = data.userInfo;
    var infoHtml = data.infoHtml;
    var info = data.info;
    var deviceTitle = data.deviceTitle;
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
                  data: infoHtml + "  " + info + "  " + deviceTitle,
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
              color: Theme.of(context).iconTheme.color.withOpacity(0.5),
            ),
            onSelected: (value) {
              switch (value) {
                case 4:
                  showModalBottomSheet(
                      context: context,
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

  Widget _buildCardDetailMenu() {
    return PopupMenuButton(
      icon: Icon(Icons.arrow_right),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: "",
            child: Text("收藏"),
          ),
          PopupMenuItem(
            value: "",
            child: Text("复制"),
          ),
          PopupMenuItem(
            value: "",
            child: Text("举报"),
          ),
        ];
      },
    );
  }
}
