import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:opencoolapk/data/model/user.dart';
import 'package:opencoolapk/redux/global.dart';
import 'package:opencoolapk/ui/myfeed.dart';
import 'package:opencoolapk/ui/setting.dart';

import 'home.dart' show HomePageState;
import 'login.dart';

class HomeDrawer extends StatelessWidget {
  final HomePageState homePageState;

  const HomeDrawer(this.homePageState, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      color: Theme.of(context).cardColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _DrawerHeader(homePageState),
          FutureBuilder(
            future: Future.delayed(Duration(seconds: 1), () {
              return 0;
            }),
            builder: (ctx, snap) {
              if (snap.hasData) {
                return _DrawerContent(homePageState);
              } else {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.all(32),
                    child: LimitedBox(
                      maxWidth: 60,
                      maxHeight: 60,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class _DrawerContent extends StatefulWidget {
  final HomePageState homePageState;
  const _DrawerContent(this.homePageState, {Key key}) : super(key: key);

  @override
  _DrawerContentState createState() => _DrawerContentState();
}

class _DrawerContentState extends State<_DrawerContent> {
  @override
  void initState() {
    super.initState();
    widget.homePageState.pageController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: <Widget>[
          StoreConnector<GlobalState, GlobalState>(
            converter: (store) => store.state,
            builder: (context, state) {
              if (!state.logged) return const SizedBox();
              return Container(
                width: double.maxFinite,
                child: _buildUserInfoCardAction(context, state.user),
              );
            },
          ),
          _DrawerListTile("头条", Icons.home, () {
            widget.homePageState.pageController.animateToPage(0,
                curve: Curves.easeOut, duration: Duration(milliseconds: 400));
          }, () {
            widget.homePageState.pages[0].key.currentState.refresh();
          },
              0,
              widget.homePageState.pageController.hasClients
                  ? widget.homePageState.pageController.page.round()
                  : -1),
          _DrawerListTile("上榜", Icons.brightness_high, () {
            widget.homePageState.pageController.animateToPage(1,
                curve: Curves.easeOut, duration: Duration(milliseconds: 400));
          }, () {
            widget.homePageState.pages[1].key.currentState.refresh();
          },
              1,
              widget.homePageState.pageController.hasClients
                  ? widget.homePageState.pageController.page.round()
                  : -1),
          _DrawerListTile("话题", Icons.comment, () {
            widget.homePageState.pageController.animateToPage(2,
                curve: Curves.easeOut, duration: Duration(milliseconds: 400));
          }, () {
            widget.homePageState.pages[2].key.currentState.refresh();
          },
              2,
              widget.homePageState.pageController.hasClients
                  ? widget.homePageState.pageController.page.round()
                  : -1),
        ],
      ),
    );
  }

  _buildUserInfoCardAction(BuildContext context, UserInfo user) {
    var tColor = Theme.of(context).textTheme.title.color;
    return Wrap(
      alignment: WrapAlignment.spaceAround,
      children: <Widget>[
        OutlineButton(
          child: Text(
            "动态",
            style: TextStyle(color: tColor, fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return MyFeedPage();
            }));
          },
        ),
        OutlineButton(
          child: Text(
            "关注",
            style: TextStyle(color: tColor, fontWeight: FontWeight.bold),
          ),
          onPressed: () {},
        ),
        OutlineButton(
          child: Text(
            "粉丝",
            style: TextStyle(color: tColor, fontWeight: FontWeight.bold),
          ),
          onPressed: () {},
        ),
        OutlineButton(
          child: Text(
            "收藏",
            style: TextStyle(color: tColor, fontWeight: FontWeight.bold),
          ),
          onPressed: () {},
        ),
        OutlineButton(
          child: Text(
            "消息",
            style: TextStyle(color: tColor, fontWeight: FontWeight.bold),
          ),
          onPressed: () {},
        ),
        OutlineButton(
          child: Text(
            "设置",
            style: TextStyle(color: tColor, fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return SettingPage();
            })).then((value) {
              if (value) { // 需要重载界面
                setState((){});
              }
            });
          },
        ),
      ],
    );
  }
}

class _DrawerListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final onPressed;
  final onRefresh;
  final int index;
  final int nowSelect;
  const _DrawerListTile(this.title, this.icon, this.onPressed, this.onRefresh,
      this.index, this.nowSelect,
      {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: FlatButton(
        onPressed: onPressed,
        color: _getColor(context, text: false),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(
              icon ?? Icons.home,
              color: _getColor(context, text: true),
            ),
            Text(
              title,
              style: TextStyle(color: _getColor(context, text: true)),
            ),
            IconButton(
              onPressed: this.onRefresh ?? () {},
              icon: Icon(Icons.refresh, color: _getColor(context, text: true)),
            )
          ],
        ),
      ),
    );
  }

  Color _getColor(ctx, {bool text: false}) {
    if (nowSelect == index) {
      if (text) {
        return Theme.of(ctx).primaryTextTheme.title.color;
      } else {
        return Theme.of(ctx).primaryColor.withOpacity(0.5);
      }
    } else {
      if (text) {
        return Theme.of(ctx).textTheme.title.color;
      } else {
        return Theme.of(ctx).primaryColor.withOpacity(0.1);
      }
    }
  }
}

class _DrawerHeader extends StatelessWidget {
  final HomePageState homePageState;
  const _DrawerHeader(this.homePageState, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<GlobalState, GlobalState>(
        converter: (store) => store.state,
        builder: (context, state) {
          if (!state.logged) {
            return Padding(
              padding: EdgeInsets.all(8),
              child: Align(
                alignment: Alignment.center,
                child: OutlineButton.icon(
                  icon: Icon(Icons.person),
                  label: Text("登录"),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (ctx) {
                      return LoginPage();
                    }));
                  },
                ),
              ),
            );
          }
          return Container(
              height: 300,
              padding: EdgeInsets.all(0),
              child: Card(
                child: Stack(
                  children: <Widget>[
                    Image.network(
                      state.user.cover ?? "",
                      width: double.maxFinite,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      decoration: new BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(0.5),
                              Colors.black.withOpacity(0.35),
                              Colors.black.withOpacity(0.1),
                              Colors.black.withOpacity(0.0),
                              Colors.black.withOpacity(0.0)
                            ]),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: _buildUserInfoCard(context, state.user),
                    ),
                  ],
                ),
              ));
        });
  }

  _buildUserInfoCard(BuildContext context, UserInfo user) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            user.username,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Theme.of(context).primaryTextTheme.title.color),
          ),
        ],
      ),
    );
  }
} // _buildUserInfoCard
