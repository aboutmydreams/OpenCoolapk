import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActionPage extends StatefulWidget {
  Animation<double> ani;
  ActionPage(this.ani, {Key key}) : super(key: key);

  _ActionPageState createState() => _ActionPageState(ani);
}

class _ActionPageState extends State<ActionPage> {
  Animation<double> ani;
  _ActionPageState(this.ani);

  List<Widget> actionButtons = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: ani,
      builder: (context, w) {
        return BackdropFilter(
            filter: ImageFilter.blur(
                sigmaX: 6 *
                    Tween<double>(begin: 0.2, end: 1)
                        .animate(CurvedAnimation(
                            parent: ani,
                            curve: Interval(0, 1, curve: Curves.fastOutSlowIn)))
                        .value,
                sigmaY: 6 *
                    Tween<double>(begin: 0.2, end: 1)
                        .animate(CurvedAnimation(
                            parent: ani,
                            curve: Interval(0, 1, curve: Curves.fastOutSlowIn)))
                        .value),
            child: Container(
              child: Scaffold(
                  backgroundColor: Colors.black.withOpacity(0.3 *
                      Tween<double>(begin: 0.2, end: 1)
                          .animate(CurvedAnimation(
                              parent: ani,
                              curve:
                                  Interval(0, 1, curve: Curves.fastOutSlowIn)))
                          .value),
                  body: Container(
                      height: double.maxFinite,
                      alignment: Alignment.bottomCenter,
                      child: FadeTransition(
                        opacity: ani,
                        child: ScaleTransition(
                            scale: Tween<double>(begin: 0.2, end: 1).animate(
                                CurvedAnimation(
                                    parent: ani,
                                    curve: Interval(0, 1,
                                        curve: Curves.fastLinearToSlowEaseIn))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                _buildActionButton(
                                    title: "动态", color: Colors.green)
                              ],
                            )),
                      )),
                  bottomNavigationBar: _buildBottomBar()),
            ));
      },
    );
  }

  _buildBottomBar() {
    return ScaleTransition(
      scale: ani,
      child: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.black.withOpacity(0),
        onTap: (_idx) {
          Navigator.pop(context);
        },
        items: [
          BottomNavigationBarItem(title: Container(), icon: Container()),
          BottomNavigationBarItem(
            title: Container(),
            icon: Icon(
              Icons.close,
              color: Colors.white,
            ),
          ),
          BottomNavigationBarItem(title: Container(), icon: Container())
        ],
      ),
    );
  }

  _buildActionButton({icon: Icons.edit, title: "标题", color: Colors.blue}) {
    return Container(
      width: 80,
      height: 80,
      child: InkWell(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.8,
              child: Container(
                  child: AspectRatio(
                      aspectRatio: 1.8,
                      child: Icon(
                        icon,
                        color: Colors.white,
                      )),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(40),
                    color: color,
                  )),
            ),
            Text(
              title,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
