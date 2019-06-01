import 'package:flutter/material.dart';
import 'package:yin_utils/yin_utils.dart';

///标题栏
class AppBarPage extends StatefulWidget {
  @override
  _AppBarPageState createState() => _AppBarPageState();
}

class _AppBarPageState extends State<AppBarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('appBar视图'),
      ),
      body: Align(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
          ],
        ),
      ),
    );
  }
}
