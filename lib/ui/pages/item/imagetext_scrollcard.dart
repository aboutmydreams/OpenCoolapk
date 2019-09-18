import 'package:flutter/material.dart';
import 'package:opencoolapk/data/model/card/image_text_scroll_card.dart';

class ImageTextScrollCardItem extends StatelessWidget {
  final ImageTextScrollCard entity;
  const ImageTextScrollCardItem(this.entity, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: Border.all(width: 0, style: BorderStyle.none),
      child: AspectRatio(
        aspectRatio: 3.5,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: entity.entities.map((e) {
            return Container(
              padding: EdgeInsets.all(8),
              child: AspectRatio(
                aspectRatio: 2.5,
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: double.maxFinite,
                      height: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.network(
                              e.pic,
                              width: double.maxFinite,
                            ).image),
                      ),
                    ),
                    Container(
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
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
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          e.title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color:
                                Theme.of(context).primaryTextTheme.title.color,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                    )
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
