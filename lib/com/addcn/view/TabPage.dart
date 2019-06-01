import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';

///tab视图
class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Tab视图'),
        centerTitle: true,
      ),
      body: Align(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => TopTabPage(),
                  ),
                );
              },
              child: new Text(
                '正常顶部',
                style: new TextStyle(color: Colors.white),
              ),
              color: Colors.deepOrange,
            ),
            new RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => BottomTabPage(),
                  ),
                );
              },
              child: new Text(
                '正常底部',
                style: new TextStyle(color: Colors.white),
              ),
              color: Colors.deepOrange,
            ),
          ],
        ),
      ),
    );
  }
}

///顶部tab
class TopTabPage extends StatefulWidget {
  @override
  _TopTabPageState createState() => _TopTabPageState();
}

class _TopTabPageState extends State<TopTabPage> {
  int position = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: new AppBar(
          title: new Text('顶部tab'),
          bottom: new TabBar(
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.black45,
            tabs: <Widget>[
              new Tab(
                icon: new Icon(Icons.directions_car),
                text: "tab1",
              ),
              new Tab(
                icon: new Icon(Icons.directions_transit),
                text: "tab2",
              ),
              new Tab(
                icon: new Icon(Icons.directions_bike),
                text: "tab3",
              ),
            ],
          ),
        ),
        body: TabBarView(children: <Widget>[
          Icon(Icons.directions_car, size: 128.0, color: Colors.grey),
          Icon(Icons.directions_transit, size: 128.0, color: Colors.grey),
          Icon(Icons.directions_bike, size: 128.0, color: Colors.grey),
        ]),
      ),
    );
  }
}

/// 底部tab
class BottomTabPage extends StatefulWidget {
  @override
  _BottomTabPageState createState() => _BottomTabPageState();
}

class _BottomTabPageState extends State<BottomTabPage> {
  int position = 0;

  Widget contentView() {
    switch (position) {
      case 0:
        return Icon(Icons.directions_car, size: 128.0, color: Colors.grey);
      case 1:
        return Icon(Icons.directions_transit, size: 128.0, color: Colors.grey);
      case 2:
        return Icon(Icons.directions_bike, size: 128.0, color: Colors.grey);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('底部tab'),
        centerTitle: true,
      ),
      body: Align(
        child: contentView(),
      ),
      bottomNavigationBar: new BottomNavigationBar(
        currentIndex: position,
        onTap: (int index) => onTabChange(index),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            title: new Text('tab1'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_transit),
            title: new Text('tab1'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_bike),
            title: new Text('tab1'),
          ),
        ],
      ),
    );
  }

  void onTabChange(int index) {
    setState(() {
      this.position = index;
    });
  }
}
