import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:opencoolapk/data/api/api.dart';
import 'package:opencoolapk/data/sharedpreference.dart';
import 'package:opencoolapk/redux/global.dart';
import 'package:opencoolapk/ui/home.dart';
import 'package:redux/redux.dart';

void main() {
  Api.init();
  // final store = Store<GlobalState>(reducer, initialState: GlobalState.init());
  // runApp(OpenCoolapk(store));
}

class OpenCoolapk extends StatelessWidget {
  final Store<GlobalState> store;

  OpenCoolapk(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<GlobalState>(
        store: store,
        child: MaterialApp(
          title: 'Open Coolapk',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            fontFamily: "SourceHanSansSC-Light"
          ),
          home: HomePage(),
        ));
  }

}
