import 'package:flutter/material.dart';
import 'package:opencoolapk/data/api/feed.dart';
import 'package:opencoolapk/data/model/feed/indexV8_list.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'item/itemloader.dart';

enum DataFrom { indexV8 }

class DataPage extends StatefulWidget {
  final String title;
  final IconData icon;
  final DataFrom dataFrom;
  final int pageIndex;
  final GlobalKey<_DataPageState> key;

  DataPage(this.title, this.icon, this.dataFrom, this.pageIndex, this.key)
      : super(key: key);

  @override
  _DataPageState createState() => _DataPageState();

  // Future<List<dynamic>> getData() {
  //   return Future.value();
  // }
}

class _DataPageState extends State<DataPage>
    with AutomaticKeepAliveClientMixin {
  int page = 1;
  String get lastItem {
    var fid = "";
    _data.reversed.forEach((v) {
      var data = v as Data;
      if (data.entityId.toString().length > 6 && fid == '') {
        fid = data.entityId.toString();
        return;
      }
    });
    return fid;
  }

  List<dynamic> _data = [];

  @override
  bool get wantKeepAlive => true;

  RefreshController _refreshController =
      RefreshController(initialRefresh: true);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return PreferredSize(
      preferredSize: Size(double.maxFinite, double.maxFinite),
      child: SmartRefresher(
        controller: _refreshController,
        enablePullUp: true,
        enablePullDown: true,
        onLoading: _nextPage,
        onRefresh: _refresh,
        child: _buildList(),
      ),
    );
  }

  Future _fetchData({page: 1, lastItem: ""}) async {
    try {
      print(page.toString() + "||" + lastItem);
      var resp;
      switch (widget.dataFrom) {
        case DataFrom.indexV8:
          resp =
              await FeedApi.indexV8(page: page.toString(), lastItem: lastItem);
          break;
        default:
          resp =
              await FeedApi.indexV8(page: page.toString(), lastItem: lastItem);
      }
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

  refresh() {
    _refreshController.requestRefresh();
  }

  Future _refresh() async {
    this.page = 1;
    this._data.removeWhere((v) => true);
    this._fetchData();
  }

  _buildList() {
    return ListView.builder(
      itemCount: _data.length,
      itemBuilder: (ctx, pos) {
        return FeedItem(_data[pos]);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _refreshController.dispose();
  }
}
