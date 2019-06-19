import 'package:flutter/material.dart';
import 'package:opencoolapk/data/api/feed.dart';
import 'package:opencoolapk/data/model/feed/indexV8_list.dart';

import 'itemloader.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

class DataPage extends StatefulWidget {
  var sourceUrl = "";
  var tag = "";

  DataPage(this.tag, this.sourceUrl, {Key key}) : super(key: key);

  Future<List<dynamic>> getData() {
    return Future(() {});
  }

  _DataPageState createState() {
    return _DataPageState();
  }
}

class _DataPageState extends State<DataPage>
    with AutomaticKeepAliveClientMixin {
  int page = 1;
  String get lastItem => _data.length > 0
      ? (_data[_data.length - 1] as Data).entityId.toString()
      : "";
  List<dynamic> _data = [];

  var _hasSomeError = false;

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          !_refreshController.isLoading &&
          !_refreshController.isRefresh) {
        _nextPage();
      }
    });
    _refresh();
  }

  RefreshController _refreshController =
      RefreshController(initialRefresh: true);

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: _refreshController,
      enablePullUp: true,
      enablePullDown: true,
      onLoading: _nextPage,
      onRefresh: _refresh,
      child: _buildList(),
    );
  }

  Future _fetchData({page: 1, lastItem: ""}) async {
    try {
      print(page.toString() + "||" + lastItem);
      var resp =
          await FeedApi.indexV8(page: page.toString(), lastItem: lastItem);
      setState(() {
        _data.addAll(resp.data);
      });
    } catch (e) {
      print(e);
    } finally {
      if (_refreshController.isLoading) {
        _refreshController.loadComplete();
      }
      if (_refreshController.isRefresh) {
        _refreshController.refreshCompleted();
      }
    }
  }

  Future _refresh() async {
    this.page = 1;
    this._data.removeWhere((v) => true);
    this._fetchData();
  }

  Future _nextPage() async {
    this.page++;
    this._fetchData(page: this.page, lastItem: this.lastItem);
  }

  @override
  bool get wantKeepAlive => true;

  _buildList() {
    return ListView.builder(
      itemCount: _data.length,
      controller: _scrollController,
      itemBuilder: (ctx, pos) {
        return FeedItem(_data[pos]);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    _refreshController.dispose();
  }
}
