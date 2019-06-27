import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:opencoolapk/data/api/api.dart';
import 'package:opencoolapk/data/api/feed.dart';
import 'package:opencoolapk/data/api/user.dart';
import 'package:opencoolapk/data/sharedpreference.dart';
import 'package:opencoolapk/redux/global.dart';
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
        "头条", Icons.home, DataFrom.indexV8, 0, GlobalKey(debugLabel: "头条")),
    DataPage("热榜", Icons.local_hotel, DataFrom.indexV8, 1,
        GlobalKey(debugLabel: "热榜")),
    DataPage(
        "话题", Icons.comment, DataFrom.indexV8, 2, GlobalKey(debugLabel: "话题"))
  ];

  @override
  void initState() {
    super.initState();
    SharedPreference.streamCtr.stream.listen((data) {
      if (data == SharedPreferenceInitEvent.done) {
        // sharedpreference init
        try {
          final sessid = SharedPreference.instance.getString("sessid");
          final token = SharedPreference.instance.getString("token");
          final uid = SharedPreference.instance.getString("uid");
          final un = SharedPreference.instance.getString("un");
          Api.setLoginInfo(sessid, token, uid, un);
          UserApi.getLoggedUserInfo(uid).then((info) {
            var mobile = info.mobile; // 用这个确定是否是登录成功
            if (mobile == null || mobile.toString() == "") {
              print("登录失败");
              SharedPreference.removeUserLoginInfo();
              throw new Exception("未成功登录");
            } else {
              setState(() {
                GlobalState.instance.user = info;
              });
            }
          });
        } catch (e) {
          print("没有登录信息");
        }
      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    SharedPreference.shutdown();
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
