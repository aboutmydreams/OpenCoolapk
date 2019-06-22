import 'package:flutter/material.dart';
import 'package:opencoolapk/data/api/feed.dart';
import 'package:opencoolapk/ui/pages/datapage.dart';

import 'home_drawer.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  PageController pageController = PageController(initialPage: 0);

  List<DataPage> pages = [
    DataPage(
        "头条", Icons.home, FeedApi.indexV8, 0, GlobalKey(debugLabel: "头条1")),
    DataPage("热榜", Icons.local_hotel, FeedApi.indexV8, 1,
        GlobalKey(debugLabel: "头条2")),
    DataPage(
        "话题", Icons.comment, FeedApi.indexV8, 2, GlobalKey(debugLabel: "头条3"))
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          HomeDrawer(this),
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemBuilder: (ctx, idx) {
                return pages[idx];
              },
            ),
          ),
        ],
      ),
    );
  }
}
