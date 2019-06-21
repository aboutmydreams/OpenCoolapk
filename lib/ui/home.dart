import 'package:flutter_redux/flutter_redux.dart';
import 'package:opencoolapk/redux/global.dart';

import 'package:flutter/material.dart';
import 'package:opencoolapk/ui/home_content.dart';
import 'package:opencoolapk/ui/login.dart';
import 'package:opencoolapk/data/model/user.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int _nowPageIndex = 0;

  List<Widget> _tabPages = [];

  @override
  void initState() {
    super.initState();
    _tabPages.add(HomeContent());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Container(
            width: 284,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                DrawerHeader(),
                DrawerContent(),
              ],
            ),
          ),
          Expanded(
            child: PageView.builder(
              itemCount: _tabPages.length,
              itemBuilder: (ctx, pos) {
                return _tabPages[pos];
              },
            ),
          )
        ],
      ),
    );
  }
}

class DrawerContent extends StatefulWidget {
  const DrawerContent({Key key}) : super(key: key);

  @override
  _DrawerContentState createState() => _DrawerContentState();
}

class _DrawerContentState extends State<DrawerContent> {
  int nowSelect = 0;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: <Widget>[
          DrawerListTile("头条", Icons.home, () {
            setState(() {
              nowSelect = 0;
            });
          }, () {}, 0, nowSelect),
          DrawerListTile("上榜", Icons.brightness_high, () {
            setState(() {
              nowSelect = 1;
            });
          }, () {}, 1, nowSelect),
          DrawerListTile("话题", Icons.comment, () {
            setState(() {
              nowSelect = 2;
            });
          }, () {}, 2, nowSelect),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final onPressed;
  final onRefresh;
  final int index;
  final int nowSelect;
  const DrawerListTile(this.title, this.icon, this.onPressed, this.onRefresh,
      this.index, this.nowSelect,
      {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: FlatButton(
        onPressed: onPressed,
        color: _getColor(context, text: false).withOpacity(0.5),
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
        return Theme.of(ctx).primaryColor;
      }
    } else {
      if (text) {
        return Theme.of(ctx).textTheme.title.color;
      } else {
        return Theme.of(ctx).cardColor;
      }
    }
  }
}

class DrawerHeader extends StatelessWidget {
  const DrawerHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      padding: EdgeInsets.all(0),
      child: Card(
        child: Stack(
          children: <Widget>[
            StoreConnector<GlobalState, UserInfo>(
                converter: (store) => store.state.nowUser,
                builder: (context, state) {
                  if (state == null) return Container();
                  return Image.network(state.cover ?? "");
                }),
            Align(
              alignment: Alignment.bottomCenter,
              child: StoreConnector<GlobalState, UserInfo>(
                  converter: (store) => store.state.nowUser,
                  builder: (context, state) {
                    if (state == null) {
                      return FlatButton.icon(
                          icon: Icon(Icons.person),
                          label: Text("登录"),
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (ctx) {
                              return LoginPage();
                            }));
                          });
                    } else {}
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
