import 'package:flutter/material.dart';

///单选按钮
class RadioPage extends StatefulWidget {
  @override
  _RadioPageState createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {
  int radioGroup = 0;
  int radioListTileGroup = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('单选按钮'),
        centerTitle: true,
      ),
      body: Align(
        child: Column(
          children: <Widget>[
            ListTile(title: Text('Radio'), subtitle: new Text('颜色')),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Radio(
                  value: 1,
                  groupValue: 1,
                  onChanged: (value) => changeValue(value),
                  activeColor: Colors.deepPurple,
                ),
                Radio(
                  value: 1,
                  groupValue: 1,
                  onChanged: (value) => changeValue(value),
                  activeColor: Colors.red,
                ),
              ],
            ),
            ListTile(title: Text('Radio'), subtitle: new Text('群组+大小')),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 20,
                  height: 20,
                  color: Colors.grey,
                  alignment: Alignment.center,
                  child: Radio(
                    value: 1,
                    groupValue: radioGroup,
                    onChanged: (value) => changeValue(value),
                  ),
                ),
                Text('男'),
                Container(
                  width: 40,
                  height: 40,
                  color: Colors.grey,
                  alignment: Alignment.center,
                  child: Radio(
                    value: 2,
                    groupValue: radioGroup,
                    onChanged: (value) => changeValue(value),
                  ),
                ),
                Text('女'),
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.grey,
                  alignment: Alignment.center,
                  child: Radio(
                    value: 3,
                    groupValue: radioGroup,
                    onChanged: (value) => changeValue(value),
                  ),
                ),
                Text('其他'),
              ],
            ),
            ListTile(
              title: Text('RadioListTile'),
              subtitle: new Text('列表'),
            ),
            Column(
              children: <Widget>[
                RadioListTile(
                  value: 0,
                  groupValue: radioListTileGroup,
                  onChanged: (value) => changeListTile(value),
                  title: new Text('男'),
                  selected: radioListTileGroup == 0,
                ),
                RadioListTile(
                  value: 1,
                  groupValue: radioListTileGroup,
                  onChanged: (value) => changeListTile(value),
                  title: new Text('标题+副标题'),
                  subtitle: new Text('显示三行'),
                  isThreeLine: true,
                  selected: radioListTileGroup == 1,
                ),
                RadioListTile(
                  value: 2,
                  groupValue: radioListTileGroup,
                  onChanged: (value) => changeListTile(value),
                  title: new Text('右边图标'),
                  subtitle: new Text('选中颜色'),
                  secondary: Icon(Icons.bookmark_border),
                  selected: radioListTileGroup == 2,
                  activeColor: Colors.green,
                ),
                RadioListTile(
                  value: 3,
                  groupValue: radioListTileGroup,
                  onChanged: (value) => changeListTile(value),
                  title: new Text('浓缩'),
                  subtitle: new Text('我是副标题'),
                  dense: true,
                  selected: radioListTileGroup == 3,
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
      radioGroup = value;
    });
  }

  void changeListTile(value) {
    setState(() {
      radioListTileGroup = value;
    });
  }
}
