import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:opencoolapk/data/model/card/image_carousel_card_1.dart';

class CarouselCardItem extends StatelessWidget {
  final ImageCarouselCard entity;
  const CarouselCardItem(this.entity, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
      ),
      padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
      child: CarouselSlider(
        viewportFraction: 0.95,
        aspectRatio: 28.4 / 9,
        enlargeCenterPage: true,
        autoPlay: true,
        items: entity.entities.map((e) {
          return Builder(
            builder: (ctx) {
              return InkWell(
                  child: Container(
                    width: MediaQuery.of(ctx).size.width,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        image: DecorationImage(image: NetworkImage(e.pic))),
                  ),
                  onTap: () {
                    Scaffold.of(ctx).showSnackBar(SnackBar(
                      content: Text("还没实现"),
                      action: SnackBarAction(
                        label: "ok",
                        onPressed: () {},
                      ),
                    ));
                  });
            },
          );
        }).toList(),
      ),
    );
  }
}
