import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:opencoolapk/data/model/feed/detail.dart';

class PicBox extends StatelessWidget {
  final List<String> data;
  const PicBox(this.data, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        _buildCarousel(context),
        IconButton(icon: const Icon(Icons.arrow_back), onPressed: () {
          Navigator.pop(context);
        },)
      ],
    ));
  }

  _buildCarousel(context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      child: CarouselSlider(
        viewportFraction: 1.0,
        height: double.maxFinite,
        items: data.map((pic) {
          var pxxp = pic.substring(
              pic.toString().indexOf("@") + 1, pic.toString().lastIndexOf("."));
          var sr =
              (int.parse(pxxp.split("x")[0]) / int.parse(pxxp.split("x")[1]));
          return AspectRatio(
              aspectRatio: sr,
              child: Image.network(
                pic,
                fit: BoxFit.contain,
                width: double.minPositive,
                filterQuality: FilterQuality.high,
              ));
        }).toList(),
      ),
    );
  }
}
