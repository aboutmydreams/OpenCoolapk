import 'package:flutter/material.dart';
import 'package:opencoolapk/data/model/feed/indexV8_list.dart';

class RefreshCardItem extends StatelessWidget {
  final Data entity;
  const RefreshCardItem(this.entity, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Theme.of(context).primaryColorLight,
        elevation: 0,
        shape: Border.all(width: 0, style: BorderStyle.none),
        child: FlatButton(
          child: Text(
            "上次刷到这里,点击刷新",
            style: TextStyle(color: Theme.of(context).primaryTextTheme.title.color),
          ),
          onPressed: () {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text("抱歉，没有实现该功能，点击侧栏刷新按钮刷新。"),
              action: SnackBarAction(label: "OK", onPressed: () async {}),
            ));
          },
        ));
  }
}
