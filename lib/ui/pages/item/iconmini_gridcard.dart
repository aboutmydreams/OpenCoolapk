import 'package:flutter/material.dart';
import 'package:opencoolapk/data/model/card/icon_mini_grid_card.dart';

class IconMiniGridCardItem extends StatelessWidget {
  final IconMiniGridCard entity;
  const IconMiniGridCardItem(this.entity, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: Border.all(width: 0, style: BorderStyle.none),
      child: Container(
          padding: EdgeInsets.all(8),
          child: AspectRatio(
            aspectRatio: 4.5,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Text(
                          "话题推荐",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_right),
                      onPressed: () {
                        // TODO: handle 显示更多
                      },
                    )
                  ],
                ),
                Expanded(
                  child: Row(
                    children: entity.entities.map((entity) {
                      return Expanded(
                        child: InkWell(
                          onTap: () {
                            // url handle
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.network(
                                entity.logo,
                                width: 40,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8, right: 8),
                                child: Text(
                                  entity.title,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 12),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
