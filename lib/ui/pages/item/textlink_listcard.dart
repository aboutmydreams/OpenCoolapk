import 'package:flutter/material.dart';

class TextLinkListCardItem extends StatelessWidget {
  final dynamic entity;
  const TextLinkListCardItem(this.entity, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var entities = entity['entities'];
    return Card(
      elevation: 0,
      shape: Border.all(width: 0, style: BorderStyle.none),
      child: Container(
          padding: EdgeInsets.all(16),
          child: GridView.custom(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 15,
              crossAxisCount: (MediaQuery.of(context).size.width / 600).round()
            ),
            shrinkWrap: true,
            childrenDelegate: SliverChildBuilderDelegate((ctx, idx) {
              return InkWell(
                onTap: () {
                  //url handle
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Row(children: <Widget>[//url
                    Image.network(entities[idx]['pic'], width: 30,),
                    Text(entities[idx]['title'])
                  ],),
                ),
              );
            }, childCount: entities.length),
          )),
    );
  }
}
