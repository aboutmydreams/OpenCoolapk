import 'package:flutter/material.dart';
import 'package:opencoolapk/data/sharedpreference.dart';
import 'package:opencoolapk/redux/global.dart';

class SettingPage extends StatefulWidget {
  SettingPage({Key key}) : super(key: key);

  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  var popWillRefreshState = false;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            pop();
          },
        ),
        title: Text("设置"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text("退出登录"),
            onTap: () {
              // 退出登录
              GlobalState.instance.user = null;
              SharedPreference.removeUserLoginInfo();
              popWillRefreshState = true;
              scaffoldKey.currentState.showSnackBar(SnackBar(
                content: Text("成功退出"),
                action: SnackBarAction(
                  label: "确定",
                  onPressed: () {},
                ),
              ));
            },
          )
        ],
      ),
    );
  }

  pop() {
    Navigator.pop(context, popWillRefreshState);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
