import 'package:flutter/material.dart';
import 'package:opencoolapk/data/model/feed/inlist_feed.dart';
import 'package:opencoolapk/data/model/card/image_carousel_card_1.dart';
import 'package:opencoolapk/data/model/feed/indexV8_list.dart';
import 'package:opencoolapk/ui/pages/item/carouselcard.dart';
import 'package:opencoolapk/ui/pages/item/feedfeed.dart';

class FeedItem extends StatelessWidget {
  final Data entity;

  FeedItem(this.entity);

  @override
  Widget build(BuildContext context) {
    return FeedItemLoader.fromSingleData(context, entity);
  }
}

class FeedItemLoader {
  static Widget fromSingleData(BuildContext ctx, Data entity) {
    switch (entity.entityType) {
      case "card":
        switch (entity.entityTemplate) {
          case "imageCarouselCard_1":
            return _buildCarouselCard(
                ctx, ImageCarouselCard.fromJson(entity.source));
            break;
        }
        break;
      case "feed":
        switch (entity.entityTemplate) {
          case "feed":
            return _buildFeedFeedItem(ctx, Feed.fromJson(entity.source));
            break;
        }
        break;
    }
    return Card(
      elevation: 0,
      shape: Border.all(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("未实现的"),
          Text(entity.title),
          Text(entity.entityType),
          Text(entity.entityTemplate)
        ],
      ),
    );
  }

  static Widget _buildFeedFeedItem(BuildContext ctx, Feed entity) {
    return FeedFeedItem(entity);
  }
  
  static Widget _buildCarouselCard(BuildContext ctx, ImageCarouselCard entity) {
    return CarouselCardItem(entity);
  }
}
