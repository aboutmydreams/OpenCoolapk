import 'package:flutter/material.dart';

class ImageCardItem extends StatelessWidget {
  final Map<String, dynamic> data;
  const ImageCardItem(this.data, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: Border.all(width: 0, style: BorderStyle.none),
      child: InkWell(
        onTap: () {
          // data['url'] jump
        }, // 点击事件
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(data['title'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),),
              Divider(),
              AspectRatio(
                aspectRatio: 3,
                child: LimitedBox(
                  child: Image.network(data['pic']),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
