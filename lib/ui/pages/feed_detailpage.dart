import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:opencoolapk/data/api/feed.dart';
import 'package:opencoolapk/data/model/feed/detail.dart';
import 'package:opencoolapk/ui/pages/item/feedfeed.dart';
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
}
