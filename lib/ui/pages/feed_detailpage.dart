import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:opencoolapk/data/model/feed/indexV8_list.dart';
import 'package:opencoolapk/ui/pages/item/feedfeed.dart';

class FeedDetailPage extends StatelessWidget {
  final Data data;
  const FeedDetailPage(this.data, {Key key}) : super(key: key);

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
          child: ListView(
            children: <Widget>[
              AppBar(title: Text(data.source['title'])),
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 16, 0, 0),
                    child: FeedHeadItem(
                        data.source['username'],
                        data.source['userAvatar'],
                        data.source['infoHtml'],
                        data.source['info'],
                        data.source['device_title'],
                        data.source.toString(), (type) {
                          // TODO: handle action
                        }),
                  ),
                  Html(
                    padding: EdgeInsets.all(16),
                    data: data.source['message'],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
