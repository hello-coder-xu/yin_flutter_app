import 'package:flutter/material.dart';

//列表刷新与加载更多
class ListViewRefreshAndMorePage extends StatefulWidget {
  @override
  ListViewState createState() {
    return new ListViewState();
  }
}

class ListViewState extends State<ListViewRefreshAndMorePage> {
  List<String> list = [];
  ScrollController scrollController = new ScrollController();
  bool isLoading = false;
  bool isFinish = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      var position = scrollController.position;
      if (position.maxScrollExtent - position.pixels < 50) {
        loadMore();
      }
    });

    //生成数据
    generatData();
  }

  //生成数据
  void generatData() async {
    await Future.delayed(Duration(seconds: 2), () {
      list = List.generate(20, (i) => "初始化的数据$i");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('下拉刷新与加载更多'),
      ),
      body: new RefreshIndicator(
        color: Colors.deepOrangeAccent,
        backgroundColor: Colors.white,
        child: new ListView.separated(
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemBuilder: (context, index) {
            return getItemView(context, index);
          },
          controller: scrollController,
          itemCount: list.length == 0
              ? 0
              : isLoading ? list.length + 1 : list.length,
        ),
        onRefresh: onRefresh,
      ),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  //下拉刷新
  Future<void> onRefresh() async {
    await Future.delayed(Duration(seconds: 2), () {
      list = List.generate(15, (i) => "下拉的数据$i");
      setState(() {});
    });
  }

  //加载更多
  Future<void> loadMore() async {
    if (!isLoading) {
      isLoading = true;
      setState(() {});
      Future.delayed(Duration(seconds: 2), () {
        isLoading = false;
        list = List.from(list);
        list.addAll(List.generate(2, (index) => "上拉数据$index"));
        setState(() {});
      });

    }
  }

  ///没有更多
  Widget noMoreView() {
    return new Container(
      color: Colors.red,
      height: 60,
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 20, bottom: 20),
      child: new Text('沒有更多商品了'),
    );
  }


  //item视图
  Widget getItemView(BuildContext context, int position) {
    if (position < list.length) {
      return new Container(
        width: 160,
        child: new ListTile(
          title: new Text(list[position]),
          leading: new Icon(
            Icons.hourglass_empty,
            color: Colors.red,
          ),
          trailing: new Icon(Icons.keyboard_arrow_right),
        ),
      );
    }
    return moreView();
  }

  //更多视图
  Widget moreView() {
    return new Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 4.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              child: new Text(
                '加载中...',
                style: new TextStyle(fontSize: 16.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
