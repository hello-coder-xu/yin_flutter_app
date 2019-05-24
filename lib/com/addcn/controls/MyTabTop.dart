import 'package:flutter/material.dart';

class MyTabTop extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TabBar();
}

class _TabBar extends State<MyTabTop> {
  TabController controller1;
  TabController controller2;

  final List<String> _tabValues = [
    '语文',
    '英语',
    '化学',
    '物理',
    '地理',
    '历史',
    '生物',
    '政治',
  ];

  @override
  void initState() {
    super.initState();
    controller1 = TabController(
      length: _tabValues.length,
      vsync: ScrollableState(),
    );

    controller2 = TabController(
      length: 3,
      vsync: ScrollableState(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBar'),
        bottom: getTab2(),
      ),
      body: TabBarView2(),
    );
  }

  Widget getTab1() {
    return new TabBar(
      //标签控件
      tabs: _tabValues.map((f) {
        return new Padding(
          padding: EdgeInsets.all(5),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Text(f),
            ],
          ),
        );
      }).toList(),
      //标签选择变化控制器
      controller: controller1,
      //底部颜色
      indicatorColor: Colors.white,
      //底部线长度
      indicatorSize: TabBarIndicatorSize.tab,
      //能否滚动
      isScrollable: true,
      //文字颜色
      labelColor: Colors.white,
      //未选中 文字颜色
      unselectedLabelColor: Colors.blue,
      //底部线 高度
      indicatorWeight: 1.0,
      //标签样式
      labelStyle: TextStyle(height: 4, color: Colors.green),
    );
  }

  Widget getTab2() {
    return new TabBar(
      controller: controller2,
      indicatorColor: Colors.blue,
      tabs: <Widget>[
        new Tab(
            icon: new Icon(
              Icons.directions_bike,
              color: Colors.blue,
            ),
            text: '123'),
        new Tab(
          icon: new Icon(Icons.directions_boat),
        ),
        new Tab(
          icon: new Icon(Icons.directions_bus),
        ),
      ],
    );
  }

  Widget TabBarView1() {
    return TabBarView(
      controller: controller1,
      children: _tabValues.map((f) {
        return Center(
          child: Text(f),
        );
      }).toList(),
    );
  }

  Widget TabBarView2() {
    return TabBarView(
      controller: controller2,
      children: <Widget>[
        new Center(
          child: Text('骑行'),
        ),
        new Center(
          child: Text('轮船'),
        ),
        new Center(
          child: Text('汽车'),
        ),
      ],
    );
  }
}
