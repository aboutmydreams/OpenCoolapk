import 'package:flutter/material.dart';
import 'package:opencoolapk/data/api/feed.dart';
import 'package:opencoolapk/data/model/feed/indexV8_list.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'itemloader.dart';

class DataPage extends StatefulWidget {
  final String sourceUrl;
  final String tag;

  DataPage(this.tag, this.sourceUrl, {Key key}) : super(key: key);

  _DataPageState createState() {
    return _DataPageState();
  }

  Future<List<dynamic>> getData() {
    return Future.value();
  }
}

class _DataPageState extends State<DataPage>
    with AutomaticKeepAliveClientMixin {
  int page = 1;
  List<dynamic> _data = [];
  ScrollController _scrollController = ScrollController();

  //var _hasSomeError = false;

  RefreshController _refreshController =
      RefreshController(initialRefresh: true);

  String get lastItem => _data.length > 0
      ? (_data[_data.length - 1] as Data).entityId.toString()
      : "";

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SmartRefresher(
      controller: _refreshController,
      enablePullUp: true,
      enablePullDown: true,
      onLoading: _nextPage,
      onRefresh: _refresh,
      child: _buildList(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    _refreshController.dispose();
  }

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

  _buildList() {
    return ListView.builder(
      itemCount: _data.length,
      controller: _scrollController,
      itemBuilder: (ctx, pos) {
        return FeedItem(_data[pos]);
      },
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

  Future _nextPage() async {
    this.page++;
    this._fetchData(page: this.page, lastItem: this.lastItem);
  }

  Future _refresh() async {
    this.page = 1;
    this._data.removeWhere((v) => true);
    this._fetchData();
  }
}
