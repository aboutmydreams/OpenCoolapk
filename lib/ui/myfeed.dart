import 'package:flutter/material.dart';
import 'package:opencoolapk/redux/global.dart';
import 'package:opencoolapk/ui/pages/datapage.dart';

class MyFeedPage extends StatefulWidget {
  const MyFeedPage({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _MyFeedPageState();
  }
}

class _MyFeedPageState extends State<MyFeedPage> {
  var page = DataPage("我的动态", Icons.person, DataFrom.myFeeds, 0,
      GlobalState.instance.user.uid, GlobalKey());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的动态"),
      ),
      body: page,
    );
  }
}
