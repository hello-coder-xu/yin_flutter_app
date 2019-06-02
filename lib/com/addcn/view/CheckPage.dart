import 'package:flutter/material.dart';

///多选视图
class CheckPage extends StatefulWidget {
  @override
  _CheckPageState createState() => _CheckPageState();
}

class _CheckPageState extends State<CheckPage> {
  bool chekcedValue = false;
  int selectPosition = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('多选视图'),
        centerTitle: true,
      ),
      body: Align(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListTile(title: new Text('ChekcBox按钮的不同颜色')),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Checkbox(
                  value: chekcedValue,
                  onChanged: (value) => changeValue(value),
                ),
                Checkbox(
                  value: chekcedValue,
                  onChanged: (value) => changeValue(value),
                  activeColor: Colors.green,
                ),
                Checkbox(
                  value: chekcedValue,
                  onChanged: (value) => changeValue(value),
                  activeColor: Colors.green,
                  checkColor: Colors.yellow,
                ),
              ],
            ),
            ListTile(title: new Text('ChekcBox按钮的不同大小')),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 20,
                  height: 20,
                  color: Colors.deepPurpleAccent,
                  alignment: Alignment.center,
                  child: Checkbox(
                    value: chekcedValue,
                    onChanged: (value) => changeValue(value),
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  margin: EdgeInsets.only(left: 5, right: 5),
                  alignment: Alignment.center,
                  color: Colors.deepPurpleAccent,
                  child: Checkbox(
                    value: chekcedValue,
                    onChanged: (value) => changeValue(value),
                  ),
                ),
                Container(
                  width: 80,
                  height: 80,
                  alignment: Alignment.center,
                  color: Colors.deepPurpleAccent,
                  child: Checkbox(
                    value: chekcedValue,
                    onChanged: (value) => changeValue(value),
                  ),
                ),
              ],
            ),
            ListTile(
              title: new Text('ChekcBoxListTile'),
              subtitle: new Text('列表'),
            ),
            Column(
              children: <Widget>[
                CheckboxListTile(
                  value: selectPosition == 0,
                  onChanged: (value) => chengeListTile(0),
                  subtitle: new Text('默认样式'),
                  title: new Text('我是标题0'),
                  selected: selectPosition == 0,
                  secondary: Icon(Icons.bookmark),
                ),
                CheckboxListTile(
                  value: selectPosition == 1,
                  onChanged: (value) => chengeListTile(1),
                  subtitle: new Text('我显示3行'),
                  title: new Text('选中颜色为紫色'),
                  selected: selectPosition == 1,
                  secondary: Icon(Icons.bookmark),
                  activeColor: Colors.deepPurpleAccent,
                  isThreeLine: true,
                ),
                CheckboxListTile(
                  value: selectPosition == 2,
                  onChanged: (value) => chengeListTile(2),
                  subtitle: new Text('内容浓缩'),
                  title: new Text('我是标题2'),
                  selected: selectPosition == 2,
                  secondary: Icon(Icons.bookmark),
                  dense: true,
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
      chekcedValue = value;
    });
  }

  void chengeListTile(value) {
    setState(() {
      selectPosition = value;
    });
  }
}
