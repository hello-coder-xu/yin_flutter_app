import 'package:flutter/material.dart';
import 'package:yin_utils/yin_utils.dart';

///基础使用
class AppBarBasePage extends StatefulWidget {
  @override
  AppBarBasePageState createState() => new AppBarBasePageState();
}

class AppBarBasePageState extends State<AppBarBasePage> {
  int position = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('appBar基础使用'),
        centerTitle: true,
      ),
      body: Align(
        child: new Column(
          children: <Widget>[
            new AppBar(
              title: new Text('基础'),
              backgroundColor: Colors.green.shade900,
            ),
            new SizedBox(height: 16.0),
            new AppBar(
              title: new Text('居中'),
              centerTitle: true,
              backgroundColor: Colors.green.shade800,
            ),
            new SizedBox(height: 16.0),
            new AppBar(
              title: new Text('左图标'),
              leading: IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    TsUtil.showShort(value: "您点击菜单图标");
                  }),
              centerTitle: true,
              backgroundColor: Colors.green.shade700,
            ),
            new SizedBox(height: 16.0),
            new AppBar(
              title: new Text('右图标'),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {
                    TsUtil.showShort(value: "您点击设置图标");
                  },
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    TsUtil.showShort(value: "您点击搜索图标");
                  },
                ),
                IconButton(
                  icon: Icon(Icons.save),
                  onPressed: () {
                    TsUtil.showShort(value: "您点击保存图标");
                  },
                ),
              ],
              centerTitle: true,
              backgroundColor: Colors.green.shade700,
            ),
            new SizedBox(height: 16.0),
            new AppBar(
              title: new Container(
                margin: EdgeInsets.only(right: 48),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      child: new Text(
                        '第一个',
                        style: new TextStyle(color: position == 0 ? Colors.white : Colors.green),
                      ),
                      onPressed: () {
                        setState(() {
                          position = 0;
                        });
                      },
                      color: position == 0 ? Colors.red : Colors.white,
                    ),
                    RaisedButton(
                      child: new Text(
                        '第二个',
                        style: new TextStyle(color: position == 1 ? Colors.white : Colors.green),
                      ),
                      onPressed: () {
                        setState(() {
                          position = 1;
                        });
                      },
                      color: position == 1 ? Colors.red : Colors.white,
                    ),
                  ],
                ),
              ),
              centerTitle: true,
              backgroundColor: Colors.green.shade800,
            ),
          ],
        ),
      ),
    );
  }
}
