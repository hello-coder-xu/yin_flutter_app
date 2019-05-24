import 'package:flutter/material.dart';

///列表
class MyListViewSimple extends StatelessWidget {
  final item = new List<String>.generate(80, (i) => 'item $i');

  @override
  Widget build(BuildContext context) {
    Widget divider = Divider(height: 1, color: Colors.blue);

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Listview'),
      ),
      body: new ListView.separated(
        itemCount: item.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return getItemView('', Icons.email);
        },
        separatorBuilder: (context, index) {
          return divider;
        },
      ),
    );
  }
}

//item视图
Widget getItemView(String title, IconData icon) {
  return new Container(
    width: 160,
    child: new ListTile(
      title: new Text('item'),
      subtitle: new Text('sub'),
      leading: new Icon(
        Icons.email,
        color: Colors.red,
      ),
      trailing: new Icon(Icons.keyboard_arrow_right),
    ),
  );
}
