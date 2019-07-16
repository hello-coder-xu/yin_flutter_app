import 'package:flutter/material.dart';

///页面滚动
class PageViewPage extends StatefulWidget {
  @override
  _PageViewPageState createState() => _PageViewPageState();
}

class _PageViewPageState extends State<PageViewPage> {
  int position = 0;
  PageController controller;

  @override
  void initState() {
    super.initState();
    controller = new PageController(initialPage: position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('PageView视图'),
        centerTitle: true,
      ),
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverList(
            delegate: new SliverChildListDelegate(
              <Widget>[
                ListTile(
                  title: new Text('PageView基础使用'),
                  subtitle: new Text('滚动到第${position + 1}页'),
                ),
                Container(
                  height: 100,
                  child: PageView(
                    controller: controller,
                    onPageChanged: (value) => pageChangeValue(value),
                    children: <Widget>[OnePage(), TwoPage()],
                  ),
                ),
                Container(
                  height: 100,
                  child: PageView(
                    controller: controller,
                    onPageChanged: (value) => pageChangeValue(value),
                    children: <Widget>[
                      Container(
                        color: Colors.yellow,
                        alignment: Alignment.center,
                        child: new Icon(Icons.bluetooth, color: Colors.black, size: 32.0),
                      ),
                      Container(
                        color: Colors.blue,
                        alignment: Alignment.center,
                        child: new Icon(Icons.accessibility, color: Colors.black, size: 32.0),
                      ),
                      Container(
                        color: Colors.red,
                        alignment: Alignment.center,
                        child: new Icon(Icons.cake, color: Colors.black, size: 32.0),
                      ),
                    ],
                  ),
                ),
                ListTile(subtitle: new Text('页面不自动回弹')),
                Container(
                  height: 100,
                  child: PageView(
                    pageSnapping: false,
                    children: <Widget>[
                      Container(
                        color: Colors.yellow,
                        alignment: Alignment.center,
                        child: new Icon(Icons.bluetooth, color: Colors.black, size: 32.0),
                      ),
                      Container(
                        color: Colors.blue,
                        alignment: Alignment.center,
                        child: new Icon(Icons.accessibility, color: Colors.black, size: 32.0),
                      ),
                      Container(
                        color: Colors.red,
                        alignment: Alignment.center,
                        child: new Icon(Icons.cake, color: Colors.black, size: 32.0),
                      ),
                    ],
                  ),
                ),
                ListTile(subtitle: new Text('垂直滚动')),
                Container(
                  height: 100,
                  child: PageView(
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
                      Container(
                        color: Colors.yellow,
                        alignment: Alignment.center,
                        child: new Icon(Icons.bluetooth, color: Colors.black, size: 32.0),
                      ),
                      Container(
                        color: Colors.blue,
                        alignment: Alignment.center,
                        child: new Icon(Icons.accessibility, color: Colors.black, size: 32.0),
                      ),
                      Container(
                        color: Colors.red,
                        alignment: Alignment.center,
                        child: new Icon(Icons.cake, color: Colors.black, size: 32.0),
                      ),
                    ],
                  ),
                ),
                ListTile(subtitle: new Text('子页面显示85%的区域')),
                Container(
                  height: 100,
                  child: PageView(
                    controller: new PageController(viewportFraction: 0.85),
                    children: <Widget>[
                      Container(
                        color: Colors.yellow,
                        alignment: Alignment.center,
                        child: new Icon(Icons.bluetooth, color: Colors.black, size: 32.0),
                      ),
                      Container(
                        color: Colors.blue,
                        alignment: Alignment.center,
                        child: new Icon(Icons.accessibility, color: Colors.black, size: 32.0),
                      ),
                      Container(
                        color: Colors.red,
                        alignment: Alignment.center,
                        child: new Icon(Icons.cake, color: Colors.black, size: 32.0),
                      ),
                    ],
                  ),
                ),
                ListTile(title: new Text('PageView.custom的使用')),
                Container(
                  height: 100,
                  child: new PageView.custom(
                    scrollDirection: Axis.horizontal,
                    childrenDelegate: new SliverChildBuilderDelegate(
                      (context, index) {
                        return new Container(
                          height: 100,
                          alignment: Alignment.center,
                          color: Colors.red[index * 100],
                          child: new Text(
                            '$index',
                            style: new TextStyle(fontSize: 48.0, color: Colors.white),
                          ),
                        );
                      },
                      childCount: 10,
                    ),
                  ),
                ),
                ListTile(title: new Text('PageView.builder的使用')),
                Container(
                  height: 100,
                  child: new PageView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return new Container(
                        height: 100,
                        alignment: Alignment.center,
                        color: Colors.blue[index * 100],
                        child: new Text(
                          '$index',
                          style: new TextStyle(fontSize: 48.0, color: Colors.white),
                        ),
                      );
                    },
                    itemCount: 9,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void pageChangeValue(value) {
    setState(() {
      position = value;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class OnePage extends StatefulWidget {
  @override
  OnePageState createState() => new OnePageState();
}

class OnePageState extends State<OnePage> {
  @override
  Widget build(BuildContext context) {
    return new Material(
      child: Container(
        alignment: Alignment.center,
        color: Colors.red,
      ),
    );
  }

  @override
  void initState() {
    print('test OnePage initState');
    super.initState();
  }

  @override
  void dispose() {
    print('test OnePage dispose');
    super.dispose();
  }

  @override
  void didUpdateWidget(OnePage oldWidget) {
    print('test OnePage didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    print('test OnePage didChangeDependencies');
    super.didChangeDependencies();
  }
}

class TwoPage extends StatefulWidget {
  @override
  TwoPageState createState() => new TwoPageState();
}

class TwoPageState extends State<TwoPage> {
  @override
  Widget build(BuildContext context) {
    return new Material(
      child: Container(
        alignment: Alignment.center,
        color: Colors.deepOrange,
      ),
    );
  }

  @override
  void initState() {
    print('test TwoPage initState');
    super.initState();
  }

  @override
  void dispose() {
    print('test TwoPage dispose');
    super.dispose();
  }

  @override
  void didUpdateWidget(TwoPage oldWidget) {
    print('test TwoPage didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    print('test TwoPage didChangeDependencies');
    super.didChangeDependencies();
  }
}
