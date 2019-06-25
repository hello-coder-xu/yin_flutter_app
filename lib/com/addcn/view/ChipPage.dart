import 'package:flutter/material.dart';
import 'package:yin_utils/yin_utils.dart';

///标签
class ChipPage extends StatefulWidget {
  @override
  _ChipPageState createState() => _ChipPageState();
}

class _ChipPageState extends State<ChipPage> {
  int selectValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('标签视图'),
        centerTitle: true,
      ),
      body: new Column(
        children: <Widget>[
          ListTile(title: new Text('Chip')),
          new Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: <Widget>[
              Chip(label: new Text('语文')),
              new SizedBox(width: 10),
              Chip(
                label: new Text('历史'),
                backgroundColor: Colors.green,
              ),
              Chip(
                label: new Text('历史'),
                backgroundColor: Colors.green,
                avatar: CircleAvatar(
                  backgroundColor: Colors.red,
                  child: new Text(
                    '旭',
                    style: new TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Chip(
                label: new Text('历史'),
                backgroundColor: Colors.green,
                avatar: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://gss0.bdstatic.com/-4o3dSag_xI4khGkpoWK1HF6hhy/baike/w%3D268%3Bg%3D0/sign=ab1d80c6d533c895a67e9f7de92814cd/b3b7d0a20cf431ad6fd6b4684736acaf2edd985f.jpg"),
                ),
              ),
              Chip(
                label: new Text('数学'),
                onDeleted: () {
                  TsUtil.showShort(value: "删除数学");
                },
              ),
              Chip(
                label: new Text('化学'),
                onDeleted: () {
                  TsUtil.showShort(value: "删除化学");
                },
                deleteIcon: Icon(Icons.delete),
                deleteIconColor: Colors.red,
              ),
            ],
          ),
          ListTile(title: new Text('ActionChip')),
          new Wrap(
            alignment: WrapAlignment.center,
            children: <Widget>[
              ActionChip(
                label: new Text('我是标签按钮'),
                onPressed: () {},
              ),
              new SizedBox(width: 10),
              ActionChip(
                backgroundColor: Colors.green,
                label: new Text('我是标签按钮'),
                onPressed: () {},
              ),
              new SizedBox(width: 10),
              ActionChip(
                avatar: CircleAvatar(
                  backgroundColor: Colors.red,
                  child: new Text(
                    '旭',
                    style: new TextStyle(color: Colors.white),
                  ),
                ),
                label: new Text('我是标签按钮'),
                onPressed: () {},
              ),
            ],
          ),

          ListTile(title: new Text('FilterChip')),
          new Wrap(
            alignment: WrapAlignment.center,
            children: <Widget>[
              FilterChip(
                label: new Text('语文'),
                selected: selectValue == 0,
                selectedColor: Colors.red,
                onSelected: (value) => filterChange(0),
              ),
              new SizedBox(width: 8.0),
              FilterChip(
                label: new Text('数学'),
                selected: selectValue == 1,
                selectedColor: Colors.red,
                onSelected: (value) => filterChange(1),
              ),
              new SizedBox(width: 8.0),
              FilterChip(
                label: new Text('英语'),
                selected: selectValue == 2,
                selectedColor: Colors.red,
                onSelected: (value) => filterChange(2),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void filterChange(int value) {
    setState(() {
      selectValue = value;
    });
  }
}
