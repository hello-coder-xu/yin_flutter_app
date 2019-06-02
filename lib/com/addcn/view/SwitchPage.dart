import 'package:flutter/material.dart';

///开关视图
class SwitchPage extends StatefulWidget {
  @override
  _SwitchPageState createState() => _SwitchPageState();
}

class _SwitchPageState extends State<SwitchPage> {
  bool open = false;
  int openListTile = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('开关视图'),
        centerTitle: true,
      ),
      body: new Align(
        child: new Column(
          children: <Widget>[
            ListTile(title: Text('switch'), subtitle: new Text('颜色')),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Switch(
                  value: open,
                  onChanged: (value) => changeValue(value),
                  activeColor: Colors.deepPurple,
                ),
                Switch(
                  value: open,
                  onChanged: (value) => changeValue(value),
                  activeColor: Colors.red,
                ),
              ],
            ),
            ListTile(title: Text('switch'), subtitle: new Text('群组+大小')),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 60,
                  height: 20,
                  color: Colors.grey,
                  alignment: Alignment.center,
                  child: Switch(
                    value: open,
                    onChanged: (value) => changeValue(value),
                  ),
                ),
                Text('男'),
                Container(
                  width: 120,
                  height: 40,
                  color: Colors.grey,
                  alignment: Alignment.center,
                  child: Switch(
                    value: open,
                    onChanged: (value) => changeValue(value),
                  ),
                ),
                Text('女'),
                Container(
                  width: 160,
                  height: 80,
                  color: Colors.grey,
                  alignment: Alignment.center,
                  child: Switch(
                    value: open,
                    onChanged: (value) => changeValue(value),
                  ),
                ),
                Text('其他'),
              ],
            ),
            ListTile(
              title: Text('SwitchListTile'),
              subtitle: new Text('列表'),
            ),
            Column(
              children: <Widget>[
                SwitchListTile(
                  value: openListTile == 0,
                  onChanged: (value) => changeListTile(0),
                  title: new Text('男'),
                  selected: openListTile == 0,
                ),
                SwitchListTile(
                  value: openListTile == 1,
                  onChanged: (value) => changeListTile(1),
                  title: new Text('标题+副标题'),
                  subtitle: new Text('显示三行'),
                  isThreeLine: true,
                  selected: openListTile == 1,
                ),
                SwitchListTile(
                  value: openListTile == 2,
                  onChanged: (value) => changeListTile(2),
                  title: new Text('左边图标'),
                  subtitle: new Text('选中颜色'),
                  secondary: Icon(Icons.bookmark_border),
                  selected: openListTile == 2,
                  activeColor: Colors.green,
                ),
                SwitchListTile(
                  value: openListTile == 3,
                  onChanged: (value) => changeListTile(3),
                  title: new Text('浓缩'),
                  subtitle: new Text('我是副标题'),
                  dense: true,
                  selected: openListTile == 3,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void changeValue(value) {
    setState(() {
      open = value;
    });
  }

  void changeListTile(value) {
    setState(() {
      openListTile = value;
    });
  }
}
