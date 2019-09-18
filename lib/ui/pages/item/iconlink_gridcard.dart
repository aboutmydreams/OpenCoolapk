import 'package:flutter/material.dart';
import 'package:opencoolapk/data/model/card/icon_link_grid_card.dart';

class IconLinkGridCardItem extends StatelessWidget {
  final IconLinkGridCard entity;

  const IconLinkGridCardItem(this.entity, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: Border.all(width: 0, style: BorderStyle.none),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Row(
          children: entity.entities.map((entity) {
            return Expanded(
              child: InkWell(
                onTap: () {
                  // url handle
                },
                child: Column(
                  children: <Widget>[
                    Image.network(
                      entity.pic,
                      width: 40,
                    ),
                    Text(entity.title)
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class DyhIconLinkGridCardItem extends StatelessWidget {
  final IconLinkGridCard entity;

  const DyhIconLinkGridCardItem(this.entity, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO:
    return const SizedBox();
  }
}
