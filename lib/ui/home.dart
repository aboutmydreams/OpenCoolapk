import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:opencoolapk/ui/action.dart';
import 'package:opencoolapk/ui/page/datapage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int _nowPageIndex = 0;
  final List<Widget> _tabs = [
    Container(height: 26, child: Tab(
      text: "关注",
    )),
    Container(height: 26, child: Tab(
      text: "头条",
    )),
    Container(height: 26, child: Tab(
      text: "上榜",
    )),
    Container(height: 26, child: Tab(
      text: "话题",
    )),
    Container(height: 26, child: Tab(
      text: "问答",
    )),
    Container(height: 26, child: Tab(
      text: "视频",
    )),
  ];
  List<DataPage> _tabPages;
  TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
        bottomNavigationBar: _buildBottomNavBar());
  }

  @override
  void initState() {
    super.initState();
    _tabPages = _tabs.map((tab) {
      return DataPage("tab", "/main/indexV8");
    }).toList();
    _tabController = TabController(vsync: this, length: _tabs.length);
  }

  _buildAppBar() {
    return AppBar(
      leading: Container(
        width: 72.0,
        height: 72.0,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(33)),
        child: Icon(Icons.person),
      ),
      title: Container(
        alignment: Alignment.centerLeft,
        width: double.maxFinite,
        margin: EdgeInsets.fromLTRB(0, 12, 0, 12),
        padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
        child: Icon(Icons.search,
            size: 20, color: Theme.of(context).primaryTextTheme.body1.color),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Theme.of(context).textTheme.body1.color.withOpacity(0.2)),
      ),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.notifications), onPressed: () {})
      ],
      bottom: _nowPageIndex == 0 // 只在页面1 显示
          ? PreferredSize(child: TabBar(
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: _tabs,
              controller: _tabController,
            ), preferredSize: Size(double.maxFinite, 30),)
          : null,
    );
  }

  _buildBody() {
    return Container(
      child: TabBarView(
        controller: _tabController,
        children: _tabPages,
      ),
    );
  }

  _buildBottomNavBar() {
    return BottomNavigationBar(
        currentIndex: _nowPageIndex,
        onTap: (_index) {
          if (_index != 1) {
            setState(() {
              _nowPageIndex = _index;
            });
          }
          switch (_index) {
            case 1:
              Navigator.of(context).push(PageRouteBuilder(
                  opaque: false,
                  pageBuilder: (ctx, ani, secani) {
                    return ActionPage(ani);
                  }));
              break;
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Container(
              width: 4,
              height: 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: _nowPageIndex == 0
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).primaryColor.withOpacity(0.1),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
              child: Icon(Icons.add,
                  color: Theme.of(context).primaryIconTheme.color),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(8)),
            ),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Container(
              width: 4,
              height: 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: _nowPageIndex == 2
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).primaryColor.withOpacity(0.1),
              ),
            ),
          ),
        ]);
  }
}
