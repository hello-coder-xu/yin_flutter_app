import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/com/addcn/view/ListViewRefreshAndMorePage.dart';

///列表视图
class ListViewPage extends StatefulWidget {
  @override
  ListViewPageState createState() => new ListViewPageState();
}

class ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('列表视图'),
      ),
      body: Align(
        child: Column(
          children: <Widget>[
            RaisedButton(
              textColor: Colors.white,
              child: new Text('数量确定'),
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context) => ListViewNumber()));
              },
              color: Colors.red[400],
            ),
            RaisedButton(
              textColor: Colors.white,
              child: new Text('不数量确定'),
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context) => ListViewNotSureNumber()));
              },
              color: Colors.red[500],
            ),
            RaisedButton(
              textColor: Colors.white,
              child: new Text('水平滚动'),
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context) => ListViewHorizontal()));
              },
              color: Colors.red[600],
            ),
            RaisedButton(
              textColor: Colors.white,
              child: new Text('加载更多'),
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context) => ListViewRefreshAndMorePage()));
              },
              color: Colors.red[700],
            ),
          ],
        ),
      ),
    );
  }
}

///数量确定
class ListViewNumber extends StatelessWidget {
  ///子部件
  Widget getItemView(int index) {
    return Container(
      height: 100,
      margin: EdgeInsets.only(bottom: 10),
      color: Color.fromARGB(100, new Random().nextInt(255), new Random().nextInt(255), new Random().nextInt(255)),
      alignment: Alignment.center,
      child: new Text("$index", style: new TextStyle(fontSize: 24)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('数量确定listview'),
      ),
      body: ListView.custom(
        childrenDelegate: SliverChildListDelegate(
          <Widget>[
            getItemView(1),
            getItemView(2),
            getItemView(3),
            getItemView(4),
            getItemView(5),
            getItemView(6),
            getItemView(7),
            getItemView(8),
            getItemView(9),
          ],
        ),
      ),
    );
  }
}

///数量不确定
class ListViewNotSureNumber extends StatelessWidget {
  final int number = 100;

  ///子部件
  Widget getItemView(int index) {
    return Container(
      height: 100,
      margin: EdgeInsets.only(bottom: 10),
      color: Color.fromARGB(100, new Random().nextInt(255), new Random().nextInt(255), new Random().nextInt(255)),
      alignment: Alignment.center,
      child: new Text("$index", style: new TextStyle(fontSize: 24)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('数量不确定ListView'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return getItemView(index);
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: number),
    );
  }
}

///水平滚动
class ListViewHorizontal extends StatelessWidget {
  ///子部件
  Widget getItemView(int index) {
    return Container(
      height: 100,
      width: 100,
      margin: EdgeInsets.only(bottom: 10),
      color: Color.fromARGB(100, new Random().nextInt(255), new Random().nextInt(255), new Random().nextInt(255)),
      alignment: Alignment.center,
      child: new Text("$index", style: new TextStyle(fontSize: 24)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('数量确定listview'),
      ),
      body: ListView.custom(
        scrollDirection: Axis.horizontal,
        childrenDelegate: SliverChildListDelegate(
          <Widget>[
            getItemView(1),
            getItemView(2),
            getItemView(3),
            getItemView(4),
            getItemView(5),
            getItemView(6),
            getItemView(7),
            getItemView(8),
            getItemView(9),
          ],
        ),
      ),
    );
  }
}
