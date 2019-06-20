import 'package:flutter/material.dart';
import 'package:opencoolapk/data/api/api.dart';
import 'package:opencoolapk/ui/home.dart';

void main() {
  Api.init();
  runApp(OpenCoolapk());
}

class OpenCoolapk extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Open Coolapk',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: "SourceHanSansSC-Light",
      ),
      home: HomePage(),
    );
  }
}
