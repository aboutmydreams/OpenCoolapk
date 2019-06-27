import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:opencoolapk/data/api/feed.dart';
import 'package:opencoolapk/data/model/feed/detail.dart';
import 'package:opencoolapk/ui/pages/item/feedfeed.dart';
import 'package:opencoolapk/ui/pages/widget/picbox.dart';
import 'package:opencoolapk/ui/pages/widget/replylist.dart';

class FeedDetailPage extends StatelessWidget {
  final String feedId;
  final String title;
  const FeedDetailPage(this.feedId, this.title, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: double.infinity,
          width: MediaQuery.of(context).size.width > 900
              ? 900
              : (MediaQuery.of(context).size.width < 600
                  ? 600
                  : MediaQuery.of(context).size.width),
          color: Theme.of(context).cardColor,
          child: _FeedDetailContent(feedId, title),
        ),
      ),
    );
  }
}

class _FeedDetailContent extends StatefulWidget {
  final String feedId;
  final String title;
  _FeedDetailContent(this.feedId, this.title, {Key key}) : super(key: key);

  __FeedDetailContentState createState() => __FeedDetailContentState();
}

class __FeedDetailContentState extends State<_FeedDetailContent>
    with SingleTickerProviderStateMixin {
  FeedDetail data;
  TabController _tabController;

  var _tabViews;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabViews = <Widget>[
      FeedReplyList(widget.feedId),
      const Text("等待实现"),
      const Text("等待实现")
    ];
    _tabController.addListener(() {
      setState(() {});
    });
  }

  Future<FeedDetail> fetchData() async {
    return await FeedApi.detail(widget.feedId);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(title: Text(widget.title)),
      body: FutureBuilder(
        future: fetchData(),
        builder: (context, snap) {
          if (snap.hasData) {
            this.data = snap.data; //
            return ListView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 16, 0, 0),
                      child: FeedHeadItem(
                          data.username,
                          data.userAvatar,
                          data.infoHtml,
                          data.info,
                          data.deviceTitle,
                          data.toJson().toString(),
                          (type) {}),
                    ),
                    Html(
                      padding: EdgeInsets.all(16),
                      data: data.message,
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    // TODO: handle tap
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return PicBox(data.picArr);
                        },
                      ),
                    );
                  },
                  child: _buildContentImage(context, data),
                ),
                Divider(),
                TabBar(
                  labelColor: Theme.of(context).primaryColor,
                  unselectedLabelColor:
                      Theme.of(context).primaryColor.withOpacity(0.5),
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: <Widget>[
                    const Tab(
                      text: "回复",
                    ),
                    const Tab(
                      text: "点赞",
                    ),
                    const Tab(
                      text: "转发",
                    )
                  ],
                  controller: _tabController,
                ),
                Divider(),
                _tabViews[_tabController.index]
              ],
            );
          } else if (snap.hasError) {
            return Center(
              child: Text("出现错误: \r\n" + snap.error.toString()),
            );
          } else {
            return CircularProgressIndicator();
          }
        },
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
          if (js <=
              ((MediaQuery.of(ctx).size.width / 300) > 3
                  ? 3
                  : MediaQuery.of(ctx).size.width / 300)) {
            return Expanded(
              child: Container(
                height: double.maxFinite,
                child: AspectRatio(
                  aspectRatio: sr < 0.5 ? 0.5 : sr,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(2, 0, 2, 0),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(ctx).dividerColor.withOpacity(0.1)),
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
